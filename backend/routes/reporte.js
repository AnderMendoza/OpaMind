'use strict'

var express = require('express');
const { model } = require('mongoose');

var ReporteController = require('../controller/reporte');

var router = express.Router();

router.get('/reportes/PopReport', ReporteController.PopReport);



module.exports = router;