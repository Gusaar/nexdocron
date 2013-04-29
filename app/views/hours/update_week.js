$('.right_panel').html("<%= escape_javascript(render :partial => 'calendar') %>");
$('.calendar ul li').each(function(index){
  var self = this;

  if ($(self).find('.day_number label').html() == $('.ui-state-active').text()) {
    $(self).addClass('selected');
  }
});