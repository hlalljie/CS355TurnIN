var express = require('express');
var router  = express.Router();
var db   = require('../models/db');


/* View all users in a <table> */
router.get('/all', function (req, res) {
    db.GetAll(function (err, result) {
            if (err) throw err;
            res.render('displayUserTable.ejs', {rs: result});
        }
    );
});

/* Create a User */

// Create User Form
router.get('/create', function(req, res){
    res.render('simpleform.ejs', {action: '/user/create'});
});

// Save User to the Database
router.post('/create', function (req, res) {
    db.Insert( req.body, function (err, result) {
            if (err) throw err;

            if(result.AccountID != 'undefined') {
                var placeHolderValues = {
                    email: req.body.email,
                    username: req.body.username,
                    password: req.body.password
                };
                res.render('displayUserInfo.ejs', placeHolderValues);
            }
            else {
                res.send('Account was not inserted.');
            }
        }
    );
});

/* View a single user's information */
/* INCOMPLETE */
router.get('/', function (req, res) {
    res.send('Implement this as part of lab 19');
});


/* View all users in a <table> */
router.get('/dropdown', function (req, res) {
    db.GetAllView(function (err, result) {
            if (err) throw err;
            res.render('displayUserDropDown.ejs', {rs: result});
        }
    );
});

/* View all users in a <table> */
router.get('/posts', function (req, res) {
    db.GetAllView(function (err, result) {
            if (err) throw err;
            res.render('displayUserDropDown2.ejs', {rs: result});
        }
    );
});

// Save User to the Database
router.post('/view', function (req, res) {
    db.GetByID( req.body, function (err, result) {
            if (err) {
                throw err;
            }
            else if(typeof result[0].AccountID === 'undefined'){
                res.send('No user exists for that AccountID.');
            }
            else {
                var placeHolderValues = {
                    email: result[0].Email,
                    username: result[0].User_Name,
                    password: result[0].Password
                };
                res.render('displayUserInfo.ejs', placeHolderValues);
            }
        }
    );
});

router.post('/postview', function (req, res) {
    db.GetPostView( req.body, function (err, result) {
            if (err) {
                throw err;
            }
            else if(typeof result[0].User_Name === 'undefined'){
                res.send('No Posts Exist for that user.');
            }
            else {
                res.render('displayUserPosts.ejs', {rs: result});
            }
        }
    );
});

module.exports = router;

