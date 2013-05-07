$('.time_set_container_<%= @id %>').remove();
$('.list_<%= @date.day %> .footer .hours').html("<%= @week_total_hours[@date.day.to_s].to_f %>");
$('.list_<%= @date.day %> .footer').removeClass('warning good over');
$('.list_<%= @date.day %> .footer').addClass('<%= footer_color_by_hours(@week_total_hours[@date.day.to_s].to_f, "#{@date.day}/#{@date.month}/#{@date.year}") %>')
$('.month_hours').html("<%= @month_hours %>");
$('.month_hours').removeClass('warning good over');
$('.month_hours').addClass('<%= month_color_by_hours(@month_hours, @month_total_hours) %>');