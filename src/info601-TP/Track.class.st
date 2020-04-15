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
	#superclass : #Sommet,
	#instVars : [
		'rdfs_label'
	],
	#category : #'info601-TP'
}
