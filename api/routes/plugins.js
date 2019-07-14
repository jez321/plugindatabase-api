const express = require('express');
const router = express.Router();
const pluginController = require('../controllers/plugins');
router.get('/', pluginController.getPlugins);
exports.router = router