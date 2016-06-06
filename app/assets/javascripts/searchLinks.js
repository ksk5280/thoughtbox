$('#search-bar').on('keyup', function(){
  var
    $links = $('.link'),
    currentLink = this.value;

  $links.each(function (index, link) {
    var
      $link = $(link);
      linkText = $link.children("li").html();

    if (linkText.indexOf(currentLink) !== -1 ) {
      $link.show();
    } else {
      $link.hide();
    }
  });
});
