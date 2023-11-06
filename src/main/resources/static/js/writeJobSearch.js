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

/************************/
/* 멀티플 드랍박스 */
/************************/
const selectBtn = document.querySelector(".select-btn"),
  items = document.querySelectorAll(".item");

selectBtn.addEventListener("click", () => {
  selectBtn.classList.toggle("open");
});

items.forEach((item) => {
  item.addEventListener("click", () => {
    item.classList.toggle("checked");

    let checked = item.parentElement.parentElement.querySelectorAll(".checked");
    let btnText = item.parentElement.parentElement.querySelector(".btn-text");

    if (checked && checked.length > 0) {
      btnText.innerText = `${checked.length} Selected`;
    } else {
      btnText.innerText = "Select Language";
    }
  });
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

// $("#jobWriteBtn").click(() => {
//   write();
// });

// function write() {
//   let data = {
//     jobContentTitle: $("#jobContentTitle").val(),
//     jobContent: $("#editor-container").val(),
//     jobPositionTitle: [], // 모집분야를 배열로 선언
//     jobArtTitle: $("#jobArtTitle").val(),
//     jobGenre: $("#jobGenre").val(),
//     jobStartDate: $("#jobStartDate").val(),
//     jobProductionDate: $("#jobProductionDate").val(),
//     jobTo: $("#jobTo").val(),
//     jobPay: $("#jobPay").val(),
//     jobGender: $("#jobGender").val(),
//     jobContact: $("#jobContact").val(),
//     jobDeadline: $("#jobDeadline").val(),
//     jobTo: $("#jobTo").val(),
//     userId: $("#userId").val()
//   };
//   alert("jobContentTitle: " + data.jobContentTitle);
//   alert("jobGenre: " +  data.jobGenre);
//   alert("jobContent: " +  data.jobContent);

//   // 여러 모집분야를 배열에 추가
//   $("input[name='jobPositionTitle']:checked").each(function () {
//     data.jobPositionTitle.push($(this).val());
//   });

//   $.ajax("/s/api/jobSearch/write", {
//     type: "POST",
//     dataType: "json",
//     data: JSON.stringify(data),
//     headers: {
//       "Content-Type": "application/json"
//     }
//   }).done((res) => {
//     if (res.code == 1) {
//       alert(res.msg);
//       location.href("/");
//     } else {
//       alert(res.msg);
//       return;
//     }
//   });
// }
