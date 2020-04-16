"
I am an abstract model of an element of the graph. The subclass extending me should 
initialize rdf_type to the correct class from an ontology.

Instances Var : 
	rdf:type -> The ontology class of the element.
"
Class {
	#name : #Vertices,
	#superclass : #Object,
	#instVars : [
		'rdf_type',
		'mark'
	],
	#category : #'info601-TP'
}

{ #category : #accessing }
Vertices >> mark [
	^ mark
]

{ #category : #accessing }
Vertices >> mark: anObject [
	mark := anObject
]

{ #category : #accessing }
Vertices >> rdf_type [
	^ rdf_type
]

{ #category : #accessing }
Vertices >> rdf_type: anObject [
	rdf_type := anObject
]
