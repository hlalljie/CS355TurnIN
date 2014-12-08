use hlalljie;


#Creating Tables

DROP TABLE IF EXISTS Artist;
CREATE TABLE Artist (
	Artist_Name VARCHAR(50) PRIMARY KEY,
	Rating INT,
	Biography VARCHAR (100),
	Members VARCHAR (100),
	Years VARCHAR (100)
);

DROP TABLE IF EXISTS Album;
CREATE TABLE Album (
	Album_Name VARCHAR(50),
	ArtistName VARCHAR(50) REFERENCES Artist(Artist_Name),
	#Artwork VARCHAR (100),
	Rating INT,
	#Rank INT,
	PRIMARY KEY (Album_Name, ArtistName)
);

DROP TABLE IF EXISTS Song;
CREATE TABLE Song (
	Song_Name VARCHAR(50),
	ArtistName VARCHAR(50) REFERENCES Artist(Artist_Name),
	AlbumName VARCHAR(50) REFERENCES Album(Album_Name),
	Rating INT,
	#Song_Time TIME,
	PRIMARY KEY (Song_Name, ArtistName, AlbumName)
);

DROP TABLE IF EXISTS Music;
CREATE TABLE Music (
	SongName VARCHAR(50) REFERENCES Song(Song_Name),
	ArtistName VARCHAR(50) REFERENCES Artist(Artist_Name),
	AlbumName VARCHAR(50) REFERENCES Album(Album_Name),
	Link VARCHAR(200),
	Music_Type VARCHAR(50),
	Rating INT,
	Difficulty INT,
	#Length VARCHAR(20),
	#Origin VARCHAR(50),
	#Rank_for_Song INT,
	Description VARCHAR(50),
	PRIMARY KEY (SongName, ArtistName, AlbumName, Link)	
);

DROP TABLE IF EXISTS Audio;
CREATE TABLE Audio (
	SongName VARCHAR(50) REFERENCES Song(Song_Name),
	ArtistName VARCHAR(50) REFERENCES Artist(Artist_Name),
	AlbumName VARCHAR(50) REFERENCES Album(Album_Name),
	Link VARCHAR(200),
	Audio_Type VARCHAR(50),
	Audio_Time VARCHAR(5),#TIME,
	Rank INT,
	#Origin VARCHAR(50),
	Description VARCHAR(50),
	PRIMARY KEY (SongName, ArtistName, AlbumName, Link)
);

SHOW TABLES;

#Inserting Values

#Artists

INSERT INTO Artist VALUES (
	"The Beatles",
	10,
	"http://en.wikipedia.org/wiki/The_Beatles",
	"John Lennon, Paul McCartney, George Harrison, Ringo Star",
	"1960-1970"
);
	INSERT INTO Album VALUES (
		"Rubber Soul",
		"The Beatles",
		10
	);
		INSERT INTO Song VALUES (
			"Wait",
			"The Beatles",
			"Rubber Soul",
			9
		);
			INSERT INTO Music VALUES (
				"Wait",
				"The Beatles",
				"Rubber Soul",
				"http://tabs.ultimate-guitar.com/b/beatles/wait_crd.htm",
				"Chords and Lyrics",
				8,
				5,
				"Rythm Guitar and Lyrics"
			);
			
			INSERT INTO Audio VALUES (
				"Wait",
				"The Beatles",
				"Rubber Soul",
				"https://www.youtube.com/watch?v=6O5w5h2T87c",
				"YouTube Link",
				"2:15",
				1,
				"2009 Stereo Remaster"
			);
			

	INSERT INTO Album VALUES (
		"Help",
		"The Beatles",
		9
	);
		INSERT INTO Song VALUES (
			"Ive Just Seen a Face",
			"The Beatles",
			"Help",
			8
		);
			INSERT INTO Music VALUES (
				"Ive Just Seen a Face",
				"The Beatles",
				"Help",
				"http://tabs.ultimate-guitar.com/b/beatles/ive_just_seen_a_face_ver4_crd_1061795id_31052011date.htm",
				"Chords and Lyrics",
				8,
				4,
				"Rythm Guitar and Lyrics"
			);

			INSERT INTO Audio VALUES (
				"Ive Just Seen a Face",
				"The Beatles",
				"Help",
				"https://www.youtube.com/watch?v=SbKGsEK_T9g",
				"YouTube Link",
				"2:09",
				1,
				"Original"
			);

		INSERT INTO Song VALUES (
			"Its Only Love",
			"The Beatles",
			"Help",
			8
		);
			INSERT INTO Music VALUES (
				"Its Only Love",
				"The Beatles",
				"Help",
				"http://tabs.ultimate-guitar.com/b/beatles/its_only_love_crd.htm",
				"Chords and Lyrics",
				8,
				6,
				"Rythm Guitar and Lyrics"
			);

			INSERT INTO Audio VALUES (
				"Its Only Love",
				"The Beatles",
				"Help",
				"https://www.youtube.com/watch?v=fIVx2dbWzvY",
				"YouTube Link",
				"1:59",
				1,
				"Original"
			);


	INSERT INTO Album VALUES (
		"The White Album",
		"The Beatles",
		10
	);
		INSERT INTO Song VALUES (
			"Blackbird",
			"The Beatles",
			"The White Album",
			8
		);
			INSERT INTO Music VALUES (
				"Blackbird",
				"The Beatles",
				"The White Album",
				"http://tabs.ultimate-guitar.com/b/beatles/blackbird_ver2_crd.htm",
				"Chords and Lyrics",
				9,
				7,
				"Lead Guitar and Lyrics"
			);

			INSERT INTO Audio VALUES (
				"Blackbird",
				"The Beatles",
				"The White Album",
				"https://www.youtube.com/watch?v=fIVx2dbWzvY",
				"YouTube Link",
				"2:52",
				1,
				"Lyrics"
			);

		



