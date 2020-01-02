const db = require('../db')
const sortableColumns = ['name', 'plugin.created', 'plugin.updated'];

const getPlugins = function (req, res) {
    const search = req.query.search;
    const searchField = search && search.length > 0 ? `WHERE LOWER(plugin.name) LIKE LOWER($1)` : '';
    const params = searchField === '' ? [] : ['%' + search + '%'];

    // sanitize sortby
    let sortby = req.query.sortby;
    if (!sortableColumns.includes(sortby)) {
        sortby = 'name'
    }

    // sanitize sortdir
    const sortdir = req.query.sortdir === 'desc' ? 'desc' : 'asc';

    db.pool.query(`SELECT plugin.id_plugin, plugin.name as name, category.name as category, plugin.created, plugin.updated, company.name as company
                    FROM plugin
                    JOIN company ON company.id_company = plugin.id_company
                    JOIN plugin_category on plugin_category.id_plugin = plugin.id_plugin
                    JOIN category on plugin_category.id_category = category.id_category
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