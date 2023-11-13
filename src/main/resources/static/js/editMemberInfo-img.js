function Imginit() {
  //이벤트리스너
  document
    .querySelector(".edit_img")
    .addEventListener("click", openImageEditor);
  document
    .querySelector("#close_editor")
    .addEventListener("click", closeImageEditor);
  document
    .querySelector("#save_editor")
    .addEventListener("click", saveImageEditor);

  function openImageEditor() {
    let imageEditor = document.querySelector(".img_editor");
    imageEditor.style.display = "flex";
  }
  //이미지 셀렉터 닫기
  function closeImageEditor() {
    let imageEditor = document.querySelector(".img_editor");
    imageEditor.style.display = "none";
  }

  //선택한 이미지로 프로필 이미지 변경
  function saveImageEditor() {
    let userId = $("#userId").val();

    if ($("#userProfileImg")[0].files[0] == null) {
      alert("변경할 이미지를 선택 해주셔야 합니다.");
      return;
    }

    let formData = new FormData();

    formData.append("profileImg", $("#userProfileImg")[0].files[0]);

    $.ajax("/s/api/user/updateProfile/" + userId, {
      type: "PUT",
      data: formData,
      processData: false,
      contentType: false
    }).done((res) => {
      if (res.code == 1) {
        location.href = "/s/api/user/updateForm/"+userId;
      } else {
        alert("이미지를 다시 확인해주세요.");
      }
    });
  }
}
window.addEventListener("load", Imginit);
