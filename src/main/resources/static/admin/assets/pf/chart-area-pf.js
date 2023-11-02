// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = "#292b2c";


// 오늘의 날짜를 가져오고
var today = moment();

// 일주일 전의 날짜를 계산
var aWeekAgo = today.clone().subtract(6, 'days');

// 오늘로부터 일주일 동안의 날짜 배열을 생성
var dateRange = [];
while (aWeekAgo.isBefore(today)) {
    dateRange.push(aWeekAgo.format("MM월 DD일")); // 날짜 형식을 원하는대로 포맷팅
    aWeekAgo.add(1, 'day');
}
// 오늘의 날짜를 추가
dateRange.push(today.format("MM월 DD일"));

var dailyView = document.querySelectorAll(".dailyView");
dailyView = Array.from(dailyView).map((element) => element.value);
dailyView = dailyView.slice(-7);

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {

    type: "line",
    data: {
        labels: dateRange,
        datasets: [
            {
                label: "dailyView",
                lineTension: 0.3,
                backgroundColor: "rgba(2,117,216,0.2)",
                borderColor: "rgba(2,117,216,1)",
                pointRadius: 5,
                pointBackgroundColor: "rgba(2,117,216,1)",
                pointBorderColor: "rgba(255,255,255,0.8)",
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                pointHitRadius: 50,
                pointBorderWidth: 2,
                data: dailyView
            }
        ]
    },
    options: {
        scales: {
            xAxes: [
                {
                    time: {
                        unit: "date"
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 7
                    }
                }
            ],
            yAxes: [
                {
                    ticks: {
                        min: 0,
                        max: Math.max(...dailyView),
                        maxTicksLimit: Math.max(...dailyView)
                    },
                    gridLines: {
                        color: "rgba(0, 0, 0, .125)"
                    }
                }
            ]
        },
        legend: {
            display: false
        }
    }
});