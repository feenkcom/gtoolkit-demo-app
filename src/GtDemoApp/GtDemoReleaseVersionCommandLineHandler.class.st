Class {
	#name : #GtDemoReleaseVersionCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #'GtDemoApp-CommandLine'
}

{ #category : #accessing }
GtDemoReleaseVersionCommandLineHandler class >> commandName [

	^ 'releaseDemoApp'
]

{ #category : #activation }
GtDemoReleaseVersionCommandLineHandler >> activate [
	self activateHelp
		ifTrue: [  ^ self ].
	self arguments size > 1 ifTrue: [ 
		self inform: 'Releaser has only one argument: the new version it should use, e.g., v0.4.2' ].
	
	TranscriptLogger runDuring: [ 
		| releaseExporter workflow |
		releaseExporter := SoReleaseExporter new.
		
		self arguments isEmpty ifFalse:[ 
			| semanticVersion | 
			semanticVersion := (self argumentAt:1) asGtRlSemanticVersionNumber.
			releaseExporter forceNewRelease.
			releaseExporter enforcedVersion: semanticVersion ].
		
		workflow := releaseExporter buildReleaseWorkflow.
		workflow executeReleaseActions.
		
		GtImage gtDemoAppVersion: workflow rootProjectRelease version ].

	Smalltalk snapshot: true andQuit: true.
]

{ #category : #accessing }
GtDemoReleaseVersionCommandLineHandler >> description [

	^ 'Release new Gt Demo application version'
]
