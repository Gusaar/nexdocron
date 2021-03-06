$(document).ready ->
  $('#add_task_button').click ->
    if $('#project').val() != ""
      $('#hour_id').val("")
      $('#hours').val("")
      $('#description').val("")
      date = get_datepicker_date()
      $('.modal .date span.date').html(date)
      clear_modal_errors()
      $('.modal').show()
    else 
      alert("You need to select a Project.")

  $('#project').change -> 
    check_project()

  $('.modal .cancel_button').click ->
    $('.modal').hide()

  $('.modal .modal_button').click ->
    if validates_modal_fields()
      $.post '/time/update_hour', 
        { hour_id: $('#hour_id').val(), date: $('div.date span.date').text(), hours: $('#hours').val(), description: $('#description').val(), project_id: $('#project').val() }, 
        (->)
        , 'script'
      $('.modal').hide()

  $('#datepicker').datepicker({ dateFormat: 'dd/mm/yy', onSelect: ((dateStr) -> update_week(dateStr))})

  $('#project').val("all")
  check_project()

  $('.calendar ul li').each (index) ->
    self = this
    if ($(self).find('.day_number label').html() == $('.ui-state-active').text())
      $(self).addClass('selected')

$(document).on 'click', 
  '.time_set', 
  ->
    self = this
    date = $(self).parent().parent().parent().find('.header .day_number label').html() + get_datepicker_month_and_year()
    hour_id = $(self).children('.time_set_hour_id').val()
    $('#hour_id').val(hour_id)
    $('.modal .date span.date').html(date)
    $.post '/time/get_hours_info', 
      { id: hour_id }, 
      (data) ->
        $('#hours').val(data.hours)
        $('#description').val(data.description)
        clear_modal_errors()
        $('.modal').show()
      , 'json'

$(document).on 'click',
  '.close',
  ->
    self = this

    $.ajax $(self).attr("href"),
      type: 'DELETE',
      dataType: 'script'
    return false

class update_week
  constructor: (date) ->
    $.post '/time/update_week', 
      { date: date, project_id: $('#project').val() }, 
      (->), 
      'script'

class get_datepicker_date
  constructor: ->
    date = ""
    date = $('.ui-state-active').text() + get_datepicker_month_and_year()
    return(date)

class get_datepicker_month_and_year
  constructor: ->
    months = {
      January: 1,
      February: 2,
      March: 3,
      April: 4,
      May: 5,
      June: 6,
      July: 7,
      August: 8,
      September: 9,
      October: 10,
      November: 11,
      December: 12
    };
    return("-" + months[$('.ui-datepicker-month').text()] + "-" + $('.ui-datepicker-year').text())

class validates_modal_fields
  constructor: ->
    clear_modal_errors()
    flag = true
    if $('.modal #description').val() == ""
      $('.modal #description').addClass("error")
      $('.modal .description div.errors').html("Description can't be blank.")
      flag = false
    if $('.modal #hours').val() == ""
      $('.modal #hours').addClass("error")
      $('.modal .hours div.errors').html("Hour can't be blank.")
      flag = false
    else if !$.isNumeric($('.modal #hours').val())
      $('.modal #hours').addClass("error")
      $('.modal .hours div.errors').html("Hour must be numeric.")
      flag = false
    return(flag)

class clear_modal_errors
  constructor: ->
    $('.modal #description').removeClass("error")
    $('.modal .description div.errors').html("")
    $('.modal #hours').removeClass("error")
    $('.modal .hours div.errors').html("")

class check_project
  constructor: ->
    if $('#project').val() == 'all'
      $('#add_task_button').hide()
    else
      $('#add_task_button').show()
    date = get_datepicker_date()
    update_week(date)