$('#search-bar').on('keyup', function(){
  let
    $links = $('.link'),
    currentLink = this.value;

  $links.each(function (index, link) {
    let
      $link = $(link);
      linkText = $link.children("li").html();

    if (linkText.indexOf(currentLink) !== -1 ) {
      $link.show();
    } else {
      $link.hide();
    }
  });
});
