// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily =
    '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = "#292b2c";

var jobGenre = document.querySelectorAll(".jobGenre");
var genreCount = document.querySelectorAll(".genreCount");

jobGenre = Array.from(jobGenre).map((element) => element.value);
genreCount = Array.from(genreCount).map((element) => element.value);

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
    type: "pie",
    data: {
        labels: jobGenre,
        datasets: [
            {
                data: genreCount,
                backgroundColor: ["#007bff", "#dc3545", "#ffc107", "#28a745", "#FF6D19", "#180DFF", "#F8F3F2"]
            }
        ]
    }
});