Class {
	#name : #LayoutExample,
	#superclass : #ComposablePresenter,
	#instVars : [
		'button1',
		'button2',
		'list',
		'text'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
LayoutExample class >> columnOf50 [
	^SpecLayout composed 
		newColumn: [ :col | col add: #text; add: #button1] width: 50;
		yourself
]

{ #category : #specs }
LayoutExample class >> nesting1 [
	^SpecRowLayout composed
		newColumn: [ :col | col add: #list ];
		newColumn: [ :col | col add: #text; newRow: [ :row | row add: #button1; add: #button2]];
		yourself
]

{ #category : #specs }
LayoutExample class >> nesting2 [
	^SpecColumnLayout composed
		newRow: [ :row | row add: #list ];
		newRow: [ :row | row add: #text; newRow: [ :inRow | inRow add: #button1; add: #button2 ]];
		yourself
]

{ #category : #specs }
LayoutExample class >> oneColumn [
	"<spec: #default>."
	^SpecLayout composed
		newColumn: [ :col | col add: #list; add: #button1 ];
		yourself
]

{ #category : #specs }
LayoutExample class >> oneColumnConcise [
	^SpecColumnLayout composed
		add: #list; add: #button1;
		yourself
]

{ #category : #specs }
LayoutExample class >> oneColumnWithSplitter [
	^ SpecColumnLayout composed
		add: #list;
		addSplitter;
		add: #button1;
		yourself

]

{ #category : #specs }
LayoutExample class >> oneRow [
	"<spec: #default>."
	^SpecLayout composed
		newRow: [ :row | row add: #list; add: #button1 ];
		yourself
]

{ #category : #specs }
LayoutExample class >> oneRowConcise [
	^SpecRowLayout composed
		add: #list; add: #button1;
		yourself
]

{ #category : #specs }
LayoutExample class >> rowOf30 [
	^SpecLayout composed 
		newRow: [ :row | row add: #text; add: #button1] height: 30;
		yourself
]

{ #category : #specs }
LayoutExample class >> twoRows [
^ SpecColumnLayout composed
	newRow: [ :row | row add: #text ];
	newRow: [ :row | row add: #button1; add: #button2 ];
	yourself
	
]

{ #category : #accessing }
LayoutExample >> button1 [ 
	^button1
]

{ #category : #accessing }
LayoutExample >> button2 [ 
	^button2
]

{ #category : #initialization }
LayoutExample >> initializeWidgets [ 
	button1 := self newButton.
	button2 := self newButton.
	list := self newList.
	text := self newText.
	button1 label: 'I am a button.'.
	button2 label: 'Me too!'.
	
]

{ #category : #accessing }
LayoutExample >> list [ 
	^list
]

{ #category : #accessing }
LayoutExample >> text [ 
	^text
]
