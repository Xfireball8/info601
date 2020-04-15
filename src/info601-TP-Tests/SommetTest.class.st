Class {
	#name : #SommetTest,
	#superclass : #TestCase,
	#category : #'info601-TP-Tests'
}

{ #category : #tests }
SommetTest >> testIfICanInstantiateASommetOfAnyOntologyType [

	| instance |
	instance := Sommet new.
	instance rdf_type: 'a:type'.
	self assert: (instance rdf_type = 'a:type').
	self deny: (instance rdf_type = 'a:nother_type').

]
