"
I describe a music track. I am a element of the graph.

The value of my rdf_type is ""mo:Track"", which correspond to the Track class in 
The Music Ontology. 

The value of my rdfs_label is the name by which the music is described. That is left 
to my user to instanciate me with the corresponding label of the genre.

Instance Vars : 
	- rdf_type : ""Genre"" 
	- rdfs_label : aString (For example : ""Aria Da Capo"")
"
Class {
	#name : #Track,
	#superclass : #Vertices,
	#instVars : [
		'rdfs_label'
	],
	#category : #'info601-TP'
}

{ #category : #'instance creation' }
Track class >> newWithTitle: aString [
	"a method to instanciate an album with its title."
			
	| instance |
	instance := self new. 
	instance mark: false.
	instance rdf_type: 'mo:track'. 
	instance rdfs_label: aString. 
	^instance
]

{ #category : #accessing }
Track >> rdfs_label [
	^ rdfs_label
]

{ #category : #accessing }
Track >> rdfs_label: anObject [
	"This is a comment, this is a function that take an object as a paremeter and put it in the
	rdfs_label variable of this object."
	rdfs_label := anObject
]
