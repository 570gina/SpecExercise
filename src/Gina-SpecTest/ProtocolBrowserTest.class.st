Class {
	#name : #ProtocolBrowserTest,
	#superclass : #TestCase,
	#category : #'Gina-SpecTest'
}

{ #category : #testing }
ProtocolBrowserTest >> testSpecUI [
	| pb |
	pb := ProtocolBrowser new.
	pb buildWithSpec.
	pb viewer models list setSelectedIndex: 2.
	self assert: [ pb text text isEmpty ].
	pb viewer api methods setSelectedIndex: 1.
	self assert: [(pb text text copyFrom: 1 to: 10) = 'activation' ].

]
