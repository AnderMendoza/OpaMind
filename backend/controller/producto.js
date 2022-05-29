'use strict'

var client = require("../database/db");
var db = client.db("pruebasbd");

var controller = {
    //LISTAR
    list: function(req, res){
        console.log("-----------------------");
        console.log("ENTREGANDO LA FUNCION LISTA");
        db.collection("productos").find().toArray(
            (error, dataProductos) => {
                if (error || !dataProductos){
                    return res.status(404).send({
                        message: "No se encontraron los productos"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        productos: dataProductos
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
        db.collection("productos").find({productoId: parseInt(req.params.id)}).toArray(
            (error, dataProductos) => {
                if(error || !dataProductos){
                    return res.status(404).send({
                        message: "No se encontro el producto"
                    });
                }else{
                    return res.status(200).send({
                        status: "success",
                        productos: dataProductos[0]
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
        if (req.body.productoId == "0"){//Si ES NUEVO
            console.log("ENTRANDO A NUEVO");
            db.collection("productos").count().then(
                countProductos => {
                    var producto = {}
                    producto.productoId = countProductos + 1;
                    producto.descripcion = req.body.descripcion;
                    producto.precio = req.body.precio;
                    db.collection('productos').insertOne(producto,
                        (error, result)=>{
                            if(error) {
                                return res.status(404).send({
                                    message: "No se pudo registrar el producto"
                                });
                            }else{
                                return res.status(200).send({
                                    message: "success",
                                    producto: result
                                });
                            }
                        }
                    );
                }
            );
        } else {
            console.log("ENTRANDO A EDITAR");
            var producto = {}
            producto.productoId= parseInt(req.body.productoId);
            producto.descripcion = req.body.descripcion;
            producto.precio = req.body.precio;
            console.log(producto);
            db.collection("productos").updateOne({productoId: { $eq: parseInt(req.body.productoId)}},
                                                {$set: producto},
                                                (error, result) => {
                                                    if(error) {
                                                        return res.status(404).send({
                                                            message: "No se pudo editar el producto"
                                                        });
                                                    }else{
                                                        return res.status(200).send({
                                                            message: "success",
                                                            producto: result
                                                        });
                                                    }
                                                }
            )
        }
    }

}

// EXPORTAR MODULO
module.exports = controller;