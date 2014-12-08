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

router.get('/dropdown18', function (req, res) {
    db.GetAllView(function (err, result) {
            if (err) throw err;
            res.render('displayUserDropDown18.ejs', {rs: result});
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
                    email: req.body.email,
                    username: req.body.username,
                    password: result[0].password
                };
                res.render('displayUserInfo.ejs', req.query);
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

router.post('/poststats', function (req, res) {
    db.GetTwitterView( req.body, function (err, result) {
            if (err) {
                throw err;
            }
            else if(typeof result[0].User_Name === 'undefined'){
                res.send('No Posts Exist for that user.');
            }
            else {
                res.render('displayUserPostStats.ejs', {rs: result});
            }
        }
    );
});

router.post('/edit', function (req, res) {
    db.GetByID( req.body, function (err, result) {
            if (err) {
                throw err;
            }
            else if(typeof result[0].AccountID === 'undefined'){
                res.send('No user exists for that AccountID.');
            }
            else {
                var placeHolderValues = {
                    accountid: result[0].AccountID,
                    email: result[0].Email,
                    firstname: result[0].First_Name,
                    lastname: result[0].Last_Name,
                    username: result[0].User_Name,
                    password: result[0].Password,
                    bio: result[0].Bio
                };
                console.log(placeHolderValues);
                res.render('editUserInfo.ejs', placeHolderValues);
            }
        }
    );
});

// Save User to the Database


router.get('/save', function (req, res) {
    db.Update( req.query, function (err, result) {
            if (err) {
                throw err;
            }
            else {
                console.log(req);
                console.log(req.query);
                console.log(req.body);

                db.GetByID(req.query, function (err1, result1) {
                        if (err1) {
                            throw err1;
                        }
                        else if (typeof result1[0].AccountID === 'undefined') {
                            res.send('No user exists for that AccountID.');
                        }
                        else {

                            var placeHolderValues = {
                                accountid: result1[0].AccountID,
                                email: result1[0].Email,
                                firstname: result1[0].First_Name,
                                lastname: result1[0].Last_Name,
                                username: result1[0].User_Name,
                                password: result1[0].Password,
                                bio: result1[0].Bio
                            };
                            res.render('displayUserDetails.ejs', placeHolderValues)
                        }
                    }
                );
            }
        }
    );
});

module.exports = router;

