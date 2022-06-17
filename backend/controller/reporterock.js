'use strict'

var client = require("../database/db");
var db = client.db("pruebasbd");

var controller = {

    RockReport: function(req, res){
        console.log("______________");
        console.log("ENTRANDO A LA FUNCION REPORT");
        db.collection("rocks").aggregate([
            {$group:{_id: "$banda", count:{$sum:1}}}
        ]).toArray(
            (error, dataRocks) => {
                if(error || !dataRocks){
                    return res.status(404).send({
                        message: "No se encontraron rocks"
                    });
                }else{
                    return res.status(200).send({
                        status:"success",
                        RockReport: dataRocks
                    });
                }
            }
        );
    }

}


module.exports = controller;