/************************/
/* textarea 높이 조절 */
/************************/
// 새로운 글이 추가됐을 때 textarea height값을 지정해주기 위해 필요
function resizeTextarea() {
  const textareas = document.querySelectorAll(".textarea");

  for (let i = 0; i < textareas.length; i++) {
    textareas[i].style.height = "auto";
    textareas[i].style.height = textareas[i].scrollHeight + "px";
  }
}

// 페이지가 처음 로드될 때 기존 teaxtarea들의 height값을 지정
window.addEventListener("load", resizeTextarea);

/************************/
/* 싱글 드랍박스 */
/************************/
const selectOneBtn = document.querySelectorAll(".select_single"),
  SOItems = document.querySelectorAll(".single_item");

selectOneBtn.forEach((selectOneBtn) => {
  selectOneBtn.addEventListener("click", () => {
    selectOneBtn.classList.toggle("open");
  });
});

SOItems.forEach((SOItems) => {
  SOItems.addEventListener("click", () => {
    if (SOItems.parentElement.querySelectorAll(".checked").length > 0) {
      let previous = SOItems.parentElement.querySelector(".checked");
      previous.classList.toggle("checked");
    }
    SOItems.classList.toggle("checked");
    // SOItems.closest(".checked").toggle("checked");

    let btnText =
      SOItems.parentElement.parentElement.querySelector(".btn-text");
    console.log(SOItems.querySelector(".item-text").innerText);
    btnText.innerText = SOItems.querySelector(".item-text").innerText;
  });
});

// 싱글 드랍박스에 기존 정보 불러오기
let existingGenre = document.querySelector("#jobGenre");
let existingGender = document.querySelector("#jobGender");
if (existingGenre) {
  SOItems.forEach((SOItems) => {
    if (
      SOItems.querySelector(".item-text").innerText == existingGenre.innerText
    ) {
      SOItems.classList.toggle("checked");
      let btnText =
        SOItems.parentElement.parentElement.querySelector(".btn-text");
      btnText.innerText = SOItems.querySelector(".item-text").innerText;
    }
  });
}
if (existingGender) {
  SOItems.forEach((SOItems) => {
    if (
      SOItems.querySelector(".item-text").innerText == existingGender.innerText
    ) {
      SOItems.classList.toggle("checked");
      let btnText =
        SOItems.parentElement.parentElement.querySelector(".btn-text");
      btnText.innerText = SOItems.querySelector(".item-text").innerText;
    }
  });
}
/***************/
/* 멀티플 드랍박스 */
/***************/
const selectBtn = document.querySelector(".select-btn"),
  items = document.querySelectorAll(".item");

selectBtn.addEventListener("click", () => {
  selectBtn.classList.toggle("open");
});

var checkedTexts = [];

items.forEach((item) => {
  item.addEventListener("click", () => {
    checkedTexts = [];
    item.classList.toggle("checked");

    let checked = item.parentElement.parentElement.querySelectorAll(".checked");
    let btnText = item.parentElement.parentElement.querySelector(".btn-text");

    if (checked && checked.length > 0 && checked.length <= 3) {
      checked.forEach((checked) => {
        checkedTexts.push(checked.querySelector(".item-text").textContent);
      });

      btnText.innerText = `${checkedTexts}`;
    } else if (checked.length > 3) {
      alert("3개까지만 선택 가능합니다.");
      item.classList.toggle("checked"); // 마지막으로 선택한 항목 체크 해제

      checked = item.parentElement.parentElement.querySelectorAll(".checked");
      checked.forEach((checked) => {
        checkedTexts.push(checked.querySelector(".item-text").textContent);
      });

      btnText.innerText = `${checkedTexts}`;
    } else {
      btnText.innerText = "모두 골라주세요";
    }
  });
});

// 멀티플 드랍박스에 기존 정보 불러오기
let existingPosition = document.querySelectorAll(".jobPositionTitleList");

if (existingPosition) {
  existingPosition.forEach((existingPosition) => {
    items.forEach((items) => {
      if (
        items.querySelector(".item-text").innerText == existingPosition.value
      ) {
        items.classList.toggle("checked");
      }
    });
  });
}
//셀렉트 박스 외에 다른 영역을 클릭할 경우, 셀렉트 박스를 닫기
function isClickSelect(event) {
  //싱글 드랍박스 조작
  selectOneBtn.forEach((selectOneBtn) => {
    if (!selectOneBtn.parentElement.contains(event.target)) {
      if (selectOneBtn.classList.contains("open")) {
        selectOneBtn.classList.toggle("open");
      }
    }
  });
  //멀티플 드랍박스 조작
  if (!selectBtn.parentElement.contains(event.target)) {
    if (selectBtn.classList.contains("open")) {
      selectBtn.classList.toggle("open");
    }
  }
}
document.addEventListener("click", function (event) {
  isClickSelect(event);
});
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

// 구인 글 작성
$("#jobWriteBtn").click(() => {
  write();
});

function write() {
  let jobGenre = document.querySelector("#jobGenre").innerText;
  let jobGender = document.querySelector("#jobGender").innerText;
  let jobPositionTitle = checkedTexts;

  let quillContent = document.querySelector(".ql-editor");
  let jobContent = quillContent.innerHTML;

  let data = {
    jobContentTitle: $("#jobContentTitle").val(),
    jobContent: jobContent,
    jobPositionList: jobPositionTitle, // 모집분야를 배열로 선언
    jobArtTitle: $("#jobArtTitle").val(),
    jobGenre: jobGenre,
    jobStartDate: $("#jobStartDate").val(),
    jobProductionDate: $("#jobProductionDate").val(),
    jobTo: $("#jobTo").val(),
    jobPay: $("#jobPay").val(),
    jobGender: jobGender,
    jobContact: $("#jobContact").val(),
    jobDeadline: $("#jobDeadline").val(),
    userId: $("#userId").val()
  };

  $.ajax("/s/api/jobSearch/write", {
    type: "POST",
    dataType: "json",
    data: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json"
    }
  }).done((res) => {
    if (res.code == 1) {
      alert(res.msg);
      location.href = "/jobSearch/mainForm";
    } else {
      alert(res.msg);
      return false;
    }
  });
}

// 구인 글 수정
$("#jobUpdateBtn").click(() => {
  update();
});

function update() {
  let jobGenre = document.querySelector("#jobGenre").innerText;
  let jobGender = document.querySelector("#jobGender").innerText;
  let jobPositionTitle = checkedTexts;
  let jobId = $("#jobId").val();

  let quillContent = document.querySelector(".ql-editor");
  let jobContent = quillContent.innerHTML;

  let data = {
    jobContentTitle: $("#jobContentTitle").val(),
    jobContent: jobContent,
    jobPositionList: jobPositionTitle, // 모집분야를 배열로 선언
    jobArtTitle: $("#jobArtTitle").val(),
    jobGenre: jobGenre,
    jobStartDate: $("#jobStartDate").val(),
    jobProductionDate: $("#jobProductionDate").val(),
    jobTo: $("#jobTo").val(),
    jobPay: $("#jobPay").val(),
    jobGender: jobGender,
    jobContact: $("#jobContact").val(),
    jobDeadline: $("#jobDeadline").val(),
    userId: $("#userId").val(),
    jobId: $("#jobId").val()
  };

  $.ajax("/s/api/jobSearch/update", {
    type: "PUT",
    dataType: "json",
    data: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json"
    }
  }).done((res) => {
    if (res.code == 1) {
      alert(res.msg);
      location.href = "/s/api/jobSearch/detailForm/" + jobId;
    } else {
      alert(res.msg);
      return false;
    }
  });
}
