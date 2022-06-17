'use strict'

var client = require("../database/db");
var db = client.db("pruebasbd");

var controller = {

    JazzReport: function(req, res){
        console.log("______________");
        console.log("ENTRANDO A LA FUNCION REPORT");
        db.collection("jazzs").aggregate([
            {$group:{_id: "$banda", count:{$sum:1}}}
        ]).toArray(
            (error, dataJazz) => {
                if(error || !dataJazz){
                    return res.status(404).send({
                        message: "No se encontraron Jazz"
                    });
                }else{
                    return res.status(200).send({
                        status:"success",
                        JazzReport: dataJazz
                    });
                }
            }
        );
    }

}


module.exports = controller;