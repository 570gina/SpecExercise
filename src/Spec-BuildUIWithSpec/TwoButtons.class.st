Class {
	#name : #TwoButtons,
	#superclass : #ComposablePresenter,
	#instVars : [
		'button1',
		'button2'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
TwoButtons class >> buttonCol [
	^SpecColumnLayout composed
		add: #button1; add: #button2;
		yourself
]

{ #category : #specs }
TwoButtons class >> buttonRow [
	<spec: #default>.
	^SpecRowLayout composed
		add: #button1; add: #button2;
		yourself
]

{ #category : #accessing }
TwoButtons >> button1 [ 
	^button1
]

{ #category : #accessing }
TwoButtons >> button2 [ 
	^button2
]

{ #category : #initialization }
TwoButtons >> initializeWidgets [
	button1 := self newButton.
	button2 := self newButton.
	
	button1 label: '1'.
	button2 label: '2'.
	
	self focusOrder 
		add: button1;
		add: button2
]

{ #category : #api }
TwoButtons >> title [ 
	^'Two Buttons'
]
