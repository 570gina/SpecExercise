Class {
	#name : #RegisteredColorsList,
	#superclass : #ListModel,
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #initialization }
RegisteredColorsList >> initialize [ 
	super initialize.
	self items: Color registeredColorNames;
		backgroundColorBlock: [ :item | Color named: item ];
		title: 'Registered colors'.
]
