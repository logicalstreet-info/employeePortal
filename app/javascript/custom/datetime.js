$(document).on('turbo:load', function() {
  flatpickr(".timepicker-input", {enableTime: true, noCalendar: true, dateFormat: "H:i"});
  flatpickr(".datepicker-input", {enableTime: false, dateFormat: "d-m-Y",});
});