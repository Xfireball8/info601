"
I am a class that test the functionalities of the Knowledge Graph, and that ensure that 
the Knowledge Graph works properly.

What i test is : 
      - I want to add a Vertice to my graph.
      - I want to add a edge to my graph.
		- I want to get a Vertice that is in my graph.
		- I want to get a edge that is in my graph.
      - I want to get the edge of some vertice in my graph.

		Alright.
      
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
	knowledge_graph := KnowledgeGraph new.
	knowledge_graph addVertice: vertice.
	
"Now if the vertice is correctly added, if i check the number of elements in my set of vertices. It should be at one. Also, if i get the first element of the set, it should be my vertice. I can try to do my test like that"
	
	self assert: (knowledge_graph numberOfVertice = 1).
	self assert: ((knowledge_graph getVerticeByIndex: 1) = vertice).
]

{ #category : #testing }
KnowledgeGraphTest >> testIfICanGetAVerticeOfMyGraph [
"Try to do the test on getting vertices of the graph, how you''ll do t ? i see the other because i don't remember the sintax"

	"I need in order to do this to create some vertices and edges."	
		| vertice1 vertice2 edge1 knowledgeGraph|
		vertice1 := Album newWithTitle: 'ciao'.
		vertice2 := Track newWithTitle: 'asad'.
		edge1 := Edges newEdgeFrom: vertice1 to: vertice2  withRelationship: 'dc:Creator'. 
		knowledgeGraph := KnowledgeGraph new. 
		knowledgeGraph addVertice: vertice1.
		knowledgeGraph addVertice: vertice2.

		
		knowledgeGraph addEdge: edge1. 
		
		self assert: (knowledgeGraph getAllVertices contains: vertice1).
		self assert: (knowledgeGraph getAllVertices contains: vertice2).
		self assert: (knowledgeGraph getAllEdges contains: edge1). 
		
]
