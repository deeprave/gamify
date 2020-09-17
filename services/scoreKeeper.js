/**
 *
 * @param {string|null} category
 * @param {string|null} company
 * @param {string|null} team
 * @param {string|null} userid
 * @returns {{score: (*|number), target: (*|number)}}
 */
function getScore(category=null, company=null, team=null, userid=null) {
    const filters = [];
    const fields = {}
    if (category) {
        filters.push(`category='${category}'`);
        fields.category = category;
    }
    if (company) {
        filters.push(`company='${company}'`);
        fields.company = company;
    }
    if (team) {
        filters.push(`team='${team}'`);
        fields.team = team;
    }
    if (userid) {
        filters.push(`userid='${userid}'`);
        fields.userid = userid;
    }
    const where = filters.join(' AND ');

    const db = DBMS();
    const total = db.select("SELECT sum(delta) FROM statistics")
        .where(where);
    const target = db.select("SELECT sum(target) FROM targets")
        .where(where);
    return {
        ...fields,
        score: total.length > 0 ? total[0] : 0,
        target: target.length > 0 ? target[0] : 0,
    }
}

/**
 * return scores
 * @param {string} scope
 * @param {string} category
 * @param {string} company
 * @param {string} team
 * @param {string} userid
 */
function summaryScores(scope, category, company, team, userid) {
    // @todo hard code for now and ignore category
    switch (scope) {
        case 'company':
            return getScore(category, company);
        case 'team':
            return getScore(category, company, team);
        case 'userid':
            return getScore(category, company, team, userid);
        default:
            const error = new Error("Invalid request, scope not valid");
            error.code = 400;
            throw error;
    }
}

module.exports = {
    summaryScores,
    updateScore
}
