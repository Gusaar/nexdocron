$(document).ready ->
  $('#generate_report').click ->
    if $('#project').val() != ''
      $.post '/admin/reports/generate_report', 
        { project_id: $('#project').val(), start_date: get_report_date('start'), end_date: get_report_date('end') }, 
        (->), 
        'script'
    else
      alert 'You must select a project.'

class get_report_date
  constructor: (date_type) ->
    return $('#project_' + date_type + '_date_3i').val() + '/' + $('#project_' + date_type + '_date_2i').val() + '/' + $('#project_' + date_type + '_date_1i').val()