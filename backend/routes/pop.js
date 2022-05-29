'use strict'

var express = require('express');
const { model } = require('mongoose');

var PopController = require('../controller/pop');

var router = express.Router();

//RUTAS PARA PRODUCTOS
router.get('/pops', PopController.list);
router.get('/pops/:id', PopController.find);
router.post('/pops/save', PopController.save);

//FALTA GUARDAR

//EXPORTAR RUTA
module.exports = router;