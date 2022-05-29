'use strict'

//requires
var mongoose = require('mongoose')
var app = require('./app')

//puerto servidor
var port = process.env.port || 3999;

//prueba de conexion a la bd
mongoose.Promise = global.Promise;
mongoose.connect('mongodb+srv://santiago:archipielagoM1@cluster0.ujtyy.mongodb.net/?retryWrites=true&w=majority'
                ,{ useNewUrlParser: true})
                .then(
                    ()=>{
                        console.log('La conexion a la bd es correcto VAMOS PERU RUMBO AL MUNDIAL');
                        //CREAR EL SERVIDOR
                        app.listen(port, ()=>{
                            console.log('El servidor http://localhost:3999 esta funcionando.');
                        })
                    }
                )
                .catch(error => console.log(error));
                