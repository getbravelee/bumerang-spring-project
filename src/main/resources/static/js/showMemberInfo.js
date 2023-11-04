//변수 연결
let copyBtn = document.querySelector(".fa-regular.fa-copy");
let copyPop = document.getElementById("copy_pop");
copyBtn.addEventListener("click", copy);

function openCopyPop() {
  copyPop.style.display = "block";
}

function closeCopy() {
  copyPop.style.display = "none";
}

//복사 버튼 클릭시 클립보드에 복사 및 팝업 출현
function copy() {
  let text = document.querySelector("#contact");
  console.log(text.value);

  navigator.clipboard
    .writeText(text.value)
    .then(function () {
      openCopyPop();
      setTimeout(function () {
        closeCopy();
      }, 1000);
    })
    .catch(function (err) {
      console.error("복사에 실패했습니다.", err);
    });
}
