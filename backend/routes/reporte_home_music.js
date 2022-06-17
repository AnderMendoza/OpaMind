'use strict'

var express = require('express');
const { model } = require('mongoose');

var ReporteController = require('../controller/reporte_home_music');

var router = express.Router();

router.get('/reportes/HmusicReport', ReporteController.HmusicReport);



module.exports = router;