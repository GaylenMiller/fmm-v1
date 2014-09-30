$(document).ready( function() {
    $('#vin-lookup-button').click( function() {
        var vin = $('#inputVIN').val(); /* 2G1FC3D33C9165616'; */
        var edmundsURI = 'https://api.edmunds.com/api/vehicle/v2/vins';
        var options = {
            fmt: 'json',
            api_key: $('#edmunds_api_key').val()
        };

        function showInfo( data) {
            $("#car_model_year").val( data.years[0].year);
            $("#car_model_make").val( data.make.name);
            $("#car_model").val( data.model.name);
            $("#car_model_trim").val( data.years[0].styles[0].name);
            console.log( data.years[0].year + " " + data.make.name  + " " + data.model.name  + " " + data.years[0].styles[0].name);
        }

        $.getJSON( edmundsURI + '/' + vin, options, showInfo);
    });

    $('#make-lookup-button').click( function() {
        var modelYear = $('#car_model_year').val();
        var edmundsURI = 'https://api.edmunds.com/api/vehicle/v2/makes';
        var options = {
            year: modelYear,
            view: 'basic',
            fmt: 'json',
            api_key: $('#edmunds_api_key').val()
        };

        function showModal( data) {
            $('#MakePickModalLabel').text('Makes for ' + modelYear);
            var list = "<ul>";
            for (offset = 0; offset < data.makesCount; offset++) {
                if ( offset % 10 === 0)  {
                    list += "<div class='MakePickModalColumn'>";
                }
                list += "<li><a href='" + offset + "'>" + data.makes[offset].name + '</a></li>';
                if (( offset % 10 === 9) || ( offset === data.makesCount - 1)){
                   list += "</div>";
                }
            }

            $('#MakePickModalBody').html(list);

        }

        $.getJSON( edmundsURI, options, showModal);

    });


    $('#YearPickModal a').click( function( event) {
        event.preventDefault();
        $('#YearPickModal').modal('hide');
        $('#car_model_year').val( $(this).text() );
    });
});

