'use strict'

var express = require('express');
const { model } = require('mongoose');

var JazzController = require('../controller/jazz');

var router = express.Router();

//RUTAS PARA PRODUCTOS
router.get('/jazzs', JazzController.list);
router.get('/jazzs/:id', JazzController.find);
router.post('/jazzs/save', JazzController.save);

//FALTA GUARDAR

//EXPORTAR RUTA
module.exports = router;