INSERT INTO Artist VALUES (
	"The Cream",
	8,
	"http://en.wikipedia.org/wiki/Cream_(band)",
	"Ginger Baker, Jack Bruce, Eric Clapton",
	"1966-1968"
);
	INSERT INTO Album VALUES (
		"Gold",
		"The Cream",
		8
	);
		INSERT INTO Song VALUES (
			"White Room",
			"The Cream",
			"Gold",
			8
		);
			INSERT INTO Music VALUES (
				"White Room",
				"The Cream",
				"Gold",
				"http://www.e-chords.com/chords/eric-clapton/white-room",
				"Chords and Lyrics",
				9,
				7,
				"Lead Guitar and Lyrics"
			);

			INSERT INTO Audio VALUES (
				"White Room",
				"The Cream",
				"Gold",
				"https://www.youtube.com/watch?v=pkae0-TgrRU",
				"YouTube Link",
				"4:57",
				1,
				"Studio Version"
			);

INSERT INTO Artist VALUES (
	"Creedence Clearwater Revival",
	6,
	"http://en.wikipedia.org/wiki/Creedence_Clearwater_Revival",
	"Doug Clifford, Stu Cook, John Fogerty, Tom Fogerty",
	"1967-1972"
);
	INSERT INTO Album VALUES (
		"The Long Road Home",
		"Creedence Clearwater Revival",
		6
	);
		INSERT INTO Song VALUES (
			"Bad Moon Rising",
			"Creedence Clearwater Revival",
			"The Long Road Home",
			6
		);
			INSERT INTO Music VALUES (
				"Bad Moon Rising",
				"Creedence Clearwater Revival",
				"The Long Road Home",
				"http://tabs.ultimate-guitar.com/c/creedence_clearwater_revival/bad_moon_rising_crd.htm",
				"Chords and Lyrics",
				6,
				2,
				"Guitar and Lyrics"
			);

			INSERT INTO Audio VALUES (
				"Bad Moon Rising",
				"Creedence Clearwater Revival",
				"The Long Road Home",
				"https://www.youtube.com/watch?v=zUQiUFZ5RDw",
				"YouTube Link",
				"2:18",
				1,
				"Lyric Video"
			);

INSERT INTO Artist VALUES (
	"David Bowie",
	9,
	"http://en.wikipedia.org/wiki/David_Bowie",
	"David Bowie",
	"1962-present"
);
	INSERT INTO Album VALUES (
		"Space Oddity",
		"David Bowie",
		8
	);
		INSERT INTO Song VALUES (
			"Space Oddity",
			"David Bowie",
			"Space Oddity",
			8
		);
			INSERT INTO Music VALUES (
				"Space Oddity",
				"David Bowie",
				"Space Oddity",
				"http://tabs.ultimate-guitar.com/d/david_bowie/space_oddity_ver2_crd.htm",
				"Chords and Lyrics",
				8,
				6,
				"Guitar and Lyrics"
			);

			INSERT INTO Audio VALUES (
				"Space Oddity",
				"David Bowie",
				"Space Oddity",
				"https://www.youtube.com/watch?v=nP6xBFyA_aw",
				"YouTube Link",
				"5:02",
				1,
				"Lyric Video(HD)"
			);

