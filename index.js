var mysql = require('mysql2');
const path = require('path');
var express = require('express');
const connection = require('./databse'); 
var app = express();

app.use(express.static('./Website'));

app.get('/products',function(req,res){
    let sql = 'Select * from Product;';
    connection.query(sql, function(err, results){
        if(err) throw err;
        res.json(results);

    });
    
});
app.listen(3000, function(){
    console.log("Listening to 3000");
    connection.connect(function(err){   
        if(err) throw err;
        console.log('Connected');
    })
});