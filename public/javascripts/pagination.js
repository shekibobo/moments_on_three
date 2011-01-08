$(function() {
  $(".pagination a").live('click', function() {
    $(".pagination").html("Loading photos...");
    $.getScript(this.href);
    return false;
  });
});