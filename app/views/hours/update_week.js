$('.right_panel').html("<%= escape_javascript(render :partial => 'calendar') %>");
$('.calendar ul li').each(function(index){
  var self = this;

  if ($(self).find('.day_number label').html() == $('.ui-state-active').text()) {
    $(self).addClass('selected');
  }
});
$('.month_hours').html("<%= @month_hours %>");
$('.month_hours').removeClass('warning good over');
$('.month_hours').addClass('<%= month_color_by_hours(@month_hours, @month_total_hours) %>');