Class {
	#name : #WidgetClassList,
	#superclass : #ComposablePresenter,
	#instVars : [
		'list'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
WidgetClassList class >> defaultSpec [
	^ SpecLayout composed
	add: #list;
	yourself
]

{ #category : #initialization }
WidgetClassList >> initializeWidgets [
	list := self newList.
	list items: (AbstractWidgetPresenter allSubclasses
	sorted: [:a :b | a name < b name ]).
	self focusOrder add: list.

]

{ #category : #accessing }
WidgetClassList >> list [
	^list
]

{ #category : #api }
WidgetClassList >> title [
	^'Widgets'
]

{ #category : #'events-shortcuts' }
WidgetClassList >> whenSelectedItemChanged: aBlock [
	list whenSelectedItemChanged: aBlock

]
