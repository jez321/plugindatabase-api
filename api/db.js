const config = require('../config')
const { Pool } = require('pg');
const pool = new Pool({
    user: config.development.database.user,
    host: config.development.database.host,
    database: config.development.database.database,
    password: config.development.database.password,
    port: config.development.database.port,
});
exports.pool = pool