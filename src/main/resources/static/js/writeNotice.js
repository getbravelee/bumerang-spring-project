/************/
/* 에디터 삽입 */
/************/

var quill = new Quill("#editor-container", {
  modules: {
    toolbar: [
      [{ header: [1, 2, 3, 4, 5, false] }],
      ["bold", "italic", "underline"],
      ["image", "code-block"]
    ]
  },
  placeholder: "내용을 입력하세요",
  theme: "snow" // or 'bubble'
});

// 공지글 작성하기
$("#noticeWriteBtn").click(() => {
  writeNotice();
});

function writeNotice() {
  // Quill 에디터에서 작성한 내용 가져오기
  let noticeContent = quill.root.innerHTML;

  let data = {
    noticeTitle: $("#noticeTitle").val(),
    noticeContent: noticeContent,
    noticeType: $("#noticeType").val(),
    userId: $("#userId").val()
  };

  $.ajax("/s/api/auth/noticeWrite", {
    type: "POST",
    dataType: "json",
    data: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json; charset=utf-8"
    }
  }).done((res) => {
    if (res.code == 1) {
      alert(res.msg);
      location.href = "/notice/listForm";
    } else {
      alert(res.msg);
    }
  });
  return false;
}

// 공지글 수정하기
$("#noticeUpdateBtn").click(() => {
  updateNotice();
});

function updateNotice() {
  // Quill 에디터에서 작성한 내용 가져오기
  let noticeContent = quill.root.innerHTML;
  let noticeId = $("#noticeId").val();

  let data = {
    noticeTitle: $("#noticeTitle").val(),
    noticeContent: noticeContent,
    noticeType: $("#noticeType").val(),
    userId: $("#userId").val(),
    noticeId: noticeId
  };

  $.ajax("/s/api/auth/noticeUpdate", {
    type: "PUT",
    dataType: "json",
    data: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json; charset=utf-8"
    }
  }).done((res) => {
    if (res.code == 1) {
      alert(res.msg);
      location.href = "/notice/detailForm/" + noticeId;
    } else {
      alert(res.msg);
    }
  });
  return false;
}
