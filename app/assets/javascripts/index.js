// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require Chart.min.js
var moistureData = [], moistureChart;

function getMoistureStatus() {
    $.ajax('/api/moisture', {
        success: function (data) {
            moistureData.push({date: new Date(), value: data.value});
            updateMoistureChart()
        }
    })
}

function buildMoistureChart() {
    moistureChart = new Chart(document.getElementById("moisture_chart"), {
        type: 'line',
        data: {
            labels: moistureData.map(function (md) {
                return md.date
            }),
            datasets: [{
                label: 'Humidité en temps réel',
                backgroundColor: '#59ABE3',
                borderColor: '#4183D7',
                fill: false,
                data: moistureData.map(function (md) {
                    return md.value
                })
            }]
        },
        options: {
            responsive: true,
            title: {
                display: true,
                text: 'Humidité'
            },
            tooltips: {
                mode: 'index',
                intersect: false
            },
            hover: {
                mode: 'nearest',
                intersect: true
            },
            scales: {
                xAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Heure'
                    },
                    ticks: {
                        beginAtZero:true
                    }
                }],
                yAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Pourcentage'
                    },
                    ticks: {
                        beginAtZero:true,
                        max: 100
                    }
                }]
            }
        }
    });
}

function updateMoistureChart() {
    moistureChart.data.labels = moistureData.map(function (md) {
        return md.date.getHours() + ':' + md.date.getMinutes() + ':' + md.date.getSeconds()
    });
    moistureChart.data.datasets[0].data = moistureData.map(function (md) {
        return md.value
    });
    moistureChart.update()
}

$(document).ready(function () {
    buildMoistureChart();
    getMoistureStatus();
    setInterval(function () {
        getMoistureStatus()
    }, 5000)
});