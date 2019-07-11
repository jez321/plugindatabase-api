const express = require('express');
const router = express.Router();
const companyController = require('../controllers/companies');
router.get('/', companyController.getCompanies);
exports.router = router