$(document).ready ->
  $('.missing_time_date').change ->
    $.post '/admin/update_users_with_missing_hours',
    { date: get_missing_time_date },
    (->),
    'script'

class get_missing_time_date
  constructor: () ->
    return '1/' + $('#missing_time_date_2i').val() + '/' + $('#missing_time_date_1i').val()