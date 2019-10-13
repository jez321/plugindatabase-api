const express = require('express');
const cors = require('cors');
const dealRouter = require('./routes/deals');
const companyRouter = require('./routes/companies');
const pluginRouter = require('./routes/plugins');
const tagRouter = require('./routes/tags');
const fs = require('fs');
//const https = require('https');

const app = express();
const router = express.Router();
router.use(cors());
router.options('*', cors());

app.listen(3001, () => {
	console.log("Server running on port 3001");
});
/*
https.createServer({
  key: fs.readFileSync('/etc/letsencrypt/live/plugindatabase.net/privkey.pem'),
  cert: fs.readFileSync('/etc/letsencrypt/live/plugindatabase.net/cert.pem'),
  ca: fs.readFileSync('/etc/letsencrypt/live/plugindatabase.net/chain.pem')
}, router).listen(3001, () => {
  console.log('Listening');
});
*/
router.use('/deals', dealRouter.router)
router.use('/companies', companyRouter.router)
router.use('/plugins', pluginRouter.router)
router.use('/tags', tagRouter.router)
app.use('/api', router)
