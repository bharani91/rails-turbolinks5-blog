$(document).on("turbolinks:load", function() {
  $(document).on("click", ".js-cancel-editing", function(e) {
    e.preventDefault();
    var originalContent = $($(this).data("original-content")).html();
    var parentContainer = $(this).data("parent-container");
    $(parentContainer).html(originalContent);
  });
});
