Class {
	#name : #WidgetClassList,
	#superclass : #ComposableModel,
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
	list items: (ComposablePresenter allSubclasses
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
