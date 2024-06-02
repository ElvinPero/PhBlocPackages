Class {
	#name : 'MGGameElement',
	#superclass : 'BlElement',
	#instVars : [
		'game'
	],
	#category : 'simpleMemoryGame',
	#package : 'simpleMemoryGame'
}

{ #category : 'as yet unclassified' }
MGGameElement class >> openWithNumber [
| aGameElement space |
aGameElement := MGGameElement new
memoryGame: MGGame withNumbers;
yourself.
space := BlSpace new.
space root addChild: aGameElement.
space root whenLayoutedDoOnce: [ space extent: 420 @ 420 ].
space show
]

{ #category : 'accessing' }
MGGameElement >> initialize [
	super initialize.
	self background: Color veryLightGray.
	self layout: (BlGridLayout horizontal cellSpacing: 20).
	self
		constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent].
]

{ #category : 'accessing' }
MGGameElement >> memoryGame [
	^ game.
]

{ #category : 'accessing' }
MGGameElement >> memoryGame: aGame [
	| aCardEventListener |
	game := aGame.
	aCardEventListener := MGCardEventListener new memoryGame: aGame;
	yourself.
	self layout columnCount: game gridSize.
	game availableCards do: [ :aCard || cardElement | cardElement := MGCardElement new
	card: aCard;
	addEventHandler: aCardEventListener;
	yourself.
	self addChild: cardElement ].


]
