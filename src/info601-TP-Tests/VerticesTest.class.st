"
I am a class which contains the test for the Vertices Object in the info601-TP package.

What i am able to test : 
	- Can i create a vertice with the ontology class i provided ?
"
Class {
	#name : #VerticesTest,
	#superclass : #TestCase,
	#category : #'info601-TP-Tests'
}

{ #category : #tests }
VerticesTest >> testIfICanInstantiateASommetOfAnyOntologyType [

	| instance |
	instance := Vertices new.
	instance rdf_type: 'a:type'.
	self assert: (instance rdf_type = 'a:type').
	self deny: (instance rdf_type = 'a:nother_type').

]
