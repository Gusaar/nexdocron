$(document).ready ->
  $('#download_invoice').click ->
    self = this;
    window.location.href = "/admin/invoices/download.xls?start_date=" + get_invoice_date('start') + "&end_date=" + get_invoice_date('end') + "&report_type=" + $('#report_type').val() + "&client_id=" + $("#invoice_client").val()

  $('#report_type').change ->
    if $(this).val() == "2"
      $('.invoice_client').show()
    else
      $('.invoice_client').hide()

  $('#report_type').val("1")

class get_invoice_date
  constructor: (date_type) ->
    return $('#project_' + date_type + '_date_3i').val() + '/' + $('#project_' + date_type + '_date_2i').val() + '/' + $('#project_' + date_type + '_date_1i').val()