INSERT INTO Artist VALUES (
	"Don McLean",
	5,
	"http://en.wikipedia.org/wiki/Don_McLean",
	"Don McLean III",
	"1969-present"
);
	INSERT INTO Album VALUES (
		"American Pie",
		"Don McLean",
		6
	);
		INSERT INTO Song VALUES (
			"American Pie",
			"Don McLean",
			"American Pie",
			7
		);
			INSERT INTO Music VALUES (
				"American Pie",
				"Don McLean",
				"American Pie",
				"http://www.azchords.com/m/mcleandon-tabs-5354/americanpie-tabs-149066.html",
				"Chords and Lyrics",
				7,
				4,
				"Guitar and Lyrics"
			);

			INSERT INTO Audio VALUES (
				"American Pie",
				"Don McLean",
				"American Pie",
				"https://www.youtube.com/watch?v=uAsV5-Hv-7U",
				"YouTube Link",
				"8:41",
				1,
				"Lyric Video"
			);

INSERT INTO Artist VALUES (
	"Electric Light Orchestra",
	7,
	"http://en.wikipedia.org/wiki/Electric_Light_Orchestra",
	"Jeff Lyne, Roy Wood",
	"1970-present"
);
	INSERT INTO Album VALUES (
		"Discovery",
		"Electric Light Orchestra",
		7
	);
		INSERT INTO Song VALUES (
			"Dont Bring Me Down",
			"Electric Light Orchestra",
			"Discovery",
			7
		);
			INSERT INTO Music VALUES (
				"Dont Bring Me Down",
				"Electric Light Orchestra",
				"Discovery",
				"http://tabs.ultimate-guitar.com/e/electric_light_orchestra/dont_bring_me_down_crd.htm",
				"Tabs, Chords and Lyrics",
				7,
				7,
				"Guitar and Lyrics"
			);

			INSERT INTO Audio VALUES (
				"Dont Bring Me Down",
				"Electric Light Orchestra",
				"Discovery",
				"https://www.youtube.com/watch?v=qj8kMmUxkSE",
				"YouTube Link",
				"4:03",
				1,
				"Official Video"
			);


INSERT INTO Artist VALUES (
	"The Hollies",
	8,
	"http://en.wikipedia.org/wiki/The_Hollies",
	"Tony Hicks, Bobby Elliot, Ray Stiles, Ian Parker, Steve Lauri, Peter Howarth",
	"1962-present"
);
	INSERT INTO Album VALUES (
		"Distant Light",
		"The Hollies",
		8
	);
		INSERT INTO Song VALUES (
			"Long Cool Women",
			"The Hollies",
			"Distant Light",
			8
		);
			INSERT INTO Music VALUES (
				"Long Cool Women",
				"The Hollies",
				"Distant Light",
				"http://tabs.ultimate-guitar.com/h/hollies/long_cool_woman_tab.htm",
				"Tab",
				8,
				7,
				"Guitar and Lyrics"
			);

			INSERT INTO Audio VALUES (
				"Long Cool Women",
				"The Hollies",
				"Distant Light",
				"https://www.youtube.com/watch?v=lP94PlEtsEQ",
				"YouTube Link",
				"3:14",
				1,
				"Official Video"
			);


