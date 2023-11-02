// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily =
    '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = "#292b2c";

var pfGenre = document.querySelectorAll(".pfGenre");
var genreCount = document.querySelectorAll(".genreCount");

pfGenre = Array.from(pfGenre).map((element) => element.value);
genreCount = Array.from(genreCount).map((element) => element.value);

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
    type: "pie",
    data: {
        labels: pfGenre,
        datasets: [
            {
                data: genreCount,
                backgroundColor: ["#007bff", "#dc3545", "#ffc107", "#28a745"]
            }
        ]
    }
});