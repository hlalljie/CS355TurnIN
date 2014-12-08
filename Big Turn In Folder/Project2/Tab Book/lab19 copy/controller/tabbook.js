var express = require('express');
var router  = express.Router();
var db   = require('../models/db');

router.get('/Title', function (req, res) {
    db.GetArtists(function (err, result) {
            if (err) throw err;
            res.render('Title.ejs', {a: result});
        }
    );
});

router.get('/Songs', function (req, res) {
    db.GetSongs(function (err, result) {
            if (err) throw err;
            res.render('Songs.ejs', {rs: result});
        }
    );
});

    router.get('/Song', function (req, res) {
        db.GetSongView(req.query,function (err, result) {
                if (err) throw err;
                res.render('Song.ejs', {rs: result});
            }
        );
    });

router.get('/Artists', function (req, res) {
    db.GetArtists(function (err, result) {
            if (err) throw err;
            res.render('Artists.ejs', {rs: result});
        }
    );
});
    router.get('/Artist', function (req, res) {
        db.GetArtistView(req.query.Artist,function (err, result) {
                if (err) throw err;
                res.render('Artist.ejs', {rs: result});
            }
        );
    });

    router.post('/ArtistView', function (req, res) {
        db.GetArtistView(req.body.Artist,function (err, result) {
                if (err) throw err;
                res.render('Artist.ejs', {rs: result});
            }
        );
    });

router.get('/Albums', function (req, res) {
    db.GetAlbums(function (err, result) {
            if (err) throw err;
            res.render('Albums.ejs', {rs: result});
        }
    );
});

    router.get('/Album', function (req, res) {
        console.log(req.query);
        db.GetAlbumView(req.query,function (err, result) {
                if (err) throw err;
                res.render('Album.ejs', {rs: result});
            }
        );
    });

router.get('/Tabs', function (req, res) {
    db.GetTabs(function (err, result) {
            if (err) throw err;
            res.render('Tabs.ejs', {rs: result});
        }
    );
});

router.get('/Audio', function (req, res) {
    db.GetAudio(function (err, result) {
            if (err) throw err;
            res.render('Audio.ejs', {rs: result});
        }
    );
});

router.get('/Add', function (req, res) {
            res.render('AddArtist.ejs');
});

router.post('/Add', function (req, res) {
    db.AddArtist(req.body,function (err, result) {
            if (err) throw err;
        }
    );

    db.GetArtistView(req.body,function (err, result) {
            if (err) throw err;
            console.log(result);
            res.render('Artist.ejs', {rs: result});
        }
    );
});

router.get('/About', function (req, res) {
    res.render('about.ejs');
});


module.exports = router;

