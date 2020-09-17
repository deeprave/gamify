const { summaryScores, updateScore } = require('../services/scoreKeeper');

exports.install = function () {
  CORS();

  ROUTE("POST /api/scores", getScores);
  ROUTE("POST /api/update", setScore)
};

function getScores() {
  const self = this;
  const { scope, category, company, team, userid } = self.body;

  try {
    self.json(summaryScores(scope, category, company, team, userid));
  } catch(err) {
    self.error(err.code, err.message);
  }
}

function setScore() {
  const self = this;
  const { category, company, team, userid, delta } = self.body;

  try {
    self.json(updateScore(category, company, team, userid));
  } catch(err) {
    self.error(err.code, err.message);
  }
}
