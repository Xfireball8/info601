"
I describe a classical genre of music. I am a element of the graph.

The value of my rdf_type is ""mo:Genre"", which correspond to the Genre class in 
the music Ontology. 

The value of my rdfs_label is the name by which the genre is described. That is left 
to my user to instanciate me with the corresponding label of the genre.

Instance Vars : 
	- rdf_type : ""Genre"" 
	- rdfs_label : aString (For example : ""Classic"")
"
Class {
	#name : #Genre,
	#superclass : #Vertices,
	#instVars : [
		'rdfs_label'
	],
	#category : #'info601-TP'
}

{ #category : #'instance creation' }
Genre class >> newWithName: aString [
	"a method to instanciate an album with its title."
			
	| instance |
	instance := self new.
	instance rdf_type: 'mo:genre'.
	instance rdfs_label: aString.
	^instance
]

{ #category : #accessing }
Genre >> rdfs_label [
	^ rdfs_label
]

{ #category : #accessing }
Genre >> rdfs_label: anObject [
	rdfs_label := anObject
]
