<% unless @report.empty? %>
	$('.tables').html("<%= escape_javascript(render :partial => 'report') %>");
<% else %>
  $('.tables').html("<div style='margin: 50px 0 50px 400px;'>No report available.<\div>");
<% end %>