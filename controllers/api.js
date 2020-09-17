const { summaryScores } = require('../services/scoreKeeper');

exports.install = function () {
  CORS();

  ROUTE("POST /api/scores", getScores);
};

function getScores() {
  const self = this;
  const { scope, company, team, userid } = self.body;

  try {
    self.json(summaryScores(scope, company, team, userid));
  } catch(err) {
    self.responseCode = err.code;
    self.responseText = err.message;
  }
}
