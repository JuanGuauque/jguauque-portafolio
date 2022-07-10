let ready = undefined;
let set_positions = undefined;

set_positions = function() {
$('div[data-id]').each(function(i) {
  $(this).attr('data-pos', i + 1);
});
};

ready = function() {
set_positions();
$('.sortable').sortable();
$('.sortable').sortable().bind('sortupdate', function(e, ui) {
  const updated_order = [];
  set_positions();
  $('div[data-id]').each(function(i) {
    updated_order.push({
      id: $(this).data('id'),
      position: i + 1
    });
  });
  $.ajax({
    type: 'PUT',
    url: '/portfolios/sort',
    data: { order: updated_order
  }
  });
});
};

$(document).ready(ready);