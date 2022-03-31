Class {
	#name : #GtDemoPrintVersionCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #'GtDemoApp-CommandLine'
}

{ #category : #accessing }
GtDemoPrintVersionCommandLineHandler class >> commandName [

	^ 'printDemoAppVersion'
]

{ #category : #accessing }
GtDemoPrintVersionCommandLineHandler class >> description [

	^ 'Print Gt Demo app version'
]

{ #category : #activation }
GtDemoPrintVersionCommandLineHandler >> activate [

	self activateHelp ifTrue: [ ^ self ].
	self stdout
		nextPutAll: (GtImage gtDemoAppVersion
				 ifNotNil: #versionString
				 ifNil: [ 'unknown' ]);
		nextPutAll: OSPlatform current lineEnding;
		flush.

	self quit
]
