jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

$('.chosen-drop').css({minWidth: '100%', width: 'auto'});
$('.chosen-container').removeAttr('style')
