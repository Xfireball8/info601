"
I am a class which contains the test for the Album Object in the info601-TP package.

What i am able to test : 
	- Can i create an album with the correct ontology class ?
	- Can i create an album with the name i provided  ?  
"
Class {
	#name : #AlbumTest,
	#superclass : #TestCase,
	#category : #'info601-TP-Tests'
}

{ #category : #testing }
AlbumTest >> testIfIAmOfTheCorrectOntologyType [
	
	| instance albumOntologyType |
	instance := Album newWithTitle: 'something'.
	albumOntologyType := instance rdf_type.
	self assert: (albumOntologyType = 'mo:album').
	self deny: (albumOntologyType = 'mo:aWrongOntologyClass').
]

{ #category : #testing }
AlbumTest >> testIfdidISetUpTheNameCorrectly [
	
	| instance |
	instance := Album newWithTitle: 'A test album'.
	self assert: (instance rdfs_label = 'A test album').
	self deny: (instance rdfs_label = 'A wrong album Name').
]
