$(document).ready ->
  $('.add_new_holy_day_list').click ->
    $.post '/admin/holy_days/add_list',
      { name: $('.new_holy_day_list').val() },
      (->),
      'script'
    return false

  $('.add_holy_day').click ->
    $.post '/admin/holy_days/add_day',
      { list_id: $('#holy_day_list').val(), date: get_holy_day_date() },
      (->),
      'script'

  update_list()

$(document).on 'change',
  '#holy_day_list',
  ->
    update_list()    

$(document).on 'click',
  '.remove_holy_day',
  ->
    self = this

    $.post '/admin/holy_days/remove_day',
      { list_id: $('#holy_day_list').val(), date: $(self).parent().find('.date').text() },
      (->),
      'script'

class get_holy_day_date
  constructor: () ->
    return $('#list_date_3i').val() + '/' + $('#list_date_2i').val() + '/' + $('#list_date_1i').val()

class update_list
  constructor: () ->
    if typeof($('#holy_day_list').val()) != "undefined"
      $.get '/admin/holy_days/' + $('#holy_day_list').val() + '/update_list',
        (->),
        'script'