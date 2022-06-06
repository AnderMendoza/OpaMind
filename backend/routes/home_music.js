'use strict'

var express = require('express');
const { model } = require('mongoose');

var HmusicController = require('../controller/home_music');

var router = express.Router();

//RUTAS PARA PRODUCTOS
router.get('/hmusics', HmusicController.list);
router.get('/hmusics/:id', HmusicController.find);
router.post('/hmusics/save', HmusicController.save);

//FALTA GUARDAR

//EXPORTAR RUTA
module.exports = router;