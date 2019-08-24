const db = require('../db')
const sortableColumns = ['name', 'company', 'category', 'price', 'description', 'start_date', 'end_date', 'created', 'updated'];

const getDeals = async function (req, res) {
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

    const data = await db.pool.query(`SELECT d.id_deal, d.id_plugin, plugin.name as name, company.name as company, category.name as category, d.price, d.description, d.start_date, d.end_date, d.created as added, json_build_object('title', link.title, 'url', link.url) AS link, t.tags, d.created, d.updated
                FROM deal d
                JOIN plugin ON d.id_plugin = plugin.id_plugin
                JOIN company ON company.id_company = plugin.id_company
                JOIN link ON d.id_link = link.id_link
                LEFT JOIN  (
                    SELECT deal_tag.id_deal, array_agg(tag.name) AS tags
                    FROM   deal_tag
                    JOIN   tag ON tag.id_tag = deal_tag.id_tag
                    GROUP  BY deal_tag.id_deal) t ON t.id_deal = d.id_deal
                JOIN plugin_category on plugin_category.id_plugin = plugin.id_plugin
                JOIN category on plugin_category.id_category = category.id_category
                ${searchField}
                ORDER BY ${sortby} ${sortdir}
    ;`)
    const lowestPrices = await db.pool.query(`SELECT * FROM lowest_prices;`)
    data.rows.forEach(r => {
        r.lowestPrice = lowestPrices.rows.find(lp => {
            return lp.id_plugin === r.id_plugin
        }).price
    })
    res.json(data.rows);
    // pool.end()
}

exports.getDeals = getDeals