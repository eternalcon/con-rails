#$('#registrationSelect').change ->
$('select').change ->
  alert("change")
  $('hiddenFormGroup').clone().appendTo('#newRegistrationForm')
  true