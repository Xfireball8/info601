"
I am the object which is the model behind our Knowledge Graph. I implement a 
mathematical model of a Graph, where vertices can be any object that is a subclass of Vertices (Album,genre,musicArtist...)

I contain a set of Vertices, and an adjacent matrix of Directed Edges.
"
Class {
	#name : #KnowledgeGraph,
	#superclass : #Object,
	#instVars : [
		'vertices',
		'edges'
	],
	#category : #'info601-TP'
}

{ #category : #'instance creation' }
KnowledgeGraph class >> create [

	| instance |
	instance := self new.
	instance vertices: VerticeArray create.
	instance edges: EdgesMatrix create.
	^instance

	
]

{ #category : #'instance creation' }
KnowledgeGraph class >> createTpGraph [

	"Create the graph we draw in for the TP."
	
	
	| artist1 artist2 artist3 album1 music1 music2 music3 genre1 edge1 edge2 edge3 edge4 edge5 edge6 	edge7 edge8 edge9 edge10 instance |
	
	
	"++++++ Genre ++++++"
	genre1 := Genre newWithName: 'Classic'.
	
	"++++++ Music ++++++"
	music1 := Track newWithTitle: 'Aria da capo'.
	music2 := Track newWithTitle: 'Aria da capo'.
	music3 := Track newWithTitle: 'Aria da capo'.
	
	"++++++ Album   ++++++"
	album1 := Album newWithTitle: 'Goldberg Variations'.
	
	"++++++ Artists ++++++"
	artist1 := MusicArtist newWithName: 'Gustav Leonhardt'.
	artist2 := MusicArtist newWithName: 'Bach Johann Sebastian'.
	artist3 := MusicArtist newWithName: 'Angela Hewitt'.
	

	"++++++ Edge ++++++"
	edge1 := Edges newEdgeFrom: artist2  to:  album1  withRelationship: 'dc:creator'.
	edge2 := Edges newEdgeFrom: artist2 to:  music1 withRelationship: 'dc:creator'.
	edge3 := Edges newEdgeFrom: music3 to: music1  withRelationship: 'mo:similarTo'.
	edge4 := Edges newEdgeFrom: music1 to:music2  withRelationship: 'mo:similarTo'.
	edge5 := Edges newEdgeFrom: music2 to: music3  withRelationship: 'mo:similarTo'.
	edge6 := Edges newEdgeFrom: music1 to: genre1 withRelationship: 'mo:genre'.
	edge7 := Edges newEdgeFrom: music2 to: genre1 withRelationship: 'mo:genre'.
	edge8 := Edges newEdgeFrom: music3 to: genre1 withRelationship: 'mo:genre'.
	edge9 := Edges newEdgeFrom: artist1  to: music3 withRelationship: 'dc:creator'.
	edge10 :=  Edges newEdgeFrom: artist3  to: music2 withRelationship: 'dc:creator'.
	
	instance := self create.
	instance addVertice: genre1.
	instance addVertice: album1.
	instance addVertice: artist1.
	instance addVertice: artist2.
	instance addVertice: artist3.
	instance addVertice: music1.
	instance addVertice: music2.
	instance addVertice: music3.
	instance addEdge: edge1.
	instance addEdge: edge2.
	instance addEdge: edge3.
	instance addEdge: edge4.
	instance addEdge: edge5.
	instance addEdge: edge6.
	instance addEdge: edge7.
	instance addEdge: edge8.
	instance addEdge: edge9.
	instance addEdge: edge10.
	
	^instance
]

{ #category : #adding }
KnowledgeGraph >> addEdge: anEdge [
	
	| vertice1 vertice2 index1 index2 |
	vertice1 := anEdge begining.
	vertice2 := anEdge ending.
	index1 := self getIndexOfVertice: vertice1.
	index2 := self getIndexOfVertice: vertice2.
	edges add: anEdge toLine: index1 toColumn: index2.
	
	
]

{ #category : #'adding item' }
KnowledgeGraph >> addVertice: aVertice [

	self vertices add: aVertice.
	edges incrementVerticesNumber
]

{ #category : #test }
KnowledgeGraph >> doesTheVerticeHasEdges: aVertice [
	" Je veux savoir si ma vertice possède au moins une arrête. Les arrêtes sont stoquées dans 	  	  	EdgesMatrix.
	  Dans une matrice d'adjacence d'un graphe orienté on a M[i,j] = 1 si il y a une arrête qui va de
	  j vers i.
	Ici le sens nous importe peu car nous recherchons juste la présence d'une arrête, on regardera alors
	l'axe x et l'axe y de l'index du sommet."
	
	| from_axis to_axis index |
	index := (self getIndexOfVertice: aVertice).
	from_axis := edges getAllPossibleEdgesThatGoesFrom: index.
	to_axis := edges getAllPossibleEdgesThatGoesTo: index.
	(from_axis anySatisfy:[:each | (each notNil)]) ifTrue: [^true].
	(to_axis anySatisfy:[:each | (each notNil)]) ifTrue: [^true].
	^false
	
	
]

{ #category : #accessing }
KnowledgeGraph >> edges [
	^ edges
]

{ #category : #accessing }
KnowledgeGraph >> edges: anObject [
	edges := anObject
]

{ #category : #accessing }
KnowledgeGraph >> getAllEdges [
	^self edges
]

{ #category : #accessing }
KnowledgeGraph >> getAllVertices [
	^self vertices
]

{ #category : #test }
KnowledgeGraph >> getEdgesOfThisVertice: aVertice [
	
	| from_axis to_axis from_edges to_edges res |
	res := Array new: 2.
	from_edges := VerticeArray create.
	to_edges := VerticeArray create.
	from_axis := (self edges getAllPossibleEdgesThatGoesFrom: (self getIndexOfVertice: aVertice)).
	to_axis := (self edges getAllPossibleEdgesThatGoesTo: (self getIndexOfVertice: aVertice)).
	from_axis do: [ :each | each isNotNil ifTrue: [ from_edges add: each ] ].
	to_axis do: [ :each | each isNotNil ifTrue: [ to_edges add: each ] ].
	res at: 1 put: from_edges.
	res at: 2 put: to_edges.
	^res
	"detect: [ :each | each isNotNil ]"
	
]

{ #category : #accessing }
KnowledgeGraph >> getIndexOfVertice: aVertice [
	| d| 
	d := self vertices indexOfThisVertice: aVertice.
	^d
	
	
]

{ #category : #accessing }
KnowledgeGraph >> getVerticeByIndex: anInteger [

	(anInteger < vertices index) ifTrue: [ 
		^vertices get: anInteger
		 ] ifFalse: [ 
		^nil
		 ]
]

{ #category : #accessing }
KnowledgeGraph >> numberOfVertice [

	^(vertices index - 1)
]

{ #category : #accessing }
KnowledgeGraph >> vertices [ 
	^vertices 

]

{ #category : #accessing }
KnowledgeGraph >> vertices: anArrayOfVertices [

	vertices := anArrayOfVertices 
]
