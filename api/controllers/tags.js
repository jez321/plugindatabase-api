const db = require('../db')

const getTags = function (req, res) {
    const search = req.query.search;
    const searchField = search && search.length > 0 ? `WHERE LOWER(tag.name) LIKE LOWER($1)` : '';
    const params = searchField === '' ? [] : ['%' + search + '%'];

    // sanitize sortdir
    const sortdir = req.query.sortdir === 'desc' ? 'desc' : 'asc';

    db.pool.query(`SELECT tag.id_tag, tag.name
                FROM tag
                ${searchField}
                ORDER BY name ${sortdir}
    ;`, params, (err, data) => {
            if (err) {
                console.log(err)
            }
            res.json(data.rows);
            // pool.end()
        })
}
exports.getTags = getTags