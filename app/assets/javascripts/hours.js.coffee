$(document).ready ->
  $('#add_task_button').click ->
    if $('#project').val() != ""
      $('#hour_id').val("")
      $('#hours').val("")
      $('#description').val("")
      date = get_datepicker_date()
      $('.modal .date span.date').html(date)
      $('.modal').show()
    else 
      alert("You need to select a Project.")

  $('#project').change -> 
    date = get_datepicker_date()
    update_week(date)

  $('.modal .cancel_button').click ->
    $('.modal').hide()

  $('.modal .modal_button').click ->
    $.post '/time/update_hour', 
      { hour_id: $('#hour_id').val(), date: $('div.date span.date').text(), hours: $('#hours').val(), description: $('#description').val(), project_id: $('#project').val() }, 
      (->)
      , 'script'
    $('.modal').hide()

  $('#project').val("")

  $('#datepicker').datepicker({ dateFormat: 'dd/mm/yy', onSelect: ((dateStr) -> update_week(dateStr))})

  $('.calendar ul li').each (index) ->
    self = this
    if ($(self).find('.day_number label').html() == $('.ui-state-active').text())
      $(self).addClass('selected')

$(document).on 'click', 
  '.time_set', 
  ->
    self = this
    date = $(self).parent().parent().find('.header .day_number label').html() + get_datepicker_month_and_year()
    hour_id = $(self).children('.time_set_hour_id').val()
    $('#hour_id').val(hour_id)
    $('.modal .date span.date').html(date)
    $.post '/time/get_hours_info', 
      { id: hour_id }, 
      (data) ->
        $('#hours').val(data.hours)
        $('#description').val(data.description)
        $('.modal').show()
      , 'json'
