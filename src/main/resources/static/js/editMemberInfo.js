//유저의 기존 옵션을 선택하기
function existingOption() {
  //html에 출력되어 있는 user의 기존정보 문자열을 가져옴
  const form = document.querySelector("#userForm");
  const tone = document.querySelector("#userTone");
  const field = document.querySelector("#userField");
  const age = document.querySelector("#userAge");
  const career = document.querySelector("#userCareer");

  //html에 input/option 버튼을 가져옴
  const formList = document.querySelectorAll(".user_form");
  const toneList = document.querySelectorAll(".user_tone");
  const fieldList = document.querySelectorAll(".user_field");
  const ageList = document.querySelectorAll(".user_age");
  const careerList = document.querySelectorAll(".user_career");

  //기존정보와 input/option값을 비교해 같으면 해당 input/option에 체크/셀렉트
  formList.forEach((formList) => {
    if (formList.value == form.value) {
      formList.selected = true;
    }
  });
  toneList.forEach((toneList) => {
    if (toneList.value == tone.value) {
      toneList.selected = true;
    }
  });
  fieldList.forEach((fieldList) => {
    if (fieldList.value == field.value) {
      fieldList.selected = true;
    }
  });
  ageList.forEach((ageList) => {
    if (ageList.value == age.value) {
      ageList.selected = true;
    }
  });
  careerList.forEach((careerList) => {
    if (careerList.value == career.value) {
      careerList.selected = true;
    }
  });
}

existingOption();

// window.addEventListener("load", Forminit);

// 과거 마이페이지 코드
// var iconImages = document.querySelectorAll(".icon_imgs");
// iconImages.forEach(function (iconImage) {
//   iconImage.addEventListener("click", function () {
//     changeImage(iconImage.src);
//   });
// });

/* 회원 탈퇴 컨트롤 */
//회원탈퇴 창 열기
function showWithdrawalConfirm() {
  var userDetailUserId = document.querySelector(
    ".withdrawal_wrap input:nth-child(1)"
  ).value;
  var principalUserId = document.querySelector(
    ".withdrawal_wrap input:nth-child(2)"
  ).value;

  if (userDetailUserId === principalUserId) {
    document.getElementById("withdrawalConfirmModal").style.display = "block";
  } else {
    alert("세션이 일치하지 않습니다");
  }
}

function confirmWithdrawal() {
  var userDetailUserId = document.querySelector(
    ".withdrawal_wrap input:nth-child(1)"
  ).value;
  var principalUserId = document.querySelector(
    ".withdrawal_wrap input:nth-child(2)"
  ).value;

  if (userDetailUserId === principalUserId) {
    // AJAX를 사용하여 서버에 POST 요청 보내기
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/user/withDraw/" + userDetailUserId, true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.onreadystatechange = function () {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          // 성공적으로 탈퇴 처리되었을 경우의 동작
          alert("탈퇴가 완료되었습니다.");
          location.href = "/s/api/user/logout";
        } else {
          // 탈퇴 처리 중 에러가 발생한 경우의 동작
          alert("탈퇴 처리 중 오류가 발생했습니다.");
        }
      }
    };

    // POST 요청 본문에 필요한 데이터를 전송
    xhr.send(JSON.stringify({ userId: userDetailUserId }));
  } else {
    alert("세션이 일치하지 않습니다");
  }
}

function closeWithdrawal() {
  document.getElementById("withdrawalConfirmModal").style.display = "none";
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
    '<tr><td><input id="up_1_title" class="upTitle" type="text" type="text" /></td><td><input id="up_1_prod_year" class="upProdYear" type="number" value="" /></td><td><input id="up_1_role" class="upRole" type="text" value=""/></td><td><input id="up_1_genre" class="upGenre" type="text" value="" /></td><td><input id="up_1_director" class="upDirector" type="text" value="" /></td><td><input id="up_1_history" class="upHistory" type="text" value="" /></td><td><button class="filmo_del">삭제</button></td></tr>';

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
$("#updateBtn").click(() => {
  update();
});

function updateUser() {
  let data = {
    userId: $("#userId").val(),
    userEmail: $("#userEmail").val(),
    userNickname: $("#userNickname").val(),
    userGender: $("input[name='user_gender']:checked").val(),
    userHeight: $("#user_height").val(),
    userForm: $("#user_form").val(),
    userTone: $("#user_tone").val(),
    userAge: $("#user_age").val(),
    userCareer: $("#user_career").val(),
    userSkill: $("#user_skill").val(),
    userEducation: $("#user_education").val(),
    userContactLink: $("#user_contact").val(),
    uftitle: $("#user_field").val(),
    userPortfolio: []
  };
  // UserPortfolio 객체의 개수를 가져옴
  let portfolioCount = document.querySelectorAll(".upTitle").length;

  // 각 UserPortfolio 객체의 값을 가져와서 배열에 추가
  for (let i = 0; i < portfolioCount; i++) {
    let portfolioItem = {
      upTitle: document.querySelectorAll(".upTitle")[i].value,
      upProdYear: document.querySelectorAll(".upProdYear")[i].value,
      upRole: document.querySelectorAll(".upRole")[i].value,
      upGenre: document.querySelectorAll(".upGenre")[i].value,
      upDirector: document.querySelectorAll(".upDirector")[i].value,
      upHistory: document.querySelectorAll(".upHistory")[i].value,
      userId: $("#userId").val()
    };

    // 각 필드의 값을 alert로 확인
    // alert(`Portfolio Item ${i + 1}:
    //   upTitle: ${portfolioItem.upTitle},
    //   upProdYear: ${portfolioItem.upProdYear},
    //   upRole: ${portfolioItem.upRole},
    //   upGenre: ${portfolioItem.upGenre},
    //   upDirector: ${portfolioItem.upDirector},
    //   upHistory: ${portfolioItem.upHistory},
    //   userId: ${portfolioItem.userId}
    // `);

    data.userPortfolio.push(portfolioItem);
  }

  $.ajax("/s/api/user/update", {
    type: "PUT",
    dataType: "json",
    data: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json"
    }
  }).done((res) => {
    if (res.code == 1) {
      alert(res.msg);
      location.href = "/s/api/user/detailForm/" + data.userId;
    } else {
      alert(res.msg);
      return false;
    }
  });
}
