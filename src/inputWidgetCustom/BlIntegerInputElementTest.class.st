Class {
	#name : 'BlIntegerInputElementTest',
	#superclass : 'BlElementTest',
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

{ #category : 'tests' }
BlIntegerInputElementTest >> testCanChangeLabel [
	| inputElem |
	inputElem := BlIntegerInputElement new.
	self assert: inputElem label text asString equals: 'Input'.
	inputElem label: 'Volume'.
	self assert: inputElem label text asString equals: 'Volume'.
]

{ #category : 'tests' }
BlIntegerInputElementTest >> testChildrenAreSet [
	| inputElem |
	inputElem := BlIntegerInputElement new.
	self assert: inputElem children size equals: 4.
]
