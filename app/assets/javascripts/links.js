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
  linkContent += `<li>${link.title}: ${link.url}</li>`;
  linkContent += `<button class="btn btn-default" id="${link.id}-read">Mark as Read</button>`;
  linkContent += `<button class="btn btn-default hide" id="${link.id}-unread">Mark as Unread</button>`;
  linkContent += `<button class="btn btn-default" id="${link.id}-edit">Edit</button></div>`;

  $linkDiv = $(linkContent);
  $('.links').append($linkDiv);

  // add Event Listeners
  $(`#${link.id}-read`).on('click', markAsRead);
  $(`#${link.id}-unread`).on('click', markAsUnread);
  $(`#${link.id}-edit`).on('click', editLink);
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

function editLink() {
  let $linkText = $(this).siblings('li');
  $linkText.attr('contenteditable', 'true');
  $linkText.focus();
}
