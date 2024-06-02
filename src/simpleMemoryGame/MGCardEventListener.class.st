Class {
	#name : 'MGCardEventListener',
	#superclass : 'BlEventListener',
	#instVars : [
		'memoryGame'
	],
	#category : 'simpleMemoryGame',
	#package : 'simpleMemoryGame'
}

{ #category : 'mouse handlers' }
MGCardEventListener >> clickEvent: anEvent [
	memoryGame chooseCard: anEvent currentTarget card.
]

{ #category : 'mouse handlers' }
MGCardEventListener >> memoryGame: aGame [ 
	memoryGame := aGame

]
