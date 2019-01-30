Class {
	#name : #SpecCalendar,
	#superclass : #ComposablePresenter,
	#instVars : [
		'morph'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
SpecCalendar class >> defaultSpec [ 
	^SpecLayout composed add: #morph; yourself
]

{ #category : #api }
SpecCalendar >> extent [ 
	^220@200
]

{ #category : #initialization }
SpecCalendar >> initializeWidgets [ 
	morph := (CalendarMorph openOn: Date today)asSpecAdapter 
]

{ #category : #accessing }
SpecCalendar >> morph [
	^morph 
]

{ #category : #api }
SpecCalendar >> title [
	^'SpecCalendar'
]
