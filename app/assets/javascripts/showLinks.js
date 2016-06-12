function getLinks() {
  $.get('/api/v1/links', function(links) {
    links.forEach(function(link){
      renderLink(link);
      addEventListeners(link);
    });
  });
}

function renderLink(link) {
  var
    linkContent = '',
    $linkDiv;

  linkContent += '<div class="link" id="' + link.id + '-link">';
  linkContent += '<li id="' + link.id + '-li"><strong>' + link.title + ':</strong> ' + link.url + '</li>';
  linkContent += '<button class="btn btn-default" id="' + link.id + '-read">Mark as Read</button>';
  linkContent += '<button class="btn btn-default hide" id="' + link.id + '-unread">Mark as Unread</button>';
  linkContent += '<button class="btn btn-default" id="' + link.id + '-edit">Edit</button></div>';

  $linkDiv = $(linkContent);
  $('.links').append($linkDiv);
}

function addEventListeners(link) {
  $('#' + link.id + '-read').on('click', {id: link.id}, markAsRead);
  $('#' + link.id + '-unread').on('click', {id: link.id}, markAsUnread);
  $('#' + link.id + '-edit').on('click', {id: link.id}, editLink);
  $('#' + link.id + '-li').on('keypress', linkKeyPress);
  $('#' + link.id + '-li').on('blur', linkBlur);
}
