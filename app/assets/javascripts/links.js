function getLinks() {
  $.get('/api/v1/links', function(links) {
    links.forEach(function(link){
      renderLink(link);
    });
  });
}

function renderLink(link) {
  let
    linkContent = '',
    $linkDiv;

  linkContent += `<div class="link" id="${link.id}-link">`;
  linkContent += `<li id="${link.id}-li">${link.title}: ${link.url}</li>`;
  linkContent += `<button class="btn btn-default" id="${link.id}-read">Mark as Read</button>`;
  linkContent += `<button class="btn btn-default hide" id="${link.id}-unread">Mark as Unread</button>`;
  linkContent += `<button class="btn btn-default" id="${link.id}-edit">Edit</button></div>`;

  $linkDiv = $(linkContent);
  $('.links').append($linkDiv);

  // add Event Listeners
  $(`#${link.id}-read`).on('click', markAsRead);
  $(`#${link.id}-unread`).on('click', markAsUnread);
  $(`#${link.id}-edit`).on('click', {id: link.id}, editLink);
  $(`#${link.id}-li`).on('keypress', linkKeyPress);
  $(`#${link.id}-li`).on('blur', linkBlur);
}

function markAsRead() {
  $(this).prev().addClass('readLink');
  $(this).toggleClass('hide');
  $(this).next().toggleClass('hide');
}

function markAsUnread() {
  $(this).prev().prev().removeClass('readLink');
  $(this).toggleClass('hide');
  $(this).prev().toggleClass('hide');
}
