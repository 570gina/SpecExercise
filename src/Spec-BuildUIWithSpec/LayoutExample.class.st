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
LayoutExample class >> OneButtonSmaller [
	^SpecLayout composed
		add: #button1 origin: (0.25@0.25) corner:(0.75@0.75);
		yourself
]

{ #category : #specs }
LayoutExample class >> TwoButtonsRelativeOffset [
	^SpecLayout composed
		add: #button1 origin: (0@0) corner:(1@0.5)
				offsetOrigin: (10@10) offsetCorner:(-10@ -5);
		add: #button2 origin: (0@0.5) corner:(1@1)
				offsetOrigin: (10@5) offsetCorner: (-10@ -10);
				yourself
				
]

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
LayoutExample class >> nestingTB [
	^SpecColumnLayout composed
		newRow: [ :row | row add: #list ] top: 0 bottom: 0.2;
		newRow: [ :row | 
			row newColumn: [ :col | col add: #text ] left: 0 right: 0.45;
				 newColumn: [ :col | 
					col newRow: [ :inRow | inRow add: #button1; add: #button2]] left: 0.55 right: 0] 
			top: 0.8 bottom: 0;
			yourself
]

{ #category : #specs }
LayoutExample class >> oneButtonAbsolute [
	^SpecLayout composed
		add: #button1 top: 10 bottom: 200 left: 10 right: 10;
		yourself
]

{ #category : #specs }
LayoutExample class >> oneButtonSmallerAlternative [
	^SpecLayout composed
	add: #button1 top: 0.25 bottom: 0.25 left: 0.25 right: 0.25;
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
