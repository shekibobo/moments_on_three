// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {

  /*
   * This hides the control buttons unless the specific photo is hovered over.
   */
  $('.photo .control').hide();
  $('.photo').hover(function() {
    $(this).contents('.control').fadeToggle();
  })
})