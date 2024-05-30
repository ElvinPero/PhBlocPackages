Class {
	#name : 'BlIntegerInputElement',
	#superclass : 'BlElement',
	#instVars : [
		'plus',
		'minus',
		'inputValue',
		'value',
		'inputLabel'
	],
	#category : 'inputWidgetCustom-Input',
	#package : 'inputWidgetCustom',
	#tag : 'Input'
}

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> backgroundPaint [
	
	^  Color black
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> changeValueTo: aValue [

	inputValue text: (self configuredString: aValue asString).
	inputValue text fontSize: 30.
	value:= aValue.
	
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> configuredString: aString [
	^aString asRopedText attributes: { (BlTextForegroundAttribute paint: Color cyan) }
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> createCircle [
	| circle |
	circle:= BlElement new
		background: Color black;
		border: (BlBorder paint: Color pink width:2);
		layout: BlFrameLayout new;
		geometry: BlCircleGeometry new.
		
	^ circle.
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> decreaseInput [

	self changeValueTo: value-1.
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> increaseInput [

	self changeValueTo: value+1.
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> initialize [
	super initialize.
		self size: self inputExtent.
		self background: self backgroundPaint.
		self geometry: (BlRoundedRectangleGeometry cornerRadius: 20).
		self layout: BlFrameLayout new.
		self border: (BlBorder paint: Color pink).
		self initializePlusButton.
		self initializeMinusButton.
		self initializeInputValue: 20.
		self label: 'Input'
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> initializeInputValue: aValue [

	inputValue := BlTextElement new.
	inputValue constraintsDo: [ :c | c frame horizontal alignCenter.
												c frame vertical alignCenter ].				
	self changeValueTo: aValue.
	self addChild: inputValue.
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> initializeMinusButton [
	
	| circle |
	circle := self createCircle.
	circle constraintsDo: [ :c |
									c frame horizontal alignLeft.
									c frame vertical alignCenter ].
	circle transformDo: [ :t | t translateBy: 15 @ 0 ].
	minus := BlTextElement new text: (self configuredString: '-').
	minus text fontSize: 55.
	minus constraintsDo: [ :c |
								c frame horizontal alignCenter.
								c frame vertical alignCenter ].
	circle
		addEventHandlerOn: BlMouseDownEvent
							do: [ :e | self decreaseInput ].
	circle addChild: minus.
	self addChild: circle.
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> initializePlusButton [
	
	| circle |
	circle := self createCircle.
	circle constraintsDo: [ :c |
									c frame horizontal alignRight.
									c frame vertical alignCenter ].
	circle transformDo: [ :t | t translateBy: -15 @ 0 ].
	plus := BlTextElement new text: (self configuredString: '+').
	plus text fontSize: 55.
	plus constraintsDo: [ :c |
								c frame horizontal alignCenter.
								c frame vertical alignCenter ].
	circle
		addEventHandlerOn: BlMouseDownEvent
							do: [ :e | self increaseInput ].
	circle addChild: plus.
	self addChild: circle.
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> inputExtent [
	
	^  300@120
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> label [
	^ inputLabel.
]

{ #category : 'as yet unclassified' }
BlIntegerInputElement >> label: aString [
	inputLabel := BlTextElement new.
	inputLabel text: (self configuredString: aString). 
	inputLabel text fontSize: 25.
	inputLabel constraintsDo:  [ :c | c frame horizontal alignCenter ].
			inputLabel transformDo: [ :t | t translateBy: 0 @ 10 ].
				self addChild: inputLabel
]
