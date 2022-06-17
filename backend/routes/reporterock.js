'use strict'

var express = require('express');
const { model } = require('mongoose');

var ReporteController = require('../controller/reporterock');

var router = express.Router();

router.get('/reportes/RockReport', ReporteController.RockReport);



module.exports = router;