/* 비밀번호 검사 컨트롤*/
//유효성 검사. 하나 이상의 영어대소문자와 숫자, 특수문자 포함, 8글자 이상.
function openPasswdChanger() {
  let PasswdChanger = document.querySelector(".passwordChanger");
  PasswdChanger.style.display = "flex";
}
//이미지 셀렉터 닫기
function closePasswdChanger() {
  let PasswdChanger = document.querySelector(".passwordChanger");
  PasswdChanger.style.display = "none";
}
//선택한 이미지로 프로필 이미지 변경
function savePasswdChanger() {
  
  closePasswdChanger();
}

function isPasswd() {
  const condition =
    /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

  return condition.test(passwd);
}

//비밀번호 확인 검사
function isSamePasswd() {
  if (passwd.value !== passwdConfirm.value) {
    // 비밀번호와 비밀번호 확인 값이 다를 경우 경고를 표시
    document.getElementById("passwordError").style.display = "block";
  } else {
    // 두 값이 같을 때 경고를 숨김
    document.getElementById("passwordError").style.display = "none";
  }
}

let passwd = document.querySelector("#userPassword");
let passwdConfirm = document.querySelector("#userPasswordConfirm");

passwdConfirm.addEventListener("input", isSamePasswd);

document.querySelector(".edit_passwd").addEventListener("click", openPasswdChanger);
document.querySelector("#closeChanger").addEventListener("click", closePasswdChanger);
document.querySelector("#saveChanger").addEventListener("click", savePasswdChanger);


/* 프로필 이미지 변환 컨트롤 */
//이미지 셀렉터 열기
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
  //이미지 변경 후, 변경된 이미지 주소를 서버로 보내는 부분 필요. (조장 문의)
  closeImageEditor();
}

//이벤트리스너
document.querySelector(".edit_img").addEventListener("click", openImageEditor);
document.querySelector("#close_editor").addEventListener("click", closeImageEditor);
document.querySelector("#save_editor").addEventListener("click", saveImageEditor);

// 과거 마이페이지 코드
// var iconImages = document.querySelectorAll(".icon_imgs");
// iconImages.forEach(function (iconImage) {
//   iconImage.addEventListener("click", function () {
//     changeImage(iconImage.src);
//   });
// });

/* 회원 탈퇴 컨트롤 */
//회원탈퇴 창 열기
function openWithdrawalConfirmer() {
  let confirmer = document.querySelector(".confirm_withdrwal");
  confirmer.style.display = "block";
}

//회원탈퇴 창 닫기
function closeWithdrawalConfirmer() {
  let confirmer = document.querySelector(".confirm_withdrwal");
  confirmer.style.display = "none";
}


//필모그래피 컨트롤
let filmoNum = 2;

let add = document.querySelector(".filmo_add");
let filmoTable = document.querySelector(".filmo_body");
add.addEventListener("click", addFilmo);

//필모 추가하기
function addFilmo() {
  console.log("버튼을 클릭했습니다");
  filmoNum += 1;
  console.log(filmoNum);

  let filmoCol = document.createElement("tr");
  filmoCol.id = filmoNum;
  filmoCol.innerHTML =
    '<tr><td><input id="title" type="text" /></td><td><input id="prod_year" type="number" value="" /></td><td><input id="role" type="text" value=""/></td><td><input id="genre" type="text" value="" /></td><td><input id="director" type="text" value="" /></td><td><input id="history" type="text" value="" /></td><td><button class="filmo_del">삭제</button></td></tr>';

  filmoTable.appendChild(filmoCol);
  activeDelBtns(); //생성한 행의 삭제버튼도 활성화
}

//제거 버튼 활성 함수
function activeDelBtns() {
  let delBtns = document.querySelectorAll(".filmo_del");

  for (let i = 0; i < delBtns.length; i++) {
    delBtns[i].addEventListener("click", function () {
      let tr = delBtns[i].parentElement.parentElement;
      filmoTable.removeChild(tr);
    });
  }

  filmoNum -= 1;
  console.log(filmoNum);
}

//삭제버튼 초기 활성화
activeDelBtns();

// function addFilmo() {
//
//   let filmoNum = 3;
//   let parser = new DOMParser();
//   let filmoCol =
//     '<tr><td><input id="title" type="text" /></td><td><input id="prod_year" type="number" value="" /></td><td><input id="role" type="text" value=""/></td><td><input id="genre" type="text" value="" /></td><td><input id="director" type="text" value="" /></td><td><input id="history" type="text" value="" /></td><td><button class="filmo_del">삭제</button></td></tr>';
//     // "<tr><td><input id='title' type='text' value='' /></td><td><input id='prod_year' type='number' value='' /></td><td><input id='role' type='text;' value=''/></td><td><input id='genre' type='text' value='' /></td><td><input id='director' type='text' value='' /></td><td><input id='history' type='text' value='' /></td><td><button class='filmo_del'>삭제</button></td></tr>";
//   let filmoColDom = parser.parseFromString(filmoCol, "text/html").body
//     .firstChild;
//   filmoColDom.id = ++filmoNum;

//   filmoNum++;
//   filmoTable.appendChild(filmoColDom);
// }

//이벤트리스너
// document
//   .querySelector(".btn_withdrawal")
//   .addEventListener("click", openWithdrawalConfirmer);
// document
//   .querySelector(".btn_withdrawal_close")
//   .addEventListener("click", closeWithdrawalConfirmer);
