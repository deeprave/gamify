exports.install = function () {
  CORS();

  ROUTE("/", view_index);
};

function view_index() {
  let self = this;
  self.view("index");
}
