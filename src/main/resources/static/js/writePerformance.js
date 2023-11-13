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
let existingGenre = document.querySelector("#pfGenre");
let existingAgerating = document.querySelector("#pfAgerating");
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
if (existingAgerating) {
  SOItems.forEach((SOItems) => {
    if (
      SOItems.querySelector(".item-text").innerText ==
      existingAgerating.innerText
    ) {
      SOItems.classList.toggle("checked");
      let btnText =
        SOItems.parentElement.parentElement.querySelector(".btn-text");
      btnText.innerText = SOItems.querySelector(".item-text").innerText;
    }
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
      [{ header: [1, 2, 3, 4, false] }],
      ["bold", "italic", "underline"],
      ["code-block"]
    ]
  },
  placeholder: "내용을 입력하세요",
  theme: "snow" // or 'bubble'
});

// 공연 글 작성
$("#pfWriteBtn").click(() => {
  write();
});

function write() {
  let pfGenre = document.querySelector("#pfGenre").innerText;
  let pfAgerating = document.querySelector("#pfAgerating").innerText;

  let quillContent = document.querySelector(".ql-editor");
  let pfContent = quillContent.innerHTML;

  let formData = new FormData();

  let data = {
    pfTitle: $("#pfTitle").val(),
    pfStartDate: $("#pfStartDate").val(),
    pfDeadline: $("#pfDeadline").val(),
    pfAgerating: pfAgerating,
    pfRunningtime: $("#pfRunningtime").val(),
    pfBookingmethod: $("#pfBookingmethod").val(),
    pfGenre: pfGenre,
    pfProduction: $("#pfProduction").val(),
    pfPrice: $("#pfPrice").val(),
    pfLocation: $("#pfLocation").val(),
    pfContent: pfContent,
    userId: $("#userId").val()
  };

  formData.append("thumbnail", $("#pfThumbnail")[0].files[0]);
  formData.append(
    "writeDto",
    new Blob([JSON.stringify(data)], { type: "application/json" })
  );

  $.ajax("/s/api/performance/write", {
    type: "POST",
    data: formData,
    processData: false, // 쿼리스트링 방지
    contentType: false,
    enctype: "multipart/form-data"
  }).done((res) => {
    if (res.code == 1) {
      alert(res.msg);
      location.href = "/performance/mainForm";
    } else {
      alert(res.msg);
      return false;
    }
  });
}

// 공연 글 수정
$("#pfUpdateBtn").click(() => {
  update();
});

function update() {
  if ($("#pfThumbnail")[0].files[0] == null) {
    // 썸네일 수정 안할때
    let pfGenre = document.querySelector("#pfGenre").innerText;
    let pfAgerating = document.querySelector("#pfAgerating").innerText;
    let pfId = $("#pfId").val();

    let quillContent = document.querySelector(".ql-editor");
    let pfContent = quillContent.innerHTML;
    let data = {
      pfTitle: $("#pfTitle").val(),
      pfStartDate: $("#pfStartDate").val(),
      pfDeadline: $("#pfDeadline").val(),
      pfAgerating: pfAgerating,
      pfRunningtime: $("#pfRunningtime").val(),
      pfBookingmethod: $("#pfBookingmethod").val(),
      pfGenre: pfGenre,
      pfProduction: $("#pfProduction").val(),
      pfPrice: $("#pfPrice").val(),
      pfLocation: $("#pfLocation").val(),
      pfContent: pfContent,
      userId: $("#userId").val(),
      pfId: $("#pfId").val()
    };

    $.ajax("/s/api/performance/update/noThumbnail", {
      type: "PUT",
      dataType: "json",
      data: JSON.stringify(data),
      headers: {
        "Content-Type": "application/json"
      }
    }).done((res) => {
      if (res.code == 1) {
        alert("썸네일 변경 없는 공연글로 수정되었습니다.");
        location.href = "/s/api/performance/detailForm/" + pfId;
      } else {
        alert("게시글 입력 정보를 다시 확인해주세요.");
        return false;
      }
    });
  } else {
    let pfGenre = document.querySelector("#pfGenre").innerText;
    let pfAgerating = document.querySelector("#pfAgerating").innerText;
    let pfId = $("#pfId").val();

    let quillContent = document.querySelector(".ql-editor");
    let pfContent = quillContent.innerHTML;
    let formData = new FormData();
    let data = {
      pfTitle: $("#pfTitle").val(),
      pfStartDate: $("#pfStartDate").val(),
      pfDeadline: $("#pfDeadline").val(),
      pfAgerating: pfAgerating,
      pfRunningtime: $("#pfRunningtime").val(),
      pfBookingmethod: $("#pfBookingmethod").val(),
      pfGenre: pfGenre,
      pfProduction: $("#pfProduction").val(),
      pfPrice: $("#pfPrice").val(),
      pfLocation: $("#pfLocation").val(),
      pfContent: pfContent,
      userId: $("#userId").val(),
      pfId: $("#pfId").val()
    };

    formData.append("thumbnail", $("#pfThumbnail")[0].files[0]);
    formData.append(
      "updateDto",
      new Blob([JSON.stringify(data)], { type: "application/json" })
    );

    $.ajax("/s/api/performance/update", {
      type: "PUT",
      data: formData,
      processData: false, // 쿼리스트링 방지
      contentType: false,
      enctype: "multipart/form-data"
    }).done((res) => {
      if (res.code == 1) {
        alert(res.msg);
        location.href = "/s/api/performance/detailForm/" + pfId;
      } else {
        alert(res.msg);
        return false;
      }
    });
  }
}

var selectedFile = null; // Selected file information
var isFileSelectionCanceled = false; // Flag to track if the user canceled file selection

// 이미지 미리 보기 함수
function previewImage(event) {
  var pfThumbnail = event.target;
  var imagePreviewContainer = document.getElementById("imagePreviewContainer");
  var defaultImagePath = "/image/defaultThumb.png";

  // Check if the user canceled file selection
  if (isFileSelectionCanceled) {
    isFileSelectionCanceled = false; // Reset the flag
    return;
  }

  // 선택한 파일이 이미지인지 확인
  if (pfThumbnail.files && pfThumbnail.files[0]) {
    // Update selectedFile with the newly selected file
    selectedFile = pfThumbnail.files[0];
    var reader = new FileReader();

    // 파일을 읽어들이고, 읽기 완료되면 이미지 미리 보기 설정
    reader.onload = function (e) {
      // Remove any existing child elements in the imagePreviewContainer
      while (imagePreviewContainer.firstChild) {
        imagePreviewContainer.removeChild(imagePreviewContainer.firstChild);
      }

      // Create an image element and set its attributes
      var img = document.createElement("img");
      img.id = "imagePreview";
      img.alt = "미리 보기 이미지";
      img.src = e.target.result;
      img.style.boxShadow = "none"; // Remove shadow effect

      // Append the image element to the imagePreviewContainer
      imagePreviewContainer.appendChild(img);
    };

    // 파일을 읽어들임
    reader.readAsDataURL(selectedFile);
  } else {
    // If no file is selected, display the default image
    var img = document.createElement("img");
    img.id = "imagePreview";
    img.alt = "미리 보기 이미지";
    img.src = defaultImagePath;
    img.style.boxShadow = "none"; // Remove shadow effect

    // Remove any existing child elements in the imagePreviewContainer
    while (imagePreviewContainer.firstChild) {
      imagePreviewContainer.removeChild(imagePreviewContainer.firstChild);
    }

    // Append the default image element to the imagePreviewContainer
    imagePreviewContainer.appendChild(img);
  }
}

