exports.install = function () {
  CORS();

  ROUTE("/", view_index);
};

function view_index() {
  var self = this;
  self.view("index");
}
