Class {
	#name : #TabMgrExample,
	#superclass : #ComposablePresenter,
	#instVars : [
		'tabmgr',
		'status',
		'menu'
	],
	#category : #'Spec-BuildUIWithSpec'
}

{ #category : #specs }
TabMgrExample class >> defaultSpec [ 
	^SpecLayout composed
		add: #tabmgr;
		yourself
]

{ #category : #methods }
TabMgrExample >> createStatus [
	status := TextPresenter new.
	status disable;
	text: 'Welcome to Washing Machine 2.0!\History: Wash ' withCRs.
]

{ #category : #'accessing - model' }
TabMgrExample >> dryModel [
	| model |
	model := DynamicComposablePresenter new.
	model instantiateModels: #(spin SliderModel dry SliderModel).
	model spin label: 'Spin speed'; min: 400; max: 1600; quantum: 400.
	model dry label: 'Dry time'; min: 0; max: 120; quantum: 10.
	model layout: (
	SpecColumnLayout composed
		add: #spin height: 30; add: #dry height: 30;
	yourself).
^model.

]

{ #category : #api }
TabMgrExample >> extent [ 
	^250@160
]

{ #category : #initialization }
TabMgrExample >> initializePresenter [
	tabmgr whenTabSelected: [
		status text: (String streamContents: [:s |
			s nextPutAll: status text.
			s nextPutAll: ' > '.
			s nextPutAll: tabmgr selectedTab label])].
]

{ #category : #initialization }
TabMgrExample >> initializeWidgets [
	| tab |
	tabmgr := self newTabManager.
	
	tab := self newTab.
	tab presenter: RadioButtonExample new.
	tab
		label: 'Wash';
		closeable: false;
		icon: (Smalltalk ui icons iconNamed: #smallScreenshot).
	tabmgr addTab: tab.
	
	tab := self newTab.
	tab presenter: self dryModel.
	tab
		label: 'Dry';
		closeable: false;
		icon: (Smalltalk ui icons iconNamed: #smallScreenshot).
	tabmgr addTab: tab.
	
	self createStatus.
	tab := self newTab.
	tab presenter: status.
	tab
		label: 'Info';
		closeable: false;
		icon: (Smalltalk ui icons iconNamed: #smallInfo).
	tabmgr addTab: tab.
	
	self populateMenu.
]

{ #category : #methods }
TabMgrExample >> populateMenu [
	|submenu|
	
	menu:= MenuPresenter new.
	submenu := MenuPresenter new.
	
	submenu addGroup: [ :group | 
		group addItem: [ :item | 
			item name: 'Soft Reset';
				action: [ status text: 'History: Wash '.	];
				icon: (Smalltalk ui icons iconNamed: #exception) ].
		group addItem: [ :item | 
			item name: 'Hard Reset';
				action: [ GrowlMorph openWithContents: 'Just pull the plug!' ];
				icon: (Smalltalk ui icons iconNamed: #smallError) ]].	 
]

{ #category : #accessing }
TabMgrExample >> tabmgr [
	^tabmgr
]

{ #category : #api }
TabMgrExample >> title [
	^'Washer-Dryer'

]
