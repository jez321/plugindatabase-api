const express = require('express');
const router = express.Router();
const dealController = require('../controllers/deals');
router.get('/', dealController.getDeals);
exports.router = router