/**
 *
 * @param {string} scope
 * @param {string} company
 * @param {string} team
 * @param {string} userid
 */
function summaryScores(scope, company, team, userid) {
    switch (scope) {
        case 'company':
            return {
                company: 'unico',
                score: 1000,
            }
        case 'team':
            return {
                company: 'unico',
                team: 'high-fliers',
                score: 300,
            }
        case 'userid':
            return {
                company: 'unico',
                team: 'high-fliers',
                score: 42,
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
