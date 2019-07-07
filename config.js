const config = {
    development: {
        database: {
            user: 'postgres',
            host: '127.0.1.1',
            database: 'plugin_database',
            password: 'Pa$$w0rd',
            port: 5432
        },
    },
    production: {
        database: {
        },
    }
};
module.exports = config;