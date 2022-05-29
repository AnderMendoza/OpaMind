'use strict'

var client = require("../database/db");
var db = client.db("pruebasbd");

var controller = {
    //LISTAR
    list: function(req, res){
        console.log("-----------------------");
        console.log("ENTREGANDO LA FUNCION LISTA");
        db.collection("pops").find().toArray(
            (error, dataPops) => {
                if (error || !dataPops){
                    return res.status(404).send({
                        message: "No se encontraron las canciones pop"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        pops: dataPops
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
        db.collection("pops").find({popId: parseInt(req.params.id)}).toArray(
            (error, dataPops) => {
                if(error || !dataPops){
                    return res.status(404).send({
                        message: "No se encontraron las canciones pop"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        pops: dataPops[0]
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
        if (req.body.popId == "0"){//Si ES NUEVO
            console.log("ENTRANDO A NUEVO");
            db.collection("pops").count().then(
                countPops => {
                    var pop = {}
                    pop.popId = countPops + 1;
                    pop.portada = req.body.portada;
                    pop.cancion = req.body.cancion;
                    pop.banda = req.body.banda;
                    db.collection('pops').insertOne(pop,
                        (error, result)=>{
                            if(error) {
                                return res.status(404).send({
                                    message: "No se pudo registrar las canciones pop"
                                });
                            }else{
                                return res.status(200).send({
                                    message: "success",
                                    pop: result
                                });
                            }
                        }
                    );
                }
            );
        } else {
            console.log("ENTRANDO A EDITAR");
            var pop = {}
            pop.popId= parseInt(req.body.popId);
            pop.portada = req.body.portada;
            pop.cancion = req.body.cancion;
            pop.banda = req.body.banda;
            console.log(pop);
            db.collection("pops").updateOne({popId: { $eq: parseInt(req.body.popId)}},
                                                {$set: pop},
                                                (error, result) => {
                                                    if(error) {
                                                        return res.status(404).send({
                                                            message: "No se pudo editar las canciones pop"
                                                        });
                                                    }else{
                                                        return res.status(200).send({
                                                            message: "success",
                                                            pop: result
                                                        });
                                                    }
                                                }
            )
        }
    }

}

// EXPORTAR MODULO
module.exports = controller;