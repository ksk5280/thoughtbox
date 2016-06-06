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

  linkContent += '<div class="link">';
  linkContent += `<li>${link.title}: ${link.url}</li></div>`;
  linkContent += `<button class="btn btn-default" id="${link.id}-read">Mark as Read</button>`;
  linkContent += `<button class="btn btn-default" id="${link.id}-unread">Mark as Unread</button>`;

  $linkDiv = $(linkContent);
  $('.links').append($linkDiv);

  // add Event Listeners
  $(`#${link.id}-read`).on('click', markAsRead);
  $(`#${link.id}-unread`).on('click', markAsUnread);
}

function markAsRead() {
  $(this).prev().addClass('readLink');
}

function markAsUnread() {
  $(this).prev().prev().removeClass('readLink');
}
