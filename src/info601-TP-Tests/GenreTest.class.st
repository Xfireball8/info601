Class {
	#name : #GenreTest,
	#superclass : #TestCase,
	#category : #'info601-TP-Tests'
}

{ #category : #tests }
GenreTest >> testIfIAmOfTheCorrectOntologyType [
	
	| instance albumOntologyType |
	instance := Genre newWithName: 'something'.
	albumOntologyType := instance rdf_type.
	self assert: (albumOntologyType = 'mo:genre').
	self deny: (albumOntologyType = 'mo:aWrongOntologyClass').
]

{ #category : #tests }
GenreTest >> testIfdidISetUpTheNameCorrectly [
	
	| instance |
	instance := Genre newWithName: 'A new genre'.
	self assert: (instance rdfs_label = 'A new genre').
	self deny: (instance rdfs_label = 'A wrong album Name').
]
