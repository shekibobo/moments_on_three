// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {

  /*
   * 'loaded' is added only if javascript is enabled.
   * CSS styles that should only be applied when javascript is loaded should
   * use a 'body.loaded' ancestor selector.
   */
  $('body').addClass('loaded');


  /*
   * This hides the control buttons unless the specific photo is hovered over.
   */
  $('.photo').live('hover', function() {
    $(this).contents('.control').fadeToggle();
  })

  $('.delete').live('ajax:success', function() {
    $(this).closest('.photo').fadeOut();
    $.getScript( window.location.href );
  });

})

