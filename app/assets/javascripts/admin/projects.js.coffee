$(document).ready ->
  $('#project_colour').ColorPicker({ color: '##{ @project.colour }', onChange: ((hsb, hex, rgb, el)-> $('#project_colour').val(hex) )})