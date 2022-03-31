Class {
	#name : #GtDemoReleaseExporter,
	#superclass : #Object,
	#instVars : [
		'releaseConfiguration'
	],
	#category : #'GtDemoApp-CommandLine'
}

{ #category : #building }
GtDemoReleaseExporter >> buildReleaseWorkflow [

	^ GtRlReleaserExportWorkflow
		  forBaseline: BaselineOfGtDemoApp
		  fromRepository: 'github://feenkcom/gtoolkit-demo-app:main/src'
		  withConfiguration: self releaseConfiguration
]

{ #category : #initialization }
GtDemoReleaseExporter >> defaultReleaseConfiguration [

	^ GtRlReleaseConfiguration new
		  defaultVersionNumber:
			  (GtRlSemanticVersionNumber major: 0 minor: 1 patch: 0);
		  defaultReleaseBranchName: 'release';
		  defaultVersionComputation: GtRlPatchVersionComputation new
]

{ #category : #configuration }
GtDemoReleaseExporter >> enforcedVersion: aVersion [

	self releaseConfiguration enforcedVersion: aVersion
]

{ #category : #configuration }
GtDemoReleaseExporter >> forceNewRelease [

	self releaseConfiguration forceNewRelease
]

{ #category : #initialization }
GtDemoReleaseExporter >> initialize [

	super initialize.
	releaseConfiguration := self defaultReleaseConfiguration
]

{ #category : #accessing }
GtDemoReleaseExporter >> releaseConfiguration [

	^ releaseConfiguration
]
