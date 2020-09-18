/**
 * @param {*} request
 * @param {string|null} challenge
 * @param {string|null} company
 * @param {string|null} team
 * @param {string|null} userid
 */
async function getScore(request, challenge=null, company=null, team=null, userid=null) {
    const filters = [];
    const fields = {}
    if (challenge) {
        filters.push(`challenge='${challenge}'`);
        fields.challenge = challenge;
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
    DBMS().sum("statistics", "delta").where(where).promise().then(function(delta) {
        DBMS().sum("targets", "target").where(where).promise().then(function(target) {
            const result = {
                ...fields,
                score: delta,
                target: target,
            };
            request.json(result);
            console.log(result);
        }, function(err) {
            request.error500(err.message)
        });
    }, function(err) {
        request.error500(err.message)
    });
}

/**
 * return scores
 * @param {*} request
 * @param {string} scope
 * @param {string} challenge
 * @param {string} company
 * @param {string} team
 * @param {string} userid
 */
function summaryScores(request, scope, challenge, company, team, userid) {
    if (!challenge) {
        request.error400("Invalid request, challenge missing or is not valid");
    } else {
        switch (scope) {
            case 'company':
                getScore(request, challenge, company);
                break;
            case 'team':
                getScore(request, challenge, company, team);
                break;
            case 'userid':
                getScore(request, challenge, company, team, userid);
                break;
            default:
                request.error400("Invalid request, scope not valid");
                break;
        }
    }
}

/**
 * update scores
 * @param {string} challenge
 * @param {string} company
 * @param {string} team
 * @param {string} userid
 */
function updateScore(challenge, company, team, userid) {
    DBMS().insert("statistics", {challenge, company, team, userid});
}

module.exports = {
    summaryScores,
    updateScore
}
