$('.list').html("<%= escape_javascript(select_tag :holy_day_list, options_from_collection_for_select(@holy_day_lists, :id, :name)) %>");
$('.new_holy_day_list').val();