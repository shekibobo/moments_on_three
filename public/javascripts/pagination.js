$(function() {
  $(".pagination a").live('click', function() {
    $(".pagination").html("Loading photos...");
    $.get(this.href, null, null, "script");
    return false;
  });
});