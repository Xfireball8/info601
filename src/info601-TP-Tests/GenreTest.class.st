"
I am a class which contains the test for the Genre Object in the info601-TP package.

What i am able to test : 
	- Can i create a genre with the correct ontology class ?
	- Can i create a genre with the label i provided  ?  
"
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
