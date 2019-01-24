Class {
	#name : #TBAndListH,
	#superclass : #ComposablePresenter,
	#instVars : [
		'buttons',
		'list'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
TBAndListH class >> defaultSpec [ 
	^SpecRowLayout composed
		add: #buttons; add:#list;
		yourself
]

{ #category : #accessing }
TBAndListH >> buttons [ 
	^buttons
]

{ #category : #initialization }
TBAndListH >> initializeWidgets [ 
	buttons := self instantiate: TwoButtons.
	list := self newList.
	list items: (1 to: 10).
	
	self focusOrder
		add: buttons;
		add: list.
]

{ #category : #accessing }
TBAndListH >> list [ 
	^list
]

{ #category : #api }
TBAndListH >> title [ 
	^'TBAndListH'
]
