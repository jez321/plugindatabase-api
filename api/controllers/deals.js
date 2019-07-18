const db = require('../db')
const sortableColumns = ['name', 'start_date', 'end_date', 'added'];

const getDeals = function (req, res) {
    const search = req.query.search;
    const searchField = search && search.length > 0 ? `WHERE LOWER(plugin.name) LIKE LOWER($1)` : '';
    const params = searchField === '' ? [] : ['%' + search + '%'];

    // sanitize sortby
    let sortby = req.query.sortby;
    if (!sortableColumns.includes(sortby)) {
        sortby = 'added'
    }

    // sanitize sortdir
    const sortdir = req.query.sortdir === 'desc' ? 'desc' : 'asc';

    db.pool.query(`SELECT deal.id_deal, plugin.name as name, company.name as company, category.name as category, deal.price, deal.description, deal.start_date, deal.end_date, deal.created as added, json_build_object('title', link.title, 'url', link.url) AS link, t.tags, deal.created, deal.updated
                FROM deal
                JOIN plugin ON deal.id_plugin = plugin.id_plugin
                JOIN company ON company.id_company = plugin.id_company
                JOIN link ON deal.id_link = link.id_link
                LEFT JOIN  (
                    SELECT deal_tag.id_deal, array_agg(tag.name) AS tags
                    FROM   deal_tag
                    JOIN   tag ON tag.id_tag = deal_tag.id_tag
                    GROUP  BY deal_tag.id_deal) t ON t.id_deal = deal.id_deal
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
exports.getDeals = getDeals