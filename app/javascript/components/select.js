import "select2";
import "select2/src/scss/core.scss";

// document.querySelectorAll(".match-select").forEach((selectInput) => {
//   selectInput
// });

if ($(".match-select-1")) {
  $(".match-select-1").select2();
  $("#match_availability").select2();
}
