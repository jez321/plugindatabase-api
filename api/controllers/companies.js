const db = require('../db')

const getCompanies = function (req, res) {
    const search = req.query.search;
    const searchField = search && search.length > 0 ? `WHERE LOWER(plugin.name) LIKE LOWER($1)` : '';
    const params = searchField === '' ? [] : ['%' + search + '%'];

    // sanitize sortdir
    const sortdir = req.query.sortdir === 'desc' ? 'desc' : 'asc';

    db.pool.query(`SELECT company.id_company, company.name, company.url
                FROM company
                ${searchField}
                ORDER BY name ${sortdir}
    ;`, params, (err, data) => {
            console.log(err)
            res.json(data.rows);
            // pool.end()
        })
}
exports.getCompanies = getCompanies