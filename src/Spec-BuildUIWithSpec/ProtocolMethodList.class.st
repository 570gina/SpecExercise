Class {
	#name : #ProtocolMethodList,
	#superclass : #ComposableModel,
	#instVars : [
		'label',
		'methods'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
ProtocolMethodList class >> defaultSpec [
	^ SpecColumnLayout composed
	add: #label height: self toolbarHeight;
	add: #methods;
	yourself

]

{ #category : #initialization }
ProtocolMethodList >> initializeWidgets [
	methods := self newList.
	methods displayBlock: [ :m | m selector ].
	label := self newLabel.
	label label: 'Protocol'.
	self focusOrder add: methods.

]

{ #category : #'api-shortcuts' }
ProtocolMethodList >> items: aCollection [
	methods items: aCollection

]

{ #category : #acccessing }
ProtocolMethodList >> label [
	^label
]

{ #category : #'api-shortcuts' }
ProtocolMethodList >> label: aText [
	label label: aText

]

{ #category : #acccessing }
ProtocolMethodList >> methods [
	^methods
]

{ #category : #'api-shortcuts' }
ProtocolMethodList >> resetSelection [
	methods resetSelection
]

{ #category : #api }
ProtocolMethodList >> title [ 
	^ 'Protocol widget'
]

{ #category : #'events-shortcuts' }
ProtocolMethodList >> whenSelectedItemChanged: aBlock [
	methods whenSelectedItemChanged: aBlock
]
