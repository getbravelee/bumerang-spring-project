// 공연 댓글 신고하기
$(".commentReportBtn").click(() => {
  reportComment();
});

function reportComment() {
  const selectedReportType = $('input[name="reportType"]:checked').val();

  if (selectedReportType === undefined) {
    alert("사유를 선택해주세요.");
    return;
  }

  let data = {
    commentId: $("#targetId").val(),
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