/*
 *The following block of code was adapted from https://gist.github.com/358429
 * by ewall as an interpretation of Railscast 175 replacing url_utils with bbq
 */
/* only compatible in later versions of browsers */
if (history && history.pushState) {
  $(function() {
    $(".pagination a").live("click", function() {
      $(".pagination").html("Loading photos...");
      $.getScript(this.href);
      history.pushState(null, "", this.href);
      return false;
    });
  });
}
else {
  base_url = location.protocol + '//' + location.host + location.pathname;
  $(function() {
    $(".pagination a").live('click', function(e) {
      params = $.deparam.querystring(this.href);
      new_url = $.param.fragment(base_url, params, 2);
      $(".pagination").html("Loading photos...");
      location.hash = $.param.fragment( new_url );
      // $.getScript(this.href);
      return false;
    });
  });

  $(window).bind('hashchange', function(e) {
    params = e.fragment;
    $.getScript($.param.querystring(base_url, params) );
  });

  if (location.hash) {
    $(window).trigger( 'hashchange' );
  }
}
