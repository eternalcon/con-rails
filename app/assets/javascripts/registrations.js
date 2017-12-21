$().ready(function(){
    $('.container-fluid').on('change', '#registrationSelect', function() {
        select_val = Number.parseInt(this.value);
        rows = $('#newRegistrationForm').find('div.participant-form-row').length;

        if (select_val > rows) {
            $('#hiddenFormGroup').clone().appendTo('#newRegistrationForm');
            rows += 1;
        }
        return true;
    });

});
