"
I describe a person who is a music artist. I am a element of the graph.

The value of my rdf_type is ""mo:musicArtist"", which correspond to the Genre class in 
the music Ontology. 

The value of my foaf_name is the name by which the artist is called. That is left 
to my user to instanciate me with the corresponding label of the genre.

Instance Vars : 
	- rdf_type : ""Genre"" 
	- rdfs_label : aString (For example : ""Classic"")
"
Class {
	#name : #MusicArtist,
	#superclass : #Vertices,
	#instVars : [
		'foaf_name'
	],
	#category : #'info601-TP'
}

{ #category : #'instance creation' }
MusicArtist class >> newWithName: aString [
	"a method to instanciate an artist with its name."
			
	| instance |
	instance := self new.
	instance rdf_type: 'mo:musicArtist'.
	instance foaf_name: aString.
	^instance
]

{ #category : #accessing }
MusicArtist >> foaf_name [
	^ foaf_name
]

{ #category : #accessing }
MusicArtist >> foaf_name: anObject [
	foaf_name := anObject
]
