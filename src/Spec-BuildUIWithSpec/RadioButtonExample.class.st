Class {
	#name : #RadioButtonExample,
	#superclass : #ComposablePresenter,
	#instVars : [
		'rinse',
		'f1',
		'f2',
		'f3',
		't1',
		't2',
		't3'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
RadioButtonExample class >> defaultSpec [ 
	^SpecColumnLayout composed 
		newRow: [ :row | 
			row newColumn: [ :col | col add: #f1; add: #f2; add: #f3 ];
				 newColumn: [ :col | col add: #t1 ; add: #t2 ; add: #t3 ]];
		newRow: [:r | r add: #rinse ];
	yourself.

]

{ #category : #api }
RadioButtonExample >> extent [
	^160@150
]

{ #category : #accessing }
RadioButtonExample >> f1 [
	^f1
]

{ #category : #accessing }
RadioButtonExample >> f2 [
	^f2
]

{ #category : #accessing }
RadioButtonExample >> f3 [
	^f3
]

{ #category : #initialization }
RadioButtonExample >> initializePresenter [
	f2 activationAction: [ t1 state ifTrue: [ t2 state: true ] ].
	f3 activationAction: [ 
		t1 disable; state: false.
		t2 disable; state: false.
		t3 state: true].
	f3 deactivationAction: [ t1 enable. t2 enable ]

]

{ #category : #initialization }
RadioButtonExample >> initializeWidgets [
	| fabric temperature|
	fabric := RadioButtonGroup new.
	temperature := RadioButtonGroup new. 
	
	rinse := self newRadioButton.
	rinse label: 'Rinse Extra';
			canDeselectByClick: true.
	
	f1 := self newRadioButton.
	f1 label: 'Cotton'.
	fabric addRadioButton: f1; default: f1.
	
	f2 := self newRadioButton.
	f2 label: 'Synthetic'.
	fabric addRadioButton: f2.
	
	f3 := self newRadioButton.
	f3 label: 'Delicate'.
	fabric addRadioButton: f3.
	
	t1 := self newRadioButton.
	t1 label: '60'.
	temperature addRadioButton: t1; default: t1.	
	
	t2 := self newRadioButton.
	t2 label: '40'.
	temperature addRadioButton: t2.	
	
	t3 := self newRadioButton.
	t3 label: '30'.
	temperature addRadioButton: t3.	
]

{ #category : #accessing }
RadioButtonExample >> rinse [
	^rinse
]

{ #category : #accessing }
RadioButtonExample >> t1 [ 
	^t1
]

{ #category : #accessing }
RadioButtonExample >> t2 [
	^t2
]

{ #category : #accessing }
RadioButtonExample >> t3 [
	^t3
]

{ #category : #api }
RadioButtonExample >> title [ 
	^'Was'
]
