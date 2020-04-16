"
I am a class that test the functionalities of the Knowledge Graph, and that ensure that 
the Knowledge Graph works properly.

What i test is : 
      - I want to add a Vertice to my graph.
      - I want to add a edge to my graph.
		- I want to get a Vertice that is in my graph.
		- I want to get a edge that is in my graph.
      - I want to get the edge of some vertice in my graph.
      
		TODO : Creating tests for searching things in the graph, and real functionality.
"
Class {
	#name : #KnowledgeGraphTest,
	#superclass : #TestCase,
	#category : #'info601-TP-Tests'
}

{ #category : #testing }
KnowledgeGraphTest >> testIfICanAddAVerticeToTheGraph [
	"This window is where i write new messages. I'm starting with the adding vertice functionality."
	| knowledge_graph vertice |
	vertice := Album newWithTitle: 'Godlberg Variations'. 
	knowledge_graph := KnowledgeGraph create.
	knowledge_graph addVertice: vertice.
	
"Now if the vertice is correctly added, if i check the number of elements in my set of vertices. It should be at one. Also, if i get the first element of the set, it should be my vertice. I can try to do my test like that"
	
	self assert: (knowledge_graph numberOfVertice = 1).
	self assert: ((knowledge_graph getVerticeByIndex: 1) = vertice).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanAddAnEdgeToTheGraph [

	"What i can do for this test is something like : adding two vertices and an edges, and ask
	if there is an edge for this vertice, and ask for it, i finally can compare the edge i 
	obtained with the one i added at start."
	

	| vertice1 vertice2 edge1 knowledgeGraph |
	
	vertice1 := Album newWithTitle: 'Goldberg Variations'.
	vertice2 := Track newWithTitle: 'Aria da capo'.
	edge1 := Edges newEdgeFrom: vertice1 to: vertice2  withRelationship: 'mo:item'.
	
	knowledgeGraph := KnowledgeGraph create. 	
	knowledgeGraph addVertice: vertice1.
	knowledgeGraph addVertice: vertice2.
	knowledgeGraph addEdge: edge1.
	
	self assert: (knowledgeGraph doesTheVerticeHasEdges: vertice1).
	self assert: ((knowledgeGraph getEdgesOfThisVertice: vertice1) 
	detect: [
		:from_or_to_edges | 
		true = (from_or_to_edges detect: [:eachVertice | eachVertice = edge1] ifFound:[true] ifNone:[false])
		]
	ifFound:[true] 
	ifNone:[false]
	).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetAEdgeOfAVerticeToTheGraph [

	| vertice1 vertice2 edge1 knowledgeGraph |
	
	vertice1 := Album newWithTitle: 'Goldberg Variations'.
	vertice2 := Track newWithTitle: 'Aria da capo'.
	edge1 := Edges newEdgeFrom: vertice1 to: vertice2  withRelationship: 'mo:item'.
	
	knowledgeGraph := KnowledgeGraph create. 	
	knowledgeGraph addVertice: vertice1.
	knowledgeGraph addVertice: vertice2.
	knowledgeGraph addEdge: edge1.
	
	"If we want to test if i can get a Vertice of my graph. I can simply get all the edges of
	the graph and then see if the one i added ear."
	
	self assert: (knowledgeGraph getAllEdges detect: [:each | each = edge1] ifFound: [true] ifNone: [false])
	
]

{ #category : #testing }
KnowledgeGraphTest >> testIfICanGetAVerticeOfMyGraph [
"Try to do the test on getting vertices of the graph, how you''ll do t ? i see the other because i don't remember the sintax"

	"I need in order to do this to create some vertices and edges."	
		| vertice1 vertice2 edge1 knowledgeGraph|
		vertice1 := Album newWithTitle: 'ciao'.
		vertice2 := Track newWithTitle: 'asad'.
		edge1 := Edges newEdgeFrom: vertice1 to: vertice2  withRelationship: 'dc:Creator'. 
		knowledgeGraph := KnowledgeGraph create.
		knowledgeGraph addVertice: vertice1.
		knowledgeGraph addVertice: vertice2.	
		knowledgeGraph addEdge: edge1. 
		
		self assert: (knowledgeGraph getAllVertices detect: [:each | each = vertice1] ifFound:[true] ifNone:[false]).
		self assert: (knowledgeGraph getAllVertices detect: [:each | each = vertice2] ifFound:[true] ifNone:[false]).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetAnEdgeOfMyGraph [

	| vertice1 vertice2 edge1 knowledgeGraph |
	
	vertice1 := Album newWithTitle: 'Goldberg Variations'.
	vertice2 := Track newWithTitle: 'Aria da capo'.
	edge1 := Edges newEdgeFrom: vertice1 to: vertice2  withRelationship: 'mo:item'.
	
	knowledgeGraph := KnowledgeGraph create. 	
	knowledgeGraph addVertice: vertice1.
	knowledgeGraph addVertice: vertice2.
	knowledgeGraph addEdge: edge1.
	
	self assert: (knowledgeGraph getAllEdges detect: [:each | each = edge1] ifFound:[true] ifNone:[false]).
]
