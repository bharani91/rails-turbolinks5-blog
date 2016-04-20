$(document).on("turbolinks:load", function() {
  $("form[data-remote]")
  .on("ajax:beforeSend", function(e) {
    $(this).find("input[type='submit']").addClass("loading");
    $("body").addClass("loading");
  })
  .on("ajax:complete", function(e) {
    $(this).find("input[type='submit']").removeClass("loading");
  });


  $("[data-remote]")
  .on("ajax:beforeSend", function(e) {
    $("body").addClass("loading");
  });

  function stopLoader () {
    $("body").removeClass("loading");
  }

  $(document).ajaxSuccess(stopLoader);
  $(document).ajaxError(stopLoader);


});
