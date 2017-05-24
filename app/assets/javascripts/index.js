// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var running = false;

var pressureBar = $('#pressure-bar .number-pb').NumberProgressBar({
    style: 'basic',
    min: 870,
    max: 1085
});

var temperatureBar = $('#temperature-bar .number-pb').NumberProgressBar({
    style: 'basic',
    min: -20,
    max: 100
});

function getMoistureStatus() {
    if (!running) {
        running = true;
        $.ajax('/api/sensors', {
            success: function (data) {
                $('.soil_humidity_loader').loader('setProgress', data.soil_humidity);
                $('.air_humidity_loader').loader('setProgress', data.air_humidity);
                pressureBar.reach(data.pressure);
                temperatureBar.reach(data.temperature);
                running = false;
            }
        })
    }

}

$(document).ready(function () {

    $('.loader').loader({
        progress: 0,
        frontSpeed: 0.021,
        frontColor: '#E33244',
        frontOpacity: 0.5,
        backSpeed: 0.025,
        backColor: '#E33244',
        backOpacity: 0.2
    });

    getMoistureStatus();
    setInterval(function () {
        getMoistureStatus()
    }, 5000)
});
