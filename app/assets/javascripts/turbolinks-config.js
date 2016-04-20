jQuery(document).ready(function($) {
  $(document).on("turbolinks:request-start", function(e) {
    $("body").addClass("loading");
  })

  $(document).on("turbolinks:request-end", function(e) {
    $("body").removeClass("loading");
  })
});
