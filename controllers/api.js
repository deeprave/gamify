const { summaryScores, updateScore } = require('../services/scoreKeeper');
const queryString = require('query-string');

exports.install = function () {
  CORS();

  ROUTE("GET /api/v1/scores", getScores);
  ROUTE("POST /api/v1/update/", setScore)
};

function getScores() {
  const self = this;
  const parsed = queryString.parse(queryString.extract(self.req.url));
  const { scope, challenge, company, team, userid } = parsed;

  try {
    summaryScores(self, scope, challenge, company, team, userid);
  } catch (err) {
    self.error(err.code, err.message);
  }
}

function setScore() {
  const self = this;
  const { challenge, company, team, userid, delta } = self.body;

  try {
    updateScore(self, challenge, company, team, userid, delta);
  } catch(err) {
    self.error(err.code, err.message);
  }
}
