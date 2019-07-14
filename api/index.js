const express = require('express');
const cors = require('cors');
const dealRouter = require('./routes/deals');
const companyRouter = require('./routes/companies');
const pluginRouter = require('./routes/plugins');

const app = express();
app.use(cors());
app.options('*', cors());

app.listen(3001, () => {
    console.log("Server running on port 3001");
});

app.use('/deals', dealRouter.router)
app.use('/companies', companyRouter.router)
app.use('/plugins', pluginRouter.router)