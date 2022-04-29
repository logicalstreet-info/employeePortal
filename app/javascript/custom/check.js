$(function () {
  $('#checkbox').change(function () {
    if(this.checked) {
      $("div#half_day_div").addClass("d-block");
      $("div#half_day_div").removeClass("d-none");
    }
    else{
      $("div#half_day_div").addClass("d-none");
      $("div#half_day_div").removeClass("d-block");
    }
  });
});
