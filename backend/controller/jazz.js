'use strict'

var client = require("../database/db");
var db = client.db("pruebasbd");

var controller = {
    //LISTAR
    list: function(req, res){
        console.log("-----------------------");
        console.log("ENTREGANDO LA FUNCION LISTA");
        db.collection("jazzs").find().toArray(
            (error, dataJazzs) => {
                if (error || !dataJazzs){
                    return res.status(404).send({
                        message: "No se encontraron las canciones jazz"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        Jazzs: dataJazzs
                    })
                }
            }
        );
    },
    // BUSCAR
    find: function(req, res){
        console.log("-------------------------");
        console.log("ENTRANDO A LA FUNCION FIND");
        console.log("id:"+ req.params.id);
        db.collection("jazzs").find({jazzId: parseInt(req.params.id)}).toArray(
            (error, dataJazzs) => {
                if(error || !dataJazzs){
                    return res.status(404).send({
                        message: "No se encontraron las canciones jazz"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        jazzs: dataJazzs[0]
                    });
                }
            }

        );
    },
    // GUARDAR
    save: function(req, res){
        console.log("-------------------------");
        console.log("ENTRANDO A LA FUNCION SAVE");
        console.log(req.body);
        if (req.body.jazzId == "0"){//Si ES NUEVO
            console.log("ENTRANDO A NUEVO");
            db.collection("jazzs").count().then(
                countJazzs => {
                    var jazz = {}
                    jazz.jazzId = countJazzs + 1;
                    jazz.portada = req.body.portada;
                    jazz.cancion = req.body.cancion;
                    jazz.banda = req.body.banda;
                    db.collection('jazzs').insertOne(jazz,
                        (error, result)=>{
                            if(error) {
                                return res.status(404).send({
                                    message: "No se pudo registrar las canciones jazz"
                                });
                            }else{
                                return res.status(200).send({
                                    message: "success",
                                    jazz: result
                                });
                            }
                        }
                    );
                }
            );
        } else {
            console.log("ENTRANDO A EDITAR");
            var jazz = {}
            jazz.jazzId= parseInt(req.body.jazzId);
            jazz.portada = req.body.portada;
            jazz.cancion = req.body.cancion;
            jazz.banda = req.body.banda;
            console.log(jazz);
            db.collection("jazzs").updateOne({jazzId: { $eq: parseInt(req.body.jazzId)}},
                                                {$set: jazz},
                                                (error, result) => {
                                                    if(error) {
                                                        return res.status(404).send({
                                                            message: "No se pudo editar las canciones jazz"
                                                        });
                                                    }else{
                                                        return res.status(200).send({
                                                            message: "success",
                                                            jazz: result
                                                        });
                                                    }
                                                }
            )
        }
    }

}

// EXPORTAR MODULO
module.exports = controller;