"
I am a class which contains the test for the MusicArtist Object in the info601-TP package.

What i am able to test : 
	- Can i create an artist with the correct ontology class ?
	- Can i create a artist with the name i provided  ?  
"
Class {
	#name : #MusicArtistTest,
	#superclass : #TestCase,
	#category : #'info601-TP-Tests'
}

{ #category : #tests }
MusicArtistTest >> testIfIAmOfTheCorrectOntologyType [
	
	| instance musicArtistOntologyType |
	instance := MusicArtist newWithName: 'something'.
	musicArtistOntologyType := instance rdf_type.
	self assert: (musicArtistOntologyType = 'mo:musicArtist').
	self deny: (musicArtistOntologyType = 'mo:aWrongOntologyClass').
]

{ #category : #tests }
MusicArtistTest >> testIfdidISetUpTheNameCorrectly [
	
	| instance |
	instance := MusicArtist newWithName: 'A new artist'.
	self assert: (instance foaf_name = 'A new artist').
	self deny: (instance foaf_name = 'A wrong album Name').
]
