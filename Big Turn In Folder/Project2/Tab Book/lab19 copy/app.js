// import libraries
var express = require('express'),
    ejs     = require('ejs'),
    bodyParser = require('body-parser');

// import routes
var routes = require('./controller/index');
var tabbook  = require('./controller/tabbook');

// initialize express web application framework
// http://expressjs.com/
var app = express();

// these two lines replace bodyParser()
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

// configure static directory
app.use(express.static('public'));

//configure view rendering engine
app.set('view engine', 'ejs');
app.set('views', __dirname + '/views');

//configure routes
app.use('/', routes);
app.use('/tabbook', tabbook);

app.set('port', 8017);
app.listen(app.get('port'));
console.log("Express server listening on port", app.get('port'));