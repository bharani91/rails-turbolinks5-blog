jQuery(document).ready(function($) {
  var Loader = {
    add: function() {
      $("body").addClass("loading");
    },

    remove: function() {
      $("body").removeClass("loading");
    }
  };

  $(document)
  .on("ajax:before", "[data-remote]", Loader.add)
  .on("ajax:complete", "[data-remote]", Loader.remove);

  $(document).ajaxComplete(Loader.remove);

  $(document).on("turbolinks:request-start", Loader.add);
  $(document).on("turbolinks:render", Loader.remove);
});
