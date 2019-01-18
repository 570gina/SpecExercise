Class {
	#name : #ProtocolBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'text',
		'viewer'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
ProtocolBrowser class >> defaultSpec [
	^ SpecLayout composed newColumn: [:col |
		col newRow: [ :row |
			row add: #(viewer models);
				newColumn: [ :col2 |
					col2 add: #(viewer api);
						add: #(viewer events) ] ];
				add: #text];
		yourself
]

{ #category : #initialization }
ProtocolBrowser >> initializePresenter [
	viewer whenClassChanged: [ :class | text behavior: class].
	viewer whenAPIChanged: [ :item |
		item
			ifNotNil: [ text text: item sourceCode ] ].
	viewer whenEventChanged: [ :item |
		item
			ifNotNil: [ text text: item sourceCode ] ]

]

{ #category : #initialization }
ProtocolBrowser >> initializeWidgets [ 
	text := self instantiate: TextModel.
	viewer := self instantiate: ProtocolViewer.
	text
		aboutToStyle: true;
		isCodeCompletionAllowed: true.
	self focusOrder 
		add: viewer;
		add: text.
]

{ #category : #acccessing }
ProtocolBrowser >> text [
	^text
]

{ #category : #api }
ProtocolBrowser >> title [ 
	^'Spec Protocol Browser'
]

{ #category : #acccessing }
ProtocolBrowser >> viewer [
	^viewer
]
