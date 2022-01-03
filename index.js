var mysql = require('mysql2');
var express = require('express');
const connection = require('./databse'); 
var app = express();
app.get('/',function(req,res){
    let sql = 'Select * from Product;';
    connection.query(sql, function(err, results){
        if(err) throw err;
        res.send(results);
    });
    
});
app.listen(3000, function(){
    console.log("Listening to 3000");
    connection.connect(function(err){   // whats connect?
        if(err) throw err;
        console.log('Connected');
    })
});