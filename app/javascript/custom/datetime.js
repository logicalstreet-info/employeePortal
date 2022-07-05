$(document).on('turbo:load', function() {
  flatpickr(".timepicker-input", { allowInput: true, altInput: true,
     enableTime: true, noCalendar: true, dateFormat: "H:i:K"});
  flatpickr(".datepicker-input", { allowInput: true, altInput: true,
     enableTime: false, dateFormat: "d-m-Y"});
});