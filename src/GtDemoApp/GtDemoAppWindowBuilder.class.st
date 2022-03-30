Class {
	#name : #GtDemoAppWindowBuilder,
	#superclass : #Object,
	#category : #'GtDemoApp-UI'
}

{ #category : #building }
GtDemoAppWindowBuilder class >> install [

	| aSpace |
	
	GtWorld allInstances do: [ :eachWorld | eachWorld removeShutdownListener ].
	GtWorld allInstances do: [ :eachWorld | eachWorld close ].
	
	aSpace := self show.
	aSpace addEventHandler: BlSpaceShutdownOnCloseListener new.
	^ aSpace	
]

{ #category : #building }
GtDemoAppWindowBuilder class >> show [

	^ self new showSampleSpace
]

{ #category : #building }
GtDemoAppWindowBuilder >> sampleScene [

	<gtExample>
	| aContainer |
	aContainer := BrVerticalPane new
		              matchParent;
		              alignCenter.

	aContainer addChild: (BrLabel new
			 aptitude: (BrGlamorousLabelAptitude new fontSize: 30);
			 margin: (BlInsets bottom: 50);
			 text: 'This is a sample app!').

	aContainer addChild: (BrButton new
			 fitContent;
			 aptitude: BrGlamorousButtonWithLabelAptitude;
			 label: 'Open GToolkit';
			 action: [ :aButton | GtWorld openDefault removeShutdownListener ]).

	^ aContainer
]

{ #category : #building }
GtDemoAppWindowBuilder >> sampleSpace [

	<gtExample>
	^ BlSpace new
		  addChild: self sampleScene;
		  extent: 800 @ 600;
		  title: 'Sample Application'
]

{ #category : #building }
GtDemoAppWindowBuilder >> showSampleSpace [

	<gtExample>
	<noTest>
	^ self sampleSpace show
]
