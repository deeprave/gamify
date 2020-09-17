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
            return {
                company: 'unico',
                score: 1000,
                target: 1250,
            }
        case 'team':
            return {
                company: 'unico',
                team: 'high-fliers',
                score: 240,
                target: 250,
            }
        case 'userid':
            return {
                company: 'unico',
                team: 'high-fliers',
                score: 42,
                target: 60
            }
        default:
            const error = new Error("Invalid request, scope not valid");
            error.code = 400;
            throw error;
    }
}

module.exports = {
    summaryScores
}
