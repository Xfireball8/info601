"
I am an object implementing and adjacent matrix to work with the edges of a KnowledgeGraph.
"
Class {
	#name : #EdgesMatrix,
	#superclass : #Array2D,
	#type : #variable,
	#instVars : [
		'numberOfVertices'
	],
	#category : #'info601-TP'
}

{ #category : #operations }
EdgesMatrix class >> create [
	| instance |
	instance := self new: 100.
	instance numberOfVertices: 0.
	^instance
]

{ #category : #adding }
EdgesMatrix >> add: anEdge toLine: anIndex toColumn: aSecondIndex [
	self at: anIndex at: aSecondIndex put: anEdge
]

{ #category : #accessing }
EdgesMatrix >> getAllPossibleEdgesThatGoesFrom: aVerticeIndex [
	^self atRows: aVerticeIndex to: aVerticeIndex columns: 1 to: numberOfVertices 
	
]

{ #category : #accessing }
EdgesMatrix >> getAllPossibleEdgesThatGoesTo: aVerticeIndex [
	^self atRows: 1 to: numberOfVertices columns: aVerticeIndex to: aVerticeIndex
	
]

{ #category : #adding }
EdgesMatrix >> incrementVerticesNumber [ 
	numberOfVertices := numberOfVertices +1 
]

{ #category : #accessing }
EdgesMatrix >> numberOfVertices [
	^ numberOfVertices
]

{ #category : #accessing }
EdgesMatrix >> numberOfVertices: anObject [
	numberOfVertices := anObject
]
