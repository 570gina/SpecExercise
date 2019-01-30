Class {
	#name : #DynamicViewer,
	#superclass : #ComposablePresenter,
	#instVars : [
		'list',
		'view',
		'button',
		'state'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
DynamicViewer class >> horizontalSpec [
	<spec: #default>
	^ SpecColumnLayout composed
		newRow: [ :row | 
			row newColumn: [ :col | col add: #list] left: 0 right: 0.7;
				newColumn: [:col | col add: #view] left: 0.32 right: 0];
		newRow: [ :r | r add: #button ] height: self toolbarHeight;
	yourself.

]

{ #category : #specs }
DynamicViewer class >> verticalSpec [
	^ SpecColumnLayout composed
		add: #list top: 0 bottom: 0.7;
		add: #view top: 0.32 bottom: 0.02;
		add: #button height: self toolbarHeight;
	yourself.

]

{ #category : #accessing }
DynamicViewer >> button [
	^button
]

{ #category : #methods }
DynamicViewer >> currentSpec [
	^state = $v
		ifTrue: [ self class verticalSpec ]
		ifFalse: [ self class horizontalSpec ]
		
		
]

{ #category : #methods }
DynamicViewer >> defaultView [
	| cm |
	cm := self newLabel.
	cm label: 'Select something from the list please.'.
	^cm
]

{ #category : #api }
DynamicViewer >> extent [ 
	^400@350
]

{ #category : #initialization }
DynamicViewer >> initializePresenter [
	button action: [
		state := (state = $v) ifTrue: [ $h ] ifFalse: [ $v ].
		self needRebuild: false.
		self buildWithSpecLayout: self currentSpec.
	].
	
	list whenSelectedItemChanged: [ :new | 
		view := self widgetFor: new.
		self needRebuild: false.
		self buildWithSpecLayout: self currentSpec
	]

"I think this is a bit wrong...check after"
]

{ #category : #initialization }
DynamicViewer >> initializeWidgets [
	list := self newList.
	list displayBlock: [ :item | item printString contractTo: 15 ].
	button := self newButton.
	button label: 'Change!'.
	state := $h.
	view := self defaultView.
	
]

{ #category : #'api-shortcuts' }
DynamicViewer >> items: aCollection [
	list items: aCollection
]

{ #category : #accessing }
DynamicViewer >> list [ 
	^list
]

{ #category : #accessing }
DynamicViewer >> state [
	^state
]

{ #category : #api }
DynamicViewer >> title [
	^'Dynamic Multi-Data Viewer'
]

{ #category : #accessing }
DynamicViewer >> view [ 
	^view
]

{ #category : #methods }
DynamicViewer >> widgetFor: aDatum [
	| cm |
	aDatum isNil ifTrue: [ ^ self defaultView ].
	aDatum isForm ifTrue: [
		cm := self newImage.
		cm image: aDatum.
		^ cm ].
	aDatum isArray ifTrue: [
		cm := self newList.
		cm items: aDatum.
		^ cm ].
	"default case"
	cm := self newText.
	cm text: aDatum asString.
	^cm	
	"Will be modified later"

]
