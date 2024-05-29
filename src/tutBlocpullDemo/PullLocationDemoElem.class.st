Class {
	#name : 'PullLocationDemoElem',
	#superclass : 'BlElement',
	#instVars : [
		'moveableElem',
		'locationTextElem'
	],
	#category : 'tutBlocpullDemo',
	#package : 'tutBlocpullDemo'
}

{ #category : 'initialization' }
PullLocationDemoElem >> initialize [ 
	super initialize.
	self initializeElementsAndAppearance.
	self initializeInteractivity.
]

{ #category : 'initialization' }
PullLocationDemoElem >> initializeElementsAndAppearance [

	self size: 600 asPoint.
	self background: Color gray.

	moveableElem := BlElement new background: Color black.
	locationTextElem := BlTextElement new position: 10 @ 10.
	self addChild: locationTextElem.
	self addChild: moveableElem.

]

{ #category : 'initialization' }
PullLocationDemoElem >> initializeInteractivity [

	moveableElem addEventHandler: BlPullHandler new.

	moveableElem
		addEventHandlerOn: BlElementPositionChangedEvent
		do: [ locationTextElem text: moveableElem position asRopedText ]
]
