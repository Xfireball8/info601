"
I am a work of music, specifically an album. I am a element of the graph.

The value of my rdf_type is ""mo:Album"", which correspond to the Album class in 
the music Ontology. 

The value of my rdfs_label is the title by which the album is described. That is left 
to my user to instanciate me with the corresponding label of the genre.

Instance Vars : 
	- rdf_type : ""Genre"" 
	- rdfs_label : aString (For example : ""Goldberg Variations"")
"
Class {
	#name : #Album,
	#superclass : #Sommet,
	#instVars : [
		'rdfs_label'
	],
	#category : #'info601-TP'
}

{ #category : #'instance creation' }
Album class >> newWithTitle: aString [
	"a method to instanciate an album with its title."
			
	| instance |
	instance := self new.
	instance rdf_type: 'mo:album'.
	instance rdfs_label: aString.
	^instance
]

{ #category : #accessing }
Album >> rdfs_label [
	^ rdfs_label
]

{ #category : #accessing }
Album >> rdfs_label: anObject [
	rdfs_label := anObject
]
