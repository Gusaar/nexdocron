if ('<%= @created %>' == 'true') {
  $('.list_<%= @hour.date.day %> .body').append('<div class="time_set_container_<%= @hour.id %>"><%= escape_javascript(render :partial => "time_set", locals: { hour: @hour }) %></div>')
} else {
  $('.time_set_container_<%= @hour.id %>').html("<%= escape_javascript(render :partial => 'time_set', locals: { hour: @hour }) %>");
}