Class {
	#name : #TBAndListV,
	#superclass : #TBAndListH,
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
TBAndListV class >> defaultSpec [ 
	^SpecRowLayout composed
		add: #buttons withSpec: #buttonCol; add:#list;
		yourself
]

{ #category : #api }
TBAndListV >> title [ 
	^'TBAndListV'
]
