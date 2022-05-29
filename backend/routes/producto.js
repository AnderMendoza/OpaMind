'use strict'

var express = require('express');
const { model } = require('mongoose');

var ProductoController = require('../controller/producto');

var router = express.Router();

//RUTAS PARA PRODUCTOS
router.get('/productos', ProductoController.list);
router.get('/productos/:id', ProductoController.find);
router.post('/productos/save', ProductoController.save);

//FALTA GUARDAR

//EXPORTAR RUTA
module.exports = router;