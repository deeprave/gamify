const { summaryScores } = require('../services/scoreKeeper');

exports.install = function () {
  CORS();

  ROUTE("POST /api/scores", getScores);
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
