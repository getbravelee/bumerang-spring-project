// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

var month = moment();

var sixMonthAgo = month.clone().subtract(4, 'months');

var monthRange = [];

while (sixMonthAgo.isBefore(month)) {
    monthRange.push(sixMonthAgo.format("MM월"));
    sixMonthAgo.add(1, 'month');
}

monthRange.push(month.format("MM월"));

let monthView = document.querySelectorAll(".monthView");
monthView = Array.from(monthView).map((element) => element.value);

// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: monthRange,
        datasets: [
            {
                label: "monthView",
                backgroundColor: "rgba(2,117,216,1)",
                borderColor: "rgba(2,117,216,1)",
                data: monthView
            }
        ]
    },
    options: {
        scales: {
            xAxes: [{
                time: {
                    unit: 'month'
                },
                gridLines: {
                    display: false
                },
                ticks: {
                    maxTicksLimit: 6
                }
            }],
            yAxes: [{
                ticks: {
                    min: 0,
                    max: Math.max(...monthView),
                    maxTicksLimit: 5
                },
                gridLines: {
                    display: true
                }
            }],
        },
        legend: {
            display: false
        }
    }
});