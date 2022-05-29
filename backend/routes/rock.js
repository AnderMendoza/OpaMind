'use strict'

var express = require('express');
const { model } = require('mongoose');

var RockController = require('../controller/rock');

var router = express.Router();

//RUTAS PARA ROCKS
router.get('/rocks', RockController.list);
router.get('/rocks/:id', RockController.find);
router.post('/rocks/save', RockController.save);

//FALTA GUARDAR

//EXPORTAR RUTA
module.exports = router;