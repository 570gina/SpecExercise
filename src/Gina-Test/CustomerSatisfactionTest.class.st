Class {
	#name : #CustomerSatisfactionTest,
	#superclass : #TestCase,
	#category : #'Gina-Test'
}

{ #category : #testing }
CustomerSatisfactionTest >> testSpecUI [
	| cs |
	cs := CustomerSatisfaction new.
	cs buildWithSpec.
	cs buttonHappy performAction.
	self assert: [cs screen label = 'Happy' ].
	cs buttonNeutral performAction.
	self assert:[ cs screen label = 'Neutral' ].
	cs buttonBad performAction.
	self assert: [cs screen label = 'Bad' ].
]
