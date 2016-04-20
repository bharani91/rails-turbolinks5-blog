$(document).on("ready", function() {

  var Loader = {
    add: function() {
      $("body").addClass("loading");
    },

    remove: function() {
      $("body").removeClass("loading");
    }
  }


  $(document)
  .on("ajax:before", "[data-remote]", Loader.add)
  .on("ajax:complete", "[data-remote]", Loader.remove);


  $(document).ajaxSuccess(Loader.remove);
  $(document).ajaxError(Loader.remove);


});
