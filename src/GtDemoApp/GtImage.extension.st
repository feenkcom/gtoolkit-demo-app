Extension { #name : #GtImage }

{ #category : #'*GtDemoApp' }
GtImage class >> gtDemoAppVersion [

	^ self instance gtDemoAppVersion
]

{ #category : #'*GtDemoApp' }
GtImage >> gtDemoAppVersion [

	<return: #GtRlSemanticVersionNumber or: nil>
	^ self
		  propertyAt: #gtDemoAppVersion
		  ifPresent: #value
		  ifAbsent: [ ^ nil ]
]

{ #category : #'*GtDemoApp' }
GtImage class >> gtDemoAppVersion: aVersion [

	self instance gtDemoAppVersion: aVersion
]

{ #category : #'*GtDemoApp' }
GtImage >> gtDemoAppVersion: aGtRlSemanticVersionNumber [

	self
		propertyAt: #gtDemoAppVersion
		put: (GtImagePluggableProperty new
				 name: 'Gt Demo App Version';
				 value: aGtRlSemanticVersionNumber;
				 description: aGtRlSemanticVersionNumber versionString)
]
