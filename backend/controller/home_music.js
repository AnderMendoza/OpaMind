'use strict'

var client = require("../database/db");
var db = client.db("pruebasbd");

var controller = {
    //LISTAR
    list: function(req, res){
        console.log("-----------------------");
        console.log("ENTREGANDO LA FUNCION LISTA");
        db.collection("hmusics").find().toArray(
            (error, dataHmusics) => {
                if (error || !dataHmusics){
                    return res.status(404).send({
                        message: "No se encontraron las canciones hmusic"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        hmusics: dataHmusics
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
        db.collection("hmusics").find({hmusicId: parseInt(req.params.id)}).toArray(
            (error, dataHmusics) => {
                if(error || !dataHmusics){
                    return res.status(404).send({
                        message: "No se encontraron las canciones hmusic"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        hmusics: dataHmusics[0]
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
        if (req.body.hmusicId == "0"){//Si ES NUEVO
            console.log("ENTRANDO A NUEVO");
            db.collection("hmusics").count().then(
                countHmusics => {
                    var hmusic = {}
                    hmusic.hmusicId = countHmusics + 1;
                    hmusic.title = req.body.title;
                    hmusic.singer = req.body.singer;
                    hmusic.url = req.body.url;
                    hmusic.coverUrl = req.body.coverUrl;
                    db.collection('hmusics').insertOne(hmusic,
                        (error, result)=>{
                            if(error) {
                                return res.status(404).send({
                                    message: "No se pudo registrar las canciones hmusic"
                                });
                            }else{
                                return res.status(200).send({
                                    message: "success",
                                    hmusic: result
                                });
                            }
                        }
                    );
                }
            );
        } else {
            console.log("ENTRANDO A EDITAR");
            var hmusic = {}
            hmusic.hmusicId= parseInt(req.body.hmusicId);
            hmusic.title = req.body.title;
            hmusic.singer = req.body.singer;
            hmusic.url = req.body.url;
            hmusic.coverUrl = req.body.coverUrl;
            console.log(hmusic);
            db.collection("hmusics").updateOne({hmusicId: { $eq: parseInt(req.body.hmusicId)}},
                                                {$set: hmusic},
                                                (error, result) => {
                                                    if(error) {
                                                        return res.status(404).send({
                                                            message: "No se pudo editar las canciones hmusic"
                                                        });
                                                    }else{
                                                        return res.status(200).send({
                                                            message: "success",
                                                            hmusic: result
                                                        });
                                                    }
                                                }
            )
        }
    }

}

// EXPORTAR MODULO
module.exports = controller;