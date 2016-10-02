$(document).ready(function() {
  var timeoutID = null;

  function findMember(str) {
    $('.searchable').each(function(){
      var text = $(this).text().toLowerCase();

      if(text.search(str) < 0)
        $(this).parent().parent().fadeOut();
      else{
        $(this).parent().parent().fadeIn();
        results++;
      }
    });
  }

  $('#search').keyup(function(e) {
    clearTimeout(timeoutID);
    timeoutID = setTimeout(findMember.bind(undefined, e.target.value.toLowerCase()), 500);
  });

});
