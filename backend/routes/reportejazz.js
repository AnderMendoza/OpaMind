'use strict'

var express = require('express');
const { model } = require('mongoose');

var ReporteController = require('../controller/reporteJazz');

var router = express.Router();

router.get('/reportes/JazzReport', ReporteController.JazzReport);



module.exports = router;