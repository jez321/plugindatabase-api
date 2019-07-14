const db = require('../db')
const sortableColumns = ['name', 'plugin.created', 'plugin.updated'];

const getPlugins = function (req, res) {
    const search = req.query.search;
    const searchField = search && search.length > 0 ? `WHERE LOWER(plugin.name) LIKE LOWER($1)` : '';
    const params = searchField === '' ? [] : ['%' + search + '%'];

    // sanitize sortby
    let sortby = req.query.sortby;
    if (!sortableColumns.includes(sortby)) {
        sortby = 'updated'
    }

    // sanitize sortdir
    const sortdir = req.query.sortdir === 'asc' ? 'asc' : 'desc';

    db.pool.query(`SELECT plugin.name as name, plugin.created, plugin.updated, company.name as company
                FROM plugin
                JOIN company ON company.id_company = plugin.id_company
                ${searchField}
                ORDER BY ${sortby} ${sortdir}
    ;`, params, (err, data) => {
            if (err) {
                console.log(err)
            }
            res.json(data.rows);
            // pool.end()
        })
}
exports.getPlugins = getPlugins