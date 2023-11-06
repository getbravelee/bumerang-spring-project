// document.addEventListener("DOMContentLoaded", function () {
//   const submitButton = document.querySelector(".btn_wrap button");

//   submitButton.addEventListener("click", function (event) {
//     event.preventDefault();
//     const selectedReason = document.querySelector(
//       'input[name="reason"]:checked'
//     ).value;
//     if (selectedReason === "기타") {
//       const otherReason = document.querySelector(".guitar");
//       if (otherReason) {
//         const otherReasonValue = otherReason.value;
//         console.log("기타 Reason:", otherReasonValue);
//       }
//     } else {
//       console.log("Selected Reason:", selectedReason);
//     }
//     alert("제출 되었습니다.");
//   });
// });

// 구인글 신고하기
$(".jobReportBtn").click(() => {
  reportJob();
});

function reportJob() {
  const selectedReportType = $('input[name="reportType"]:checked').val();

  if (selectedReportType === undefined) {
    alert("사유를 선택해주세요.");
    return;
  }

  let data = {
    jobId: $("#targetId").val(),
    userId: $("#userId").val(),
    reportType: selectedReportType,
    reportContent: $("#reportContent").val()
  };

  $.ajax("/s/api/report", {
    type: "POST",
    dataType: "json",
    data: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json; charset=utf-8"
    }
  }).done((res) => {
    if (res.code == 1) {
      alert(res.msg);
      window.close();
    } else {
      alert(res.msg);
      return false;
    }
  });
}
