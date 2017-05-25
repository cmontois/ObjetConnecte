// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function getMoistureStatus() {
    $.ajax('/api/reports', {
        success: function (data) {
            updateMoistureChart(data)
        }
    })
}


function updateMoistureChart(data) {
    console.log(data);
    $.plot("#line-chart",
        [{label: 'Soil', data: data.map(function (r) {
            return [r.id, r.soil_humidity]
        })},{label: 'air', data: data.map(function (r) {
            return [r.id, r.air_humidity]
        })}], {
            grid: {
                hoverable: true,
                borderColor: "#f3f3f3",
                borderWidth: 1,
                tickColor: "#f3f3f3"
            },
            series: {
                shadowSize: 0,
                lines: {
                    show: true
                },
                points: {
                    show: true
                }
            },
            lines: {
                fill: false,
                color: ["#3c8dbc", "#f56954"]
            },
            yaxis: {
                show: true
            },
            xaxis: {
                show: true,
                ticks: data.map(function (r) {
                    return [r.id, (new Date(r.created_at)).toLocaleTimeString()]
                })
            }
        });
}


$(document).ready(function () {
    getMoistureStatus()
});
