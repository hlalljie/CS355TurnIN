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
    /*
     var createTableQry = 'CREATE TABLE IF NOT EXISTS User('
     + 'UserID INT AUTO_INCREMENT PRIMARY KEY'
     + ',Email VARCHAR(256)'
     + ',Password VARCHAR(50)'
     + ')';*/
    var createTableQry = 'CREATE TABLE IF NOT EXISTS Account14('
        + 'AccountID INT AUTO_INCREMENT PRIMARY KEY'
        + ',User_Name VARCHAR(50) UNIQUE'
        + ',Email VARCHAR(255)'
        + ',Password VARCHAR(50)'
        + ')';
    connection.query(createTableQry, function (err) {
        if (err) throw err;
    });
});

exports.GetAll = function(callback) {
    connection.query('SELECT * FROM Account14',
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

exports.GetAllView = function(callback) {
    connection.query('select * from Account14',
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

exports.GetPostView = function(userInfo, callback) {
    var query = 'select Account14.User_Name, Tweet14.Post FROM Account14 JOIN Tweet14 ON Tweet14.AccountID = Account14.AccountID WHERE Account14.AccountID=' + userInfo.accountid + ';';
        console.log(query);
        connection.query(query,
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


exports.GetByID = function(userInfo, callback) {
    var query = 'select * from Account14 WHERE AccountID=' + userInfo.accountid + ';';
    console.log(query);

    connection.query(query,
        function (err, result) {
            if(err) {
                console.log(err);
                callback(true);
                return;
            }
            console.log(result);
            callback(false, result);
        }
    );
}

exports.GetPosts = function(userInfo, callback) {
    connection.query('select * from Tweet14 WHERE AcccountID=' + userInfo.accountid + ';',
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

exports.Update = function(userInfo, callback) {
    var query = 'UPDATE Account14 SET User_Name = \''  + userInfo.username + '\', Password = \'' + userInfo.password + '\', Email = \'' + userInfo.email + '\', First_Name = \'' + userInfo.firstname
        + '\', Last_Name = \'' + userInfo.lastname + '\', Bio = \'' + userInfo.bio
        + '\' WHERE AccountID = ' + userInfo.accountid + ';';
    console.log(query);
    connection.query(query,
        function (err, result) {
            if(err) {
                console.log(err);
                callback(true);
                return
            }
            callback(false, result);
        }
    );
}

exports.Insert = function(userInfo, callback) {
    console.log(userInfo);
    var query = 'INSERT INTO Account14 (Email, User_Name, Password) VALUES (\'' + userInfo.email + '\', \'' +  userInfo.username + '\', \'' + userInfo.password + '\');';
    console.log(query);
    connection.query(query,
        function (err, result) {
            if(err) {
                console.log(err);
                callback(true);
                return
            }
            callback(false, result);
        }
    );
}

exports.GetTwitterView = function(userInfo, callback) {
    connection.query( 'SELECT Account14.First_Name, Account14.Last_Name, Account14.User_Name, ' +
    'COUNT(Tweet14.TweetID) AS Tweets, ' +
    'COUNT(Followers14.FollowerID) AS Followers, ' +
    'AVG(Tweet14.ReTweetCount) AS Average_ReTweets, ' +
    'SUM(Tweet14.ReTweetCount) AS Total_ReTweets ' +
    'FROM Account14 JOIN ' +
    'Tweet14 ON Account14.AccountID = Tweet14.AccountID JOIN ' +
    'Followers14 ON Account14.AccountID = Followers14.AccountID ' +
    'WHERE Account14.AccountID = ' + userInfo.accountid +
    ' GROUP BY Account14.AccountID;',
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