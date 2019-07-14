const express = require('express');
const router = express.Router();
const tagController = require('../controllers/tags');
router.get('/', tagController.getTags);
exports.router = router