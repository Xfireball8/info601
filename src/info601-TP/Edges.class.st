"
I am an object representing an edge in the knowledge Graph.
"
Class {
	#name : #Edges,
	#superclass : #Object,
	#instVars : [
		'begining',
		'ending',
		'relationship'
	],
	#category : #'info601-TP'
}

{ #category : #'instance creation' }
Edges class >> newEdgeFrom: aVertice to: anotherVertice  withRelationship: aString [
	
	|instance|
	instance := self new.
	instance begining: aVertice.
	instance ending: anotherVertice.
	instance relationship: aString.
	^instance
]

{ #category : #accessing }
Edges >> begining [
	^ begining
]

{ #category : #accessing }
Edges >> begining: anObject [
	begining := anObject
]

{ #category : #accessing }
Edges >> ending [
	^ ending
]

{ #category : #accessing }
Edges >> ending: anObject [
	ending := anObject
]

{ #category : #accessing }
Edges >> relationship [
	^ relationship
]

{ #category : #accessing }
Edges >> relationship: anObject [
	relationship := anObject
]