INSERT INTO Artist VALUES (
	"Jimi Hendrix",
	10,
	"http://en.wikipedia.org/wiki/Jimi_Hendrix",
	"Jimi Hendrix, Mitch Mitchell, Noel Redding, Billy Cox",
	"1966-1970"
);
	INSERT INTO Album VALUES (
		"Are You Experienced",
		"Jimi Hendrix",
		10
	);
		INSERT INTO Song VALUES (
			"Purple Haze",
			"Jimi Hendrix",
			"Are You Experienced",
			9
		);
			INSERT INTO Music VALUES (
				"Purple Haze",
				"Jimi Hendrix",
				"Are You Experienced",
				"http://tabs.ultimate-guitar.com/j/jimi_hendrix/purple_haze_tab.htm",
				"Tab and Lyrics",
				9,
				8,
				"Guitar and Lyrics"
			);

			INSERT INTO Audio VALUES (
				"Purple Haze",
				"Jimi Hendrix",
				"Are You Experienced",
				"https://www.youtube.com/watch?v=fjwWjx7Cw8I",
				"YouTube Link",
				"3:14",
				1,
				"Official Video"
			);
	INSERT INTO Album VALUES (
		"Axis Bold as Love",
		"Jimi Hendrix",
		9
	);
		INSERT INTO Song VALUES (
				"Little Wing",
				"Jimi Hendrix",
				"Axis Bold as Love",
				10
			);
				INSERT INTO Music VALUES (
					"Little Wing",
					"Jimi Hendrix",
					"Axis Bold as Love",
					"http://www.songsterr.com/a/wsa/jimi-hendrix-little-wing-tab-s321t0",
					"Tab and Walkthough",
					10,
					9,
					"Lead Guitar with walkthough program"
				);

				INSERT INTO Music VALUES (
					"Little Wing",
					"Jimi Hendrix",
					"Axis Bold as Love",
					"https://www.youtube.com/watch?v=oc0djVAs7sg",
					"YouTube Lesson",
					10,
					9,
					"Lead Guitar Lesson"
				);

				INSERT INTO Audio VALUES (
					"Little Wing",
					"Jimi Hendrix",
					"Axis Bold as Love",
					"https://www.youtube.com/watch?v=03yPUlBE5OU",
					"YouTube Link",
					"3:16",
					1,
					"Official Video"
				);


INSERT INTO Artist VALUES (
	"John Denver",
	7,
	"http://en.wikipedia.org/wiki/John_Denver",
	"John Denver",
	"1962-1997"
);
	INSERT INTO Album VALUES (
		"John Denvers Greatest Hits",
		"John Denver",
		7
	);
		INSERT INTO Song VALUES (
				"Take Me Home, Country Roads",
				"John Denver",
				"John Denvers Greatest Hits",
				7
			);
				INSERT INTO Music VALUES (
					"Take Me Home, Country Roads",
					"John Denver",
					"John Denvers Greatest Hits",
					"http://tabs.ultimate-guitar.com/j/john_denver/country_roads_crd.htm",
					"Tab and Walkthough",
					7,
					3,
					"Chords and Lyrics"
				);

				INSERT INTO Audio VALUES (
					"Take Me Home, Country Roads",
					"John Denver",
					"John Denvers Greatest Hits",
					"https://www.youtube.com/watch?v=1vrEljMfXYo",
					"YouTube Link",
					"3:18",
					1,
					"YouTube Audio"
				);

INSERT INTO Artist VALUES (
	"Johnny Cash",
	9,
	"http://en.wikipedia.org/wiki/Johnny_Cash",
	"Johy Cash",
	"1954-2003"
);
	INSERT INTO Album VALUES (
		"Unearthed",
		"Johnny Cash",
		9
	);
		INSERT INTO Song VALUES (
				"Hurt",
				"Johnny Cash",
				"Unearthed",
				9
			);
				INSERT INTO Music VALUES (
					"Hurt",
					"Johnny Cash",
					"Unearthed",
					"http://tabs.ultimate-guitar.com/j/johnny_cash/hurt_ver5_crd.htm?ab_group=player_combo&utm_expid=18438345-117.Xl9Y1cGLRGGq9QYsTE9P2A.1&utm_referrer=https%3A%2F%2Fwww.google.com%2F",
					"Chords",
					9,
					2,
					"Chords and Lyrics"
				);

				INSERT INTO Audio VALUES (
					"Hurt",
					"Johnny Cash",
					"Unearthed",
					"https://www.youtube.com/watch?v=SmVAWKfJ4Go",
					"YouTube Link",
					"4:02",
					1,
					"Official Video"
				);


INSERT INTO Artist VALUES (
	"Neil Daimond",
	7,
	"http://en.wikipedia.org/wiki/Neil_Diamond",
	"Neil Diamond",
	"1962-present"
);
	INSERT INTO Album VALUES (
		"The Bang Years",
		"Neil Daimond",
		7
	);
		INSERT INTO Song VALUES (
				"Girl, Youll Be a Woman Soon",
				"Neil Daimond",
				"The Bang Years",
				7
			);
				INSERT INTO Music VALUES (
					"Girl, Youll Be a Woman Soon",
					"Neil Daimond",
					"The Bang Years",
					"http://tabs.ultimate-guitar.com/n/neil_diamond/girl_youll_be_a_woman_soon_crd.htm",
					"Chords",
					7,
					4,
					"Chords and Lyrics"
				);

				INSERT INTO Audio VALUES (
					"Girl, Youll Be a Woman Soon",
					"Neil Daimond",
					"The Bang Years",
					"https://www.youtube.com/watch?v=qGvMjgLXBi0",
					"YouTube Link",
					"3:23",
					1,
					"YouTube Audio"
				);

INSERT INTO Artist VALUES (
	"Weezer",
	6,
	"http://en.wikipedia.org/wiki/Neil_Diamond",
	"Rivers Cuomo, Patrick Wilson, Brian Bell, Scott Shriner",
	"1992-present"
);
	INSERT INTO Album VALUES (
		"Weezer",
		"Weezer",
		6
	);
		INSERT INTO Song VALUES (
				"Say It Aint So",
				"Weezer",
				"Weezer",
				6
			);
				INSERT INTO Music VALUES (
					"Say It Aint So",
					"Weezer",
					"Weezer",
					"http://tabs.ultimate-guitar.com/w/weezer/say_it_aint_so_crd.htm",
					"Chords and Lyrics",
					6,
					1,
					"Chords and Lyrics"
				);

				INSERT INTO Audio VALUES (
					"Say It Aint So",
					"Weezer",
					"Weezer",
					"https://www.youtube.com/watch?v=ENXvZ9YRjbo",
					"YouTube Link",
					"4:19",
					1,
					"YouTube Audio"
				);


SELECT * FROM Artist;
SELECT * FROM Album;
SELECT * FROM Song;
SELECT * FROM Music;
SELECT * FROM Audio;

#Queries
#1
SELECT DISTINCT Song.Song_Name, Song.ArtistName, Music.Link, Music.Rating FROM Music 
	JOIN Song ON Song.Song_Name = Music.SongName WHERE Song.ArtistName = "The Beatles";

#2
SELECT DISTINCT Song.Song_Name, Audio.Link, Audio.Rank FROM Audio 
	JOIN Song ON Song.Song_Name = Audio.SongName WHERE Audio.Rank = 1;

#3
SELECT Audio.SongName, Audio.ArtistName, Audio.AlbumName, Audio.Link FROM Audio
	UNION
	SELECT Music.SongName, Music.ArtistName, Music.AlbumName, Music.Link FROM Music;

#4
SELECT Artist.Rating AS Rating, Artist.Artist_Name, Song.Song_Name, Music.Link, Audio.Link FROM Artist
JOIN Song ON Song.ArtistName = Artist.Artist_Name
JOIN Music ON Music.SongName = Song.Song_Name
JOIN Audio ON Audio.SongName = Music.SongName
WHERE Artist.Rating > 7
ORDER BY Artist.Rating DESC;

#5
SELECT Artist.Artist_Name, Song.Song_Name, Music.Link, Music.Rating, Audio.Link FROM Artist
JOIN Song ON Song.ArtistName = Artist.Artist_Name
JOIN Music ON Music.SongName = Song.Song_Name
JOIN Audio ON Audio.SongName = Music.SongName
GROUP BY Song.Song_Name
ORDER BY Music.Rating DESC;

#Basic Artist - Song Selection
SELECT Song.* FROM Song JOIN
	Artist ON Artist.Artist_Name = Song.ArtistName
	WHERE Artist_Name = "The Beatles";

#Update
/*
UPDATE Song.ArtistName, Album.ArtistName SET
	Song.ArtistName = Album.ArtistName 
	WHERE Song.AlbumName = Album.Album_Name;
*/	

#View
DROP VIEW IF EXISTS Standard;
CREATE VIEW Standard AS (
	SELECT Album.ArtistName AS Artist, Album.Album_Name AS Album,
	Song.Song_Name AS Song
	FROM Song JOIN Album ON Album.Album_Name = Song.AlbumName
	ORDER BY Album.ArtistName, Album.Rating
);
 SELECT * FROM Standard;
