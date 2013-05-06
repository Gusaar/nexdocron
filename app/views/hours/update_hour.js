if ('<%= @created %>' == 'true') {
  $('.list_<%= @hour.date.day %> .body').append('<div class="time_set_container_<%= @hour.id %>"><%= escape_javascript(render :partial => "time_set", locals: { hour: @hour }) %></div>')
} else {
  $('.time_set_container_<%= @hour.id %>').html("<%= escape_javascript(render :partial => 'time_set', locals: { hour: @hour }) %>");
}
$('.list_<%= @hour.date.day %> .footer .hours').html("<%= @week_total_hours[@hour.date.day.to_s].to_f %>");
$('.list_<%= @hour.date.day %> .footer').removeClass('warning good over');
$('.list_<%= @hour.date.day %> .footer').addClass('<%= footer_color_by_hours(@week_total_hours[@hour.date.day.to_s].to_f, "#{@hour.date.day}/#{@date.month}/#{@date.year}") %>')
$('.month_hours').html("<%= @month_hours %>");
$('.month_hours').removeClass('warning good over');
$('.month_hours').addClass('<%= month_color_by_hours(@month_hours, @month_total_hours) %>');