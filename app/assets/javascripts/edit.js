function change_to_edit_mode(id){
  var event_cell = document.getElementById(id);
  var edit_id = id + "-edit";
  var edit_form = document.getElementById(edit_id);
  
  event_cell.style["display"] = "none";
  edit_form.style["display"] = "";
}

function change_to_view_mode(id){
  var event_cell = document.getElementById(id);
  var edit_id = id + "-edit";
  var edit_form = document.getElementById(edit_id);
  
  event_cell.style["display"] = "";
  edit_form.style["display"] = "none";
}
