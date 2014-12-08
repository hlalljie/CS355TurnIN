var mysql   = require('mysql');


/* DATABASE CONFIGURATION */
var connection = mysql.createConnection({
    host: 'cwolf.cs.sonoma.edu',
    user: 'hlalljie',
    password: '003933441'
    //user: 'your_username',
    //password: 'your_password'
});

var dbToUse = 'hlalljie';

//use the database for any queries run
var useDatabaseQry = 'USE ' + dbToUse;

//create the User table if it does not exist
connection.query(useDatabaseQry, function (err) {
    if (err) throw err;
});

exports.GetSongs = function(callback) {
    connection.query('SELECT * FROM Song ORDER BY Rating DESC',
        //connection.query('select UserID, Email from User',
        function (err, result) {
            if(err) {
                console.log(err);
                callback(true);
                return;
            }
            callback(false, result);
        }
    );
}

    exports.GetSongView = function(r, callback) {
        connection.query('SELECT Song.Rating, Song.Song_Name, Song.ArtistName, Song.AlbumName, ' +
            'Music.Link AS MLink, Music.Music_Type, Music.Rating AS MRating, Music.Difficulty, Music.Description FROM Song JOIN ' +
            'Music ON Music.SongName = Music.SongName ' +
            'WHERE Song.Song_Name = \'' + r.Song + '\' AND ' +
            'Song.ArtistName = \'' + r.Artist + '\' AND ' +
            'Song.AlbumName = \'' + r.Album + '\' AND ' +
            'Music.ArtistName = \'' + r.Artist + '\' AND ' +
            'Music.AlbumName = \'' + r.Album + '\' ' +
            'ORDER BY Song.Rating DESC;',
            //connection.query('select UserID, Email from User',
            function (err, result) {
                if(err) {
                    console.log(err);
                    callback(true);
                    return;
                }
                callback(false, result);
            }
        );
    }

exports.GetArtists = function(callback) {
    connection.query('SELECT * FROM Artist ORDER BY Rating DESC',
        //connection.query('select UserID, Email from User',
        function (err, result) {
            if(err) {
                console.log(err);
                callback(true);
                return;
            }
            callback(false, result);
        }
    );
}

    exports.GetArtistView = function(Artist, callback) {
        connection.query('SELECT Artist.Rating, Artist.Artist_Name, Artist.Years, Artist.Biography , Artist.Members, ' +
            'Song.Song_Name, Song.AlbumName, Song.Rating FROM Artist JOIN ' +
            'Song ON Song.ArtistName = Artist.Artist_Name ' +
            'WHERE Artist_Name = \'' + Artist + "\' " +
            "ORDER BY Song.Rating DESC;",
            //connection.query('select UserID, Email from User',
            function (err, result) {
                if(err) {
                    console.log(err);
                    callback(true);
                    return;
                }
                if(result.length > 0) {
                    callback(false, result);
                }
                else{
                    connection.query('SELECT * FROM Artist WHERE Artist_Name = \'' + Artist + '\';',
                        function (err1, result1) {
                            if(err1) {
                                console.log(err1);
                                callback(true);
                                return;
                            }
                            callback(false, result1);
                        }
                    );
                }

            }
        );
    }

exports.GetAlbums = function(callback) {
    connection.query('SELECT * FROM Album JOIN Artist ON' +
        ' Artist.Artist_Name = Album.ArtistName ORDER BY Artist.Rating DESC',
        //connection.query('select UserID, Email from User',
        function (err, result) {
            if(err) {
                console.log(err);
                callback(true);
                return;
            }
            callback(false, result);
        }
    );
}

    exports.GetAlbumView = function(r, callback) {
        connection.query('SELECT Album.Rating, Album.Album_Name, Album.ArtistName, ' +
            'Song.Song_Name, Song.Rating FROM Album JOIN ' +
            'Song ON Song.AlbumName = Album.Album_Name ' +
            'WHERE Album.Album_Name = \'' + r.Album + '\' AND ' +
            'Album.ArtistName = \'' + r.Artist + '\' AND ' +
            'Song.ArtistName = \'' + r.Artist + '\' ' +
            'ORDER BY Song.Rating DESC;',
            //connection.query('select UserID, Email from User',
            function (err, result) {
                if(err) {
                    console.log(err);
                    callback(true);
                    return;
                }
                callback(false, result);
            }
        );
    }

exports.GetTabs = function(callback) {
    connection.query('SELECT * FROM Music ORDER BY Rating DESC',
        //connection.query('select UserID, Email from User',
        function (err, result) {
            if(err) {
                console.log(err);
                callback(true);
                return;
            }
            callback(false, result);
        }
    );
}

exports.GetAudio = function(callback) {
    connection.query('SELECT * FROM Audio ORDER BY Rank',
        //connection.query('select UserID, Email from User',
        function (err, result) {
            if(err) {
                console.log(err);
                callback(true);
                return;
            }
            callback(false, result);
        }
    );
}

exports.AddArtist = function(Artist, callback) {
    var query = 'INSERT INTO Artist VALUES (\"' + Artist.Artist_Name + '\", ' + Artist.Rating + ', \"' + Artist.Biography +  '\", \"' + Artist.Members + '\", \"' + Artist.Years + '\");';
        console.log(query);
        connection.query(query,
        //connection.query('select UserID, Email from User',
        function (err, result) {
            if(err) {
                console.log(err);
                callback(true);
                return;
            }
            callback(false, result);
        }
    );
}