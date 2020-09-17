const { summaryScores, updateScore } = require('../services/scoreKeeper');
const queryString = require('query-string');

exports.install = function () {
  CORS();

  ROUTE("GET /api/scores", getScores);
  ROUTE("POST /api/update/", setScore)
};

function getScores() {
  const self = this;
  const parsed = queryString.parse(queryString.extract(self.req.url));
  const { scope, category, company, team, userid } = parsed;

  try {
    self.json(summaryScores(scope, category, company, team, userid));
  } catch (err) {
    self.error(err.code, err.message);
  }
}

function setScore() {
  const self = this;
  const { category, company, team, userid, delta } = self.body;

  try {
    self.json(updateScore(category, company, team, userid, delta));
  } catch(err) {
    self.error(err.code, err.message);
  }
}
