"
I am the object which is the model behind our Knowledge Graph. I implement a 
mathematical model of a Graph, where vertices can be any object that is a subclass of Vertices (Album,genre,musicArtist...)

I contain a set of Vertices, and an adjacent matrix of Directed Edges.
"
Class {
	#name : #KnowledgeGraph,
	#superclass : #Object,
	#instVars : [
		'vertices',
		'edges'
	],
	#category : #'info601-TP'
}

{ #category : #'instance creation' }
KnowledgeGraph class >> create [

	| instance |
	instance := self new.
	instance vertices: VerticeArray create.
	^instance

	
]

{ #category : #'adding item' }
KnowledgeGraph >> addVertice: aVertice [

	vertices add: aVertice
]

{ #category : #accessing }
KnowledgeGraph >> getVerticeByIndex: anInteger [

	(anInteger < vertices index) ifTrue: [ 
		^vertices get: anInteger
		 ] ifFalse: [ 
		^nil
		 ]
]

{ #category : #accessing }
KnowledgeGraph >> numberOfVertice [

	^(vertices index - 1)
]

{ #category : #accessing }
KnowledgeGraph >> vertices [ 
	^vertices 

]

{ #category : #accessing }
KnowledgeGraph >> vertices: anArrayOfVertices [

	vertices := anArrayOfVertices 
]
