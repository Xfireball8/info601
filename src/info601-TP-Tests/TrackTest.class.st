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
