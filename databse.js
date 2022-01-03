var mysql = require('mysql2');

var connection = mysql.createConnection({
    host : '127.0.0.1',
    database : 'rentit',
    user : 'root',
    password : 'qwerty'
});

module.exports = connection;