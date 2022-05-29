'use strict'

var client = require("../database/db");
var db = client.db("pruebasbd");

var controller = {
    //LISTAR
    list: function(req, res){
        console.log("-----------------------");
        console.log("ENTREGANDO LA FUNCION LISTA");
        db.collection("rocks").find().toArray(
            (error, dataRocks) => {
                if (error || !dataRocks) {
                    return res.status(404).send({
                        message: "No se encontraron las canciones de rock"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        rocks: dataRocks
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
        db.collection("rocks").find({rocksId: parseInt(req.params.id)}).toArray(
            (error, dataRocks) => {
                if(error || !dataRocks){
                    return res.status(404).send({
                        message: "No se encontraron las canciones de rock"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        rocks: dataRocks[0]
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
        if (req.body.rockId == "0"){//Si ES NUEVO
            console.log("ENTRANDO A NUEVO");
            db.collection("rocks").count().then(
                countRocks => {
                    var rock = {}
                    rock.rockId = countRocks + 1;
                    rock.portada = req.body.portada;
                    rock.cancion = req.body.cancion;
                    rock.banda = req.body.banda;
                    db.collection('rocks').insertOne(rock,
                        (error, result)=>{
                            if(error) {
                                return res.status(404).send({
                                    message: "No se pudo registrar las canciones de rock"
                                });
                            }else{
                                return res.status(200).send({
                                    message: "success",
                                    rock: result
                                });
                            }
                        }
                    );
                }
            );
        } else {
            console.log("ENTRANDO A EDITAR");
            var rock = {}
            rock.rockId= parseInt(req.body.rockId);
            rock.portada = req.body.portada;
            rock.cancion = req.body.cancion;
            rock.banda = req.body.banda;
            console.log(rock);
            db.collection("rocks").updateOne({rockId: { $eq: parseInt(req.body.rockId)}},
                                                {$set: rock},
                                                (error, result) => {
                                                    if(error) {
                                                        return res.status(404).send({
                                                            message: "No se pudo editar la cancion"
                                                        });
                                                    }else{
                                                        return res.status(200).send({
                                                            message: "success",
                                                            rock: result
                                                        });
                                                    }
                                                }
            )
        }
    }

}

// EXPORTAR MODULO
module.exports = controller;