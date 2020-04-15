"
I am an abstract model of an element of the graph. The subclass extending me should 
initialize rdf_type to the correct class from an ontology.

Instances Var : 
	rdf:type -> The ontology class of the element.
"
Class {
	#name : #Sommet,
	#superclass : #Object,
	#instVars : [
		'rdf_type'
	],
	#classInstVars : [
		'rdf_type'
	],
	#category : #'info601-TP'
}

{ #category : #'instance creation' }
Sommet class >> new [
	"Classe abstraite ne peut être implémentée"
	^self subclassResponsibility 
]

{ #category : #accessing }
Sommet >> rdf_type [
	^ rdf_type
]
