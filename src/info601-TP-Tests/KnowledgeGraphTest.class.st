"
I am a class that test the functionalities of the Knowledge Graph, and that ensure that 
the Knowledge Graph works properly.

What i test is : 
      - I want to add a Vertice to my graph.
      - I want to add a edge to my graph.
		- I want to get a Vertice that is in my graph.
		- I want to get a edge that is in my graph.
      - I want to get the edge of some vertice in my graph.
      - I want to get all the music in my graph.
		- I want to get a particular music.
		- I want to get a particular album.
		- I want to get a particular artist.
		- I want to get all the informations about one thing.
		- I want to get all similar music to one track.
		- I want to get all the informations about an artist.
		- I want to get the genre of the music that an artist is doing.
		- I want to get all the song of an album.
		- I want to get the genre of an album.
		
		
"
Class {
	#name : #KnowledgeGraphTest,
	#superclass : #TestCase,
	#category : #'info601-TP-Tests'
}

{ #category : #testing }
KnowledgeGraphTest >> testIfICanAddAVerticeToTheGraph [
	"This window is where i write new messages. I'm starting with the adding vertice functionality."
	| knowledge_graph vertice |
	vertice := Album newWithTitle: 'Godlberg Variations'. 
	knowledge_graph := KnowledgeGraph create.
	knowledge_graph addVertice: vertice.
	
"Now if the vertice is correctly added, if i check the number of elements in my set of vertices. It should be at one. Also, if i get the first element of the set, it should be my vertice. I can try to do my test like that"
	
	self assert: (knowledge_graph numberOfVertice = 1).
	self assert: ((knowledge_graph getVerticeByIndex: 1) = vertice).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanAddAnEdgeToTheGraph [

	"What i can do for this test is something like : adding two vertices and an edges, and ask
	if there is an edge for this vertice, and ask for it, i finally can compare the edge i 
	obtained with the one i added at start."
	

	| vertice1 vertice2 edge1 knowledgeGraph |
	
	vertice1 := Album newWithTitle: 'Goldberg Variations'.
	vertice2 := Track newWithTitle: 'Aria da capo'.
	edge1 := Edges newEdgeFrom: vertice1 to: vertice2  withRelationship: 'mo:item'.
	
	knowledgeGraph := KnowledgeGraph create. 	
	knowledgeGraph addVertice: vertice1.
	knowledgeGraph addVertice: vertice2.
	knowledgeGraph addEdge: edge1.
	
	self assert: (knowledgeGraph doesTheVerticeHasEdges: vertice1).
	self assert: ((knowledgeGraph getEdgesOfThisVertice: vertice1) 
	detect: [
		:from_or_to_edges | 
		true = (from_or_to_edges detect: [:eachVertice | eachVertice = edge1] ifFound:[true] ifNone:[false])
		]
	ifFound:[true] 
	ifNone:[false]
	).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetAEdgeOfAVerticeToTheGraph [

	| vertice1 vertice2 edge1 knowledgeGraph |
	
	vertice1 := Album newWithTitle: 'Goldberg Variations'.
	vertice2 := Track newWithTitle: 'Aria da capo'.
	edge1 := Edges newEdgeFrom: vertice1 to: vertice2  withRelationship: 'mo:item'.
	
	knowledgeGraph := KnowledgeGraph create. 	
	knowledgeGraph addVertice: vertice1.
	knowledgeGraph addVertice: vertice2.
	knowledgeGraph addEdge: edge1.
	
	"If we want to test if i can get a Vertice of my graph. I can simply get all the edges of
	the graph and then see if the one i added ear."
	
	self assert: (knowledgeGraph getAllEdges detect: [:each | each = edge1] ifFound: [true] ifNone: [false])
	
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetAParticularAlbum [
	
	| knowledgeGraph album1 album2 name_album1 name_album2 |
	name_album1 := 'Goldberg Variations'.
	name_album2 := '8 Études-Tableaux'.
	
	knowledgeGraph := KnowledgeGraph createTpGraph.
	album1 := knowledgeGraph getTheAlbumWithTheName: name_album1.
	album2 := knowledgeGraph getTheAlbumWithTheName: name_album2.
	
	
	self assert: (album1 rdfs_label = name_album1).
	self assert: (album2 rdfs_label = name_album2).
	
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetAParticularArtist [
	
	| knowledgeGraph artist1 artist2 name_artist1 name_artist2 |
	name_artist1 := 'Bach Johann Sebastian'.
	name_artist2 := 'Alberto Ferro'.
	
	knowledgeGraph := KnowledgeGraph createTpGraph.
	artist1 := knowledgeGraph getTheArtistWithTheName: name_artist1.
	artist2 := knowledgeGraph getTheArtistWithTheName: name_artist2.
	
	
	self assert: (artist1 foaf_name = name_artist1).
	self assert: (artist2 foaf_name = name_artist2).
	
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetAParticularMusic [
	
	| knowledgeGraph track1 track2 name_track1 name_track2 |
	name_track1 := 'Aria da capo'.
	name_track2 := 'Op. 33: No. 1 in F Minor'.
	
	knowledgeGraph := KnowledgeGraph createTpGraph.
	track1 := knowledgeGraph getTheTrackWithTheName: name_track1.
	track2 := knowledgeGraph getTheTrackWithTheName: name_track2.
	
	
	self assert: (track1 rdfs_label = name_track1).
	self assert: (track2 rdfs_label = name_track2).
	
]

{ #category : #testing }
KnowledgeGraphTest >> testIfICanGetAVerticeOfMyGraph [
"Try to do the test on getting vertices of the graph, how you''ll do t ? i see the other because i don't remember the sintax"

	"I need in order to do this to create some vertices and edges."	
		| vertice1 vertice2 edge1 knowledgeGraph|
		vertice1 := Album newWithTitle: 'ciao'.
		vertice2 := Track newWithTitle: 'asad'.
		edge1 := Edges newEdgeFrom: vertice1 to: vertice2  withRelationship: 'dc:Creator'. 
		knowledgeGraph := KnowledgeGraph create.
		knowledgeGraph addVertice: vertice1.
		knowledgeGraph addVertice: vertice2.	
		knowledgeGraph addEdge: edge1. 
		
		self assert: (knowledgeGraph getAllVertices detect: [:each | each = vertice1] ifFound:[true] ifNone:[false]).
		self assert: (knowledgeGraph getAllVertices detect: [:each | each = vertice2] ifFound:[true] ifNone:[false]).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetAllSimilarMusicToOne [
	
	| knowledgeGraph track_name tracks_test tracks_similar |
	track_name := 'Aria da capo'.
	knowledgeGraph := KnowledgeGraph createTpGraph.
	tracks_test := knowledgeGraph getTracksWithTheName: track_name.
	tracks_similar := knowledgeGraph getAllSimilarTracksTo: track_name.
	
	"Alright"
	self assert: (
	tracks_test allSatisfy: [ 
		:eachTracksFromTracksTest |
			tracks_similar anySatisfy: [ 
					:eachTracksFromTracksSimilar |
						eachTracksFromTracksSimilar = eachTracksFromTracksTest
				 ] 
		 ]
	).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetAnEdgeOfMyGraph [

	| vertice1 vertice2 edge1 knowledgeGraph |
	
	vertice1 := Album newWithTitle: 'Goldberg Variations'.
	vertice2 := Track newWithTitle: 'Aria da capo'.
	edge1 := Edges newEdgeFrom: vertice1 to: vertice2  withRelationship: 'mo:item'.
	
	knowledgeGraph := KnowledgeGraph create. 	
	knowledgeGraph addVertice: vertice1.
	knowledgeGraph addVertice: vertice2.
	knowledgeGraph addEdge: edge1.
	
	self assert: (knowledgeGraph getAllEdges detect: [:each | each = edge1] ifFound:[true] ifNone:[false]).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetInformationAboutAThing [

	| knowledgeGraph track_genre track_album track_name infos track_artist |
	track_name := 'Op. 33: No. 1 in F Minor'.
	knowledgeGraph := KnowledgeGraph createTpGraph.
	track_album := knowledgeGraph getTheAlbumWithTheName: '8 Études-Tableaux'.
	track_genre := knowledgeGraph getTheGenreWithTheName: 'Classic'.
	track_artist := knowledgeGraph getTheArtistWithTheName: 'Alberto Ferro'.
	infos := knowledgeGraph getInfosAboutTheTrack: track_name.
	
	self assert:(infos anySatisfy: [:each | track_album = each]).
	self assert:(infos anySatisfy: [:each | track_genre = each]).
	self assert:(infos anySatisfy: [:each | track_artist = each]).
	
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetTheGenreOfAnAlbum [
	| knowledgeGraph classic_genre test_genre album_test |
	knowledgeGraph := KnowledgeGraph createTpGraph .
	classic_genre := knowledgeGraph getTheGenreWithTheName: 'classic'.
	album_test := knowledgeGraph getAnAlbum.
	test_genre := knowledgeGraph getTheGenreOfThisAlbum: album_test.
	
	self assert: (test_genre = classic_genre).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetTheGenreOfTheMusicThatAnArtistIsDoing [
	| knowledgeGraph genre_test genre_get |
	knowledgeGraph := KnowledgeGraph createTpGraph.
	genre_test := knowledgeGraph getTheGenreWithTheName: 'Classic'.
	genre_get := knowledgeGraph getTheGenreOfThisArtist: 'Alberto Ferro'.
	
	self assert: (genre_test = genre_get).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfICanGetTheMusicOfAnAlbum [

	| album_name songs knowledgeGraph songs_test song_res |
	album_name := 'Goldberg Variations'.
	knowledgeGraph := KnowledgeGraph createTpGraph.
	songs_test := knowledgeGraph getTracksWithTheName: 'Aria da capo'.
	song_res := knowledgeGraph getTracksOfThisAlbum: album_name.
	
	
	self assert: (
	song_res allSatisfy: [ 
		:eachRes |
			songs_test anySatisfy: [ 
				:eachTest |
					(eachRes = eachTest)
				 ]
		 ]
	).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfIcanGetAllAlbumsInMyGraph [

	| knowledgeGraph tracksWithoutTraversal trackWithTraversal |
	knowledgeGraph := KnowledgeGraph createTpGraph.
	
	tracksWithoutTraversal  := knowledgeGraph getAllAlbumsWithoutTraversal.
	trackWithTraversal := knowledgeGraph getAllAlbums.
	
	self assert: (
	trackWithTraversal allSatisfy: 
		[:eachTrackWithTraversal | 
				tracksWithoutTraversal anySatisfy: 
					[ 
						:eachTrackWithoutTraversal |
						eachTrackWithoutTraversal = eachTrackWithTraversal 
				 	]
		]
	).
]

{ #category : #tests }
KnowledgeGraphTest >> testIfIcanGetAllTheInformationsAboutAnArtist [

	| knowledgeGraph infos  artist_name artist_track artist_album |
	artist_name := 'Alberto Ferro'.
	knowledgeGraph := KnowledgeGraph createTpGraph.
	artist_album := knowledgeGraph getTheAlbumWithTheName: '8 Études-Tableaux'.
	artist_track := knowledgeGraph getTheTrackWithTheName: 'Op. 33: No. 1 in F Minor'.
	infos := knowledgeGraph getInfosAboutTheArtist: artist_name.
	
	self assert:(infos anySatisfy: [:each | artist_album   = each]).
	self assert:(infos anySatisfy: [:each | artist_track  = each]).
	
]

{ #category : #tests }
KnowledgeGraphTest >> testIfIcanGetAllTracksInMyGraph [

	| knowledgeGraph tracksWithoutTraversal trackWithTraversal |
	knowledgeGraph := KnowledgeGraph createTpGraph.
	
	tracksWithoutTraversal  := knowledgeGraph getAllTracksWithoutTraversal.
	trackWithTraversal := knowledgeGraph getAllTracks.
	
	self assert: (
	trackWithTraversal allSatisfy: 
		[:eachTrackWithTraversal | 
				tracksWithoutTraversal anySatisfy: 
					[ 
						:eachTrackWithoutTraversal |
						eachTrackWithoutTraversal = eachTrackWithTraversal 
				 	]
		]
	).
]
