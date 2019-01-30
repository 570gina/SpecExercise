Class {
	#name : #DynamicArrayViewer,
	#superclass : #DynamicComposablePresenter,
	#instVars : [
		'collection',
		'label'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #initialize }
DynamicArrayViewer class >> on: aCollection [
	| inst |
	inst := self basicNew.
	inst collection: aCollection.
	inst initialize.
	^inst.
]

{ #category : #accessing }
DynamicArrayViewer >> collection [ 
	^collection
]

{ #category : #accessing }
DynamicArrayViewer >> collection: aCollection [
	collection := aCollection.
]

{ #category : #initialization }
DynamicArrayViewer >> initializeWidgets [ 
	| col |
	col := SpecColumnLayout composed.
	
	label := self newLabel.
	label label: 'An array with ', collection size asString, ' elements: '.
	col add: #label.
	
	1 to: collection size do: [ :count|
		|model temp|
		model := self newText.
		model disable.
		model text: (collection at: count)asString.
		temp := ('txt_', count asString) asSymbol.
		self assign: model to: temp.
		col add: temp ].
	
	self layout: col.
]

{ #category : #accessing }
DynamicArrayViewer >> label [ 
	^label
]
