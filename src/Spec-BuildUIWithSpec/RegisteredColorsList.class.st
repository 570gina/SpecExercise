Class {
	#name : #RegisteredColorsList,
	#superclass : #ListPresenter,
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #initialization }
RegisteredColorsList >> initialize [ 
	super initialize.
	self items: Color registeredColorNames;
		backgroundColorBlock: [ :item | Color named: item ];
		title: 'Registered colors'.
]
