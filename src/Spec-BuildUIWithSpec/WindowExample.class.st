Class {
	#name : #WindowExample,
	#superclass : #ComposablePresenter,
	#instVars : [
		'button1',
		'button2'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
WindowExample class >> defaultSpec [
	^ SpecRowLayout composed
		add: #button1; add: #button2; 
		yourself.

]

{ #category : #api }
WindowExample >> aboutText [
	^'Click + to grow, - to shrink.'
]

{ #category : #accessing }
WindowExample >> button1 [ 
	^button1
]

{ #category : #accessing }
WindowExample >> button2 [
	^button2
]

{ #category : #initialization }
WindowExample >> initializeWidgets [
	button1 := self newButton.
	button2 := self newButton.
	button1 label: '+'. 
	button2 label: '-'.
	button1 action: [ self window extent: 500@200 ].
	button2 action: [ self window extent: 200@100 ].
]

{ #category : #edits }
WindowExample >> okToChange [
	^true

]

{ #category : #api }
WindowExample >> title [ 
	^ 'Click to grow or shrink.'
]

{ #category : #api }
WindowExample >> windowIcon [
	^self iconNamed: #thumbsUp
]
