'use strict'

var client = require("../database/db");
var db = client.db("pruebasbd");

var controller = {

    PopReport: function(req, res){
        console.log("______________");
        console.log("ENTRANDO A LA FUNCION REPORT");
        db.collection("pops").aggregate([
            {$group:{_id: "$banda", count:{$sum:1}}}
        ]).toArray(
            (error, dataPops) => {
                if(error || !dataPops){
                    return res.status(404).send({
                        message: "No se encontraron pops"
                    });
                }else{
                    return res.status(200).send({
                        status:"success",
                        PopReport: dataPops
                    });
                }
            }
        );
    }

}


module.exports = controller;