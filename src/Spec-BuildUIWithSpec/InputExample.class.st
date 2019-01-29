Class {
	#name : #InputExample,
	#superclass : #ComposablePresenter,
	#instVars : [
		'accountLabel',
		'passwordLabel',
		'account',
		'password'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
InputExample class >> defaultSpec [
	^SpecColumnLayout composed
		newRow: [ :row | row 
			add: #accountLabel origin: 0 @ 0 corner: 0.2 @ 1; 
			add: #account origin: 02@ 0 corner: 1 @ 1];
		newRow: [ :row | row 
			add: #passwordLabel origin: 0 @ 0 corner: 0.2 @ 1; 
			add: #password origin: 0.2 @ 0 corner: 1 @ 1];
		yourself.	
]

{ #category : #accessing }
InputExample >> account [
	^account
]

{ #category : #accessing }
InputExample >> accountLabel [
	^accountLabel
]

{ #category : #api }
InputExample >> extent [
	^400@200
]

{ #category : #initialization }
InputExample >> initializeWidgets [ 
	accountLabel := self newLabel.
	account := self newTextInput.
	passwordLabel := self newLabel.
	password := self newTextInput.
	
	accountLabel label: 'Account:'.
	passwordLabel label: 'password:'.
	
	account ghostText: 'Input your account'.
	account entryCompletion.
	account acceptOnCR: false. "Enter?"
	password ghostText: 'Input your password'.
	password beEncrypted. 
	password entryCompletion.
	password acceptOnCR: true.	
]

{ #category : #accessing }
InputExample >> password [ 
	^password 
]

{ #category : #accessing }
InputExample >> passwordLabel [
	^passwordLabel
]

{ #category : #api }
InputExample >> title [ 
	^'Login'
]
