'use strict'

var express = require('express');
const { model } = require('mongoose');

var TechnoController = require('../controller/techno');

var router = express.Router();

//RUTAS PARA PRODUCTOS
router.get('/technos', TechnoController.list);
router.get('/technos/:id', TechnoController.find);
router.post('/technos/save', TechnoController.save);

//FALTA GUARDAR

//EXPORTAR RUTA
module.exports = router;