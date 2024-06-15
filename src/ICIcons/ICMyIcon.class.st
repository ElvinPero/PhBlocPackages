Class {
	#name : 'ICMyIcon',
	#superclass : 'BlElement',
	#category : 'ICIcons',
	#package : 'ICIcons'
}

{ #category : 'initialization' }
ICMyIcon >> initialize [
	super initialize.
	self size:500@500.
	self initializeIconn.
]

{ #category : 'initialization' }
ICMyIcon >> initializeIconn [

	| container |
	container:= BlElement new
	size: 200 @200;
	geometry:BlRectangleGeometry new;
	background: (Color gray alpha:0.2);
	layout: BlFrameLayout new;
	"constraintsDo: [ :c |
		c vertical fitContent.
		c horizontal fitContent.
		]."
	padding:(BlInsets all: 20).
	
self addChild: container.
]
