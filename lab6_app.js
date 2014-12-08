// Module dependencies

var express    = require('express'),
    mysql      = require('mysql'),
    path       = require('path');

// Application initialization

var connection = mysql.createConnection({
        host     : 'cwolf.cs.sonoma.edu',
        user     : 'mhaderman',
        password : 'password'
    });
    
var app = module.exports = express.createServer();

// Database setup
/*  //Commented out since we do not need to create a table each time.
connection.query('CREATE DATABASE IF NOT EXISTS test', function (err) {
    if (err) throw err;
    connection.query('USE test', function (err) {
        if (err) throw err;
        connection.query('CREATE TABLE IF NOT EXISTS users('
            + 'id INT NOT NULL AUTO_INCREMENT,'
            + 'PRIMARY KEY(id),'
            + 'name VARCHAR(30)'
            +  ')', function (err) {
                if (err) throw err;
            });
    });
});
*/

// Establish Database Connection
connection.query('USE mhaderman', function(err) {
  if (err) throw err;
});

// Configuration

app.use(express.bodyParser());

// Main route sends our HTML file

app.get('/', function(req, res) {
    res.send('Hello, World!');
});

// Retrieve a record from the Student table
app.get('/student', function(req, res) {
  //console.log(req.query.Student_number);
  connection.query('SELECT Name, Major FROM Student WHERE Student_number = ' + req.query.Student_number,
    function (err, result) {
     if (err) throw err;
     if(result.length == 1) {
        res.send('<ul><li>Student Name: ' + result[0].Name + '</li>' +
                 '<li>Major: ' + result[0].Major + '</li></ul>'); 
      }
      else {
        res.send('No student found for that Student Number.');
      }      
    });
});

// Insert a into the Student Name and retrieve their Name and Major
app.get('/student/insert', function(req, res) {
  console.log(req.query.Student_number);
  var query = 'INSERT INTO Student (Name, Student_number, Class, Major) VALUES (\'' 
            + req.query.Name + '\',' 
            + req.query.Student_number + ',\'' 
            + req.query.Class + '\',\'' 
            + req.query.Major + '\')';
  console.log(query);
  connection.query(query,
    function (err, result) {
      if (err) throw err;
      connection.query('SELECT Name, Major FROM Student WHERE Student_number = ' + req.query.Student_number,
        function (err, result) {
          if (err) throw err;
          if(result.length == 1) {
            res.send('<ul><li>Student Name: ' + result[0].Name + '</li>'
                     +   '<li>Major: ' + result[0].Major + '</li></ul>'); 
          }
          else {
            res.send('No student found for that Student Number.');
          }   
        });      
    });
});

// Update a record from the Student table
app.get('/student/update', function(req, res) {
  /* TODO */
  res.send('Not yet implemented.');
});

// Delete a record from the Student table
app.get('/student/delete', function(req, res) {
  /* TODO */
  res.send('Not yet implemented.');
});


// Begin istening

app.listen(8037);
console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
