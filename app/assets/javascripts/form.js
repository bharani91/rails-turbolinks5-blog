$(document).on("turbolinks:load", function() {
  $("form[data-remote]")
  .on("ajax:beforeSend", function(e) {
    $(this).find("input[type='submit']").addClass("loading");
  })
  .on("ajax:complete", function(e) {
    $(this).find("input[type='submit']").removeClass("loading");
  });

});
