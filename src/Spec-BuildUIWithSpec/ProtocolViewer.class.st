Class {
	#name : #ProtocolViewer,
	#superclass : #ComposablePresenter,
	#instVars : [
		'models',
		'api',
		'events'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
ProtocolViewer class >> defaultSpec [
	^ SpecColumnLayout composed
		add: #models; add: #api; add: #events;
		yourself

]

{ #category : #accessing }
ProtocolViewer >> api [
	^api
]

{ #category : #accessing }
ProtocolViewer >> events [ 
	^events
]

{ #category : #initialization }
ProtocolViewer >> initializePresenter [
	models whenSelectedItemChanged: [ :class|
		api resetSelection.
		events resetSelection.
		class
			ifNil: [api items: #(). events items: #()]
			ifNotNil: [ 
				api items: (self methodsIn: class for: 'api').
				events items: (self methodsIn: class for: 'api-events') ] ].
		
	api whenSelectedItemChanged: [ :method |
		method ifNotNil: [ events resetSelection ] ].
	events whenSelectedItemChanged: [ :method |
		method ifNotNil: [ api resetSelection ] ].
]

{ #category : #initialization }
ProtocolViewer >> initializeWidgets [ 
	models := self instantiate: WidgetClassList.
	api := self instantiate: ProtocolMethodList.
	events := self instantiate: ProtocolMethodList. 
	api label: 'api'.
	events label: 'api-events'.
	self focusOrder add: models; add: api; add: events.
]

{ #category : #building }
ProtocolViewer >> methodsIn: class for: protocol [
	^(class methodsInProtocol: protocol)sorted: [ :a :b | a selector < b selector].
]

{ #category : #accessing }
ProtocolViewer >> models [
	^models
]

{ #category : #api }
ProtocolViewer >> title [ 
	^'Protocol viwer'
]

{ #category : #'events-shortcuts' }
ProtocolViewer >> whenAPIChanged: aBlock [
	api whenSelectedItemChanged: aBlock
]

{ #category : #'events-shortcuts' }
ProtocolViewer >> whenClassChanged: aBlock [
	models whenSelectedItemChanged: aBlock

]

{ #category : #'events-shortcuts' }
ProtocolViewer >> whenEventChanged: aBlock [
	events whenSelectedItemChanged: aBlock

]
