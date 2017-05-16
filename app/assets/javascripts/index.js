// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var running = false;

function getMoistureStatus() {
    if (!running) {
        running = true;
        $.ajax('/api/moisture', {
            success: function (data) {
                $('.loader').loader('setProgress', data.value);
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
