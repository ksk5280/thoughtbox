function markAsRead(e) {
  var
    data = {read: true},
    id = e.data.id;

  $.ajax({
    url: "api/v1/links/" + id,
    method: "PATCH",
    data: data
  });

  $('#' + id + '-link-url').addClass('read-link');
  $(this).toggleClass('hide');
  $(this).next().toggleClass('hide');
}

function markAsUnread(e) {
  var
    data = {read: false},
    id = e.data.id;

  $.ajax({
    url: "api/v1/links/" + id,
    method: "PATCH",
    data: data
  });

  $('#' + id + '-link-url').removeClass('read-link');
  $(this).toggleClass('hide');
  $(this).prev().toggleClass('hide');
}
