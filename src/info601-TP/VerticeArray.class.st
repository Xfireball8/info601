"
I am an specific implementation of an array, that contains some convenience functions 
to simplify the use of the array.
"
Class {
	#name : #VerticeArray,
	#superclass : #Array,
	#type : #variable,
	#instVars : [
		'index'
	],
	#category : #'info601-TP'
}

{ #category : #operations }
VerticeArray class >> create [
	| instance |
	instance := self new: 100.
	instance index: 1.

	^instance
]

{ #category : #adding }
VerticeArray >> add: aVertice [
	| i |
	aVertice isNotNil
		ifFalse: [ ^ self ].
	i := self nextIndex.
	self at: i put: aVertice
]

{ #category : #public }
VerticeArray >> get: anInteger [
	^self at: anInteger
]

{ #category : #accessing }
VerticeArray >> index [
	^ index
]

{ #category : #accessing }
VerticeArray >> index: anObject [
	index := anObject
]

{ #category : #accessing }
VerticeArray >> indexOfThisVertice: aVertice [
	^self indexOf: aVertice
]

{ #category : #adding }
VerticeArray >> nextIndex [
	| i |
	i := index.
	index := index+1.
	^i
]
