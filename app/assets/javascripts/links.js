function getLinks() {
  $.get('/api/v1/links', function(links) {
    links.forEach(function(link){
      renderLink(link);
    });
  });
}

function renderLink(link) {
  let linkContent = '';

  linkContent += sprintf('<div class="link">');
  linkContent += sprintf('<li>%s: ', link.title);
  linkContent += sprintf('%s</li></div>', link.url);

  $linkDiv = $(linkContent);
  $('.links').append($linkDiv);
}
