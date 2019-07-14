const config = {
    development: {
        database: {
            user: 'postgres',
            host: 'localhost',
            database: 'plugin_database_test',
            password: '4v5&PCSn',
            port: 5432
        },
    },
    production: {
        database: {
        },
    }
};
module.exports = config;