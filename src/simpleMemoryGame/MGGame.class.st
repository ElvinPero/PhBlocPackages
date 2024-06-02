Class {
	#name : 'MGGame',
	#superclass : 'Object',
	#instVars : [
		'availableCards',
		'chosenCards'
	],
	#category : 'simpleMemoryGame-Model',
	#package : 'simpleMemoryGame',
	#tag : 'Model'
}

{ #category : 'initialization' }
MGGame class >> withNumbers [ 

	^ self new initializeForSymbols: '12345678'.
]

{ #category : 'initialization' }
MGGame >> availableCards [
	^ availableCards

]

{ #category : 'initialization' }
MGGame >> cardsCount [
	"Return how many cards there should be depending on grid size"
	^ self gridSize * self gridSize
]

{ #category : 'initialization' }
MGGame >> chooseCard: aCard [
	(self chosenCards includes: aCard)
	ifTrue: [ ^ self ].
	self chosenCards add: aCard.
	aCard flip.
	self shouldCompleteStep
	ifTrue: [ ^ self completeStep ].
	self shouldResetStep
	ifTrue: [ self resetStep ]
]

{ #category : 'initialization' }
MGGame >> chosenCardMatch [
| firstCard |
firstCard := self chosenCards first.
^ self chosenCards allSatisfy: [ :aCard |
aCard isFlipped and: [ firstCard symbol = aCard symbol ] ]

]

{ #category : 'initialization' }
MGGame >> chosenCards [
	^ chosenCards

]

{ #category : 'initialization' }
MGGame >> completeStep [
self chosenCards
do: [ :aCard | aCard disappear ];
removeAll.

]

{ #category : 'initialization' }
MGGame >> gridSize [
	"Return grid size"
	^ 4 

]

{ #category : 'initialization' }
MGGame >> initialize [
	super initialize.
	availableCards := OrderedCollection new.
	chosenCards := OrderedCollection new
]

{ #category : 'initialization' }
MGGame >> initializeForSymbols: aCollectionOfCharacters [
	aCollectionOfCharacters size = (self cardsCount / self matchesCount)
		ifFalse: [ self error: 'Amount of characters must be equal to possible all combinations' ].
	aCollectionOfCharacters do: [ :aSymbol |
	1 to: self matchesCount do: [ :i |
	availableCards add: (MGCard new symbol: aSymbol) ] ].
	availableCards := availableCards shuffled

]

{ #category : 'initialization' }
MGGame >> matchesCount [
	"How many chosen cards should match for them to disappear"
	^ 2

]

{ #category : 'initialization' }
MGGame >> resetStep [
| lastCard |
lastCard := self chosenCards last.
self chosenCards
allButLastDo: [ :aCard | aCard flip ];
removeAll;
add: lastCard
]

{ #category : 'initialization' }
MGGame >> shouldCompleteStep [
^ self chosenCards size = self matchesCount
and: [ self chosenCardMatch ]
]

{ #category : 'initialization' }
MGGame >> shouldResetStep [
^ self chosenCards size > self matchesCount


]
