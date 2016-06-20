function linkKeyPress(e) {
  if (e.keyCode === 13) { // 13 === Enter key
    e.preventDefault();
    this.blur();
  }
}

function linkBlur(e) {
  var
    $this = $(this),
    id = parseInt(this.id[0]),
    linkTitle = $this.html().split(': ')[0],
    linkUrl = $this.html().split(': ')[1];

  changeData(id, linkTitle, linkUrl);
}

function editLink(e) {
  var
    $linkText = $(this).siblings('li'),
    id = e.data.id;

  $linkText.attr('contenteditable', 'true');
  $linkText.focus();
}

function changeData(id, linkTitle, linkUrl) {
  var data = {title: linkTitle, url: linkUrl};

  $.ajax({
    url: "api/v1/links/" + id,
    method: "PATCH",
    data: data
  });
}
