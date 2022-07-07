$(document).on('turbo:load', function() {
  $(document).ready(function(){    
    var multipleCancelButton = new Choices('#choices-multiple-remove-button', {
      removeItemButton: true,
      searchResultLimit:5,
      renderChoiceLimit:5
    });
  });
});