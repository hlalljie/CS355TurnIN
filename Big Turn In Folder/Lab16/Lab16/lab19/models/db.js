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
    var createTableQry = 'CREATE TABLE IF NOT EXISTS Account('
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
    connection.query('SELECT * FROM Account',
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

exports.GetOne = function(id, callback) {
    connection.query('SELECT * FROM Account WHERE AccountID = ' + id,
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

exports.Insert = function(userInfo, callback) {
    console.log(userInfo);
    var query = 'INSERT INTO Account (Email, User_Name, Password) VALUES (\'' + userInfo.email + '\', \'' +  userInfo.username + '\', \'' + userInfo.password + '\');';
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