'use strict'

var client = require("../database/db");
var db = client.db("pruebasbd");

var controller = {

    HmusicReport: function(req, res){
        console.log("______________");
        console.log("ENTRANDO A LA FUNCION REPORT");
        db.collection("hmusics").aggregate([
            {$group:{_id: "$singer", count:{$sum:1}}}
        ]).toArray(
            (error, dataHmusics) => {
                if(error || !dataHmusics){
                    return res.status(404).send({
                        message: "No se encontraron home musics"
                    });
                }else{
                    return res.status(200).send({
                        status:"success",
                        HmusicReport: dataHmusics
                    });
                }
            }
        );
    }

}


module.exports = controller;