"
I am an Object which can make test to ensure that the Edges Class in the info601-TP 
package works correctly.

What can i test ?
	- I can test if i can set an ontology relationship to the directed edge.
	- I can test if i can set a pair of Vertices to the directed edge.
	- I can test if the directed edge is correctly directed.

"
Class {
	#name : #EdgesTest,
	#superclass : #TestCase,
	#category : #'info601-TP-Tests'
}

{ #category : #tests }
EdgesTest >> testTheDirectionOfTheEdge [

	|instance vertice2 vertice1 |
	vertice1 := Album newWithTitle: 'Goldberg Variations'.
	vertice2 := Track newWithTitle: 'Aria da capo'.
	instance := Edges newEdgeFrom: vertice1 to: vertice2 withRelationship: 'mo:item'.
	self assert: (instance begining = vertice1).
	self deny: (instance begining = vertice2).
	self assert: (instance ending = vertice2).
	self deny: (instance ending = vertice1).

]

{ #category : #tests }
EdgesTest >> testTheInstanciationOfAnEdge [

	|instance vertice2 vertice1 |
	vertice1 := Album newWithTitle: 'Goldberg Variations'.
	vertice2 := Track newWithTitle: 'Aria da capo'.
	instance := Edges newEdgeFrom: vertice1 to: vertice2 withRelationship: 'mo:item'.
	self assert: (instance begining = vertice1).
	self deny: (instance begining ~= vertice1).
	self assert: (instance ending = vertice2).
	self deny: (instance ending ~= vertice2).
	self assert: (instance relationship = 'mo:item').
	self deny: (instance relationship ~= 'mo:item').
]

{ #category : #tests }
EdgesTest >> testTheOntologyRelationship [

	|instance vertice2 vertice1 |
	vertice1 := Album newWithTitle: 'Goldberg Variations'.
	vertice2 := Track newWithTitle: 'Aria da capo'.
	instance := Edges newEdgeFrom: vertice1 to: vertice2 withRelationship: 'mo:item'.
	self assert: (instance relationship = 'mo:item').
	self deny: (instance relationship ~= 'mo:item').

]
