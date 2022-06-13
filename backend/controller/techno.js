'use strict'

var client = require("../database/db");
var db = client.db("pruebasbd");

var controller = {
    //LISTAR
    list: function(req, res){
        console.log("-----------------------");
        console.log("ENTREGANDO LA FUNCION LISTA");
        db.collection("technos").find().toArray(
            (error, dataTechnos) => {
                if (error || !dataTechnos){
                    return res.status(404).send({
                        message: "No se encontraron las canciones technos"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        Technos: dataTechnos
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
        db.collection("technos").find({technosId: parseInt(req.params.id)}).toArray(
            (error, dataTechnos) => {
                if(error || !dataTechnos){
                    return res.status(404).send({
                        message: "No se encontraron las canciones technos"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        technos: dataTechnos[0]
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
        if (req.body.technosId == "0"){//Si ES NUEVO
            console.log("ENTRANDO A NUEVO");
            db.collection("technos").count().then(
                countTechnos => {
                    var techno = {}
                    techno.technoId = countTechnos + 1;
                    techno.portada = req.body.portada;
                    techno.cancion = req.body.cancion;
                    techno.banda = req.body.banda;
                    db.collection('technos').insertOne(techno,
                        (error, result)=>{
                            if(error) {
                                return res.status(404).send({
                                    message: "No se pudo registrar las canciones techno"
                                });
                            }else{
                                return res.status(200).send({
                                    message: "success",
                                    techno: result
                                });
                            }
                        }
                    );
                }
            );
        } else {
            console.log("ENTRANDO A EDITAR");
            var techno = {}
            techno.technoId= parseInt(req.body.technoId);
            techno.portada = req.body.portada;
            techno.cancion = req.body.cancion;
            techno.banda = req.body.banda;
            console.log(techno);
            db.collection("technos").updateOne({technoId: { $eq: parseInt(req.body.technoId)}},
                                                {$set: techno},
                                                (error, result) => {
                                                    if(error) {
                                                        return res.status(404).send({
                                                            message: "No se pudo editar las canciones techno"
                                                        });
                                                    }else{
                                                        return res.status(200).send({
                                                            message: "success",
                                                            techno: result
                                                        });
                                                    }
                                                }
            )
        }
    }

}

// EXPORTAR MODULO
module.exports = controller;