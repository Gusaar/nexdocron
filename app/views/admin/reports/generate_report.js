$('.tables').html("<%= escape_javascript(render :partial => 'report') %>");
$('.data_table').each(function (index) {
  var table = this;
  $(table).find('.row').each(function(i) {
    var row = this;
    var description_height = $(row).children('.description').height();
    var date_height = $(row).children('.date').height();

    if (description_height != date_height) {
      $(row).children('.column').each(function(x) {
        $(this).height(description_height);
      });
    }
  });
});