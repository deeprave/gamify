/**
 * @param {*} self
 * @param {string|null} challenge
 * @param {string|null} company
 * @param {string|null} team
 * @param {string|null} userid
 */
async function getScore(self, challenge=null, company=null, team=null, userid=null) {
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
    await db.sum("statistics", "delta").where(where).promise().then(async function(delta) {
        await db.sum("targets", "target").where(where).promise().then(function(target) {
            const result = {
                ...fields,
                score: delta,
                target: target,
            };
            //request.json(result);
            console.log('returning:', result);
            self.json(result);
        }, function(err) {
            self.error500(err.message)
        });
    }, function(err) {
        self.error500(err.message)
    });
}

/**
 * return scores
 * @param {*} self
 * @param {string} scope
 * @param {string} challenge
 * @param {string} company
 * @param {string} team
 * @param {string} userid
 */
async function summaryScores(self, scope, challenge, company, team, userid) {
    if (!challenge) {
        self.error400("Invalid request, challenge missing or is not valid");
    } else {
        switch (scope) {
            case 'company':
                getScore(self, challenge, company);
                break;
            case 'team':
                getScore(self, challenge, company, team);
                break;
            case 'userid':
                getScore(self, challenge, company, team, userid);
                break;
            default:
                self.error400("Invalid request, scope not valid");
                break;
        }
    }
}

/**
 * update scores
 * @param {*} self
 * @param {string} challenge
 * @param {string} company
 * @param {string} team
 * @param {string} userid
 * @param {string} delta
 */
async function updateScore(self, challenge, company, team, userid, delta=1) {
    const db = DBMS();
    await db.insert("statistics", {challenge, company, team, userid, delta})
        .primarykey("id")
        .promise().then (function () {
            const result = {success: true };
            console.log('returning:', result);
            self.json(result);
    }, function(err) {
        console.log(err);
    });
}

module.exports = {
    summaryScores,
    updateScore
}
