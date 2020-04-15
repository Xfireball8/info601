"
I am a class which contains the test for the Track Object in the info601-TP package.

What i am able to test : 
	- Can i create a track with the correct ontology class ?
	- Can i create a track with the title i provided  ?  
"
Class {
	#name : #TrackTest,
	#superclass : #TestCase,
	#category : #'info601-TP-Tests'
}

{ #category : #tests }
TrackTest >> testIfIAmOfTheCorrectOntologyType [
	
	| instance musicArtistOntologyType |
	instance := Track newWithTitle: 'A new Track'.
	musicArtistOntologyType := instance rdf_type.
	self assert: (musicArtistOntologyType = 'mo:track').
	self deny: (musicArtistOntologyType = 'mo:aWrongOntologyClass').
]

{ #category : #tests }
TrackTest >> testIfdidISetUpTheNameCorrectly [
	
	| instance |
	instance := Track newWithTitle: 'A new track'.
	self assert: (instance rdfs_label  = 'A new track').
	self deny: (instance rdfs_label  = 'A wrong album Name').
]
