const container = document.getElementById("container");
const registerBtn = document.getElementById("register");
const loginBtn = document.getElementById("login");

registerBtn.addEventListener("click", () => {
  container.classList.add("active");
});

loginBtn.addEventListener("click", () => {
  container.classList.remove("active");
});

document.getElementById("loginForm").addEventListener("submit", function (event) {
  event.preventDefault();
  login();
});

document.getElementById("joinForm").addEventListener("submit", function (event) {
  event.preventDefault();
  join();
});

function login() {
  let data = {
    userLoginId: $("#userLoginId").val(),
    userPassword: $("#userPassword").val()
  };

  $.ajax("/user/login", {
    type: "POST",
    dataType: "json",
    data: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json; charset=utf-8"
    }
  }).done((res) => {
    if (res.code == 1) {
      location.href = "/jobSearch/mainForm";
    } else {
      alert("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
      return false;
    }
  }).fail((xhr, status, error) => {
    // Handle Ajax failures, e.g., network errors
    console.error("Ajax request failed:", status, error);
    alert("로그인 중 오류가 발생했습니다. 아이디 및 비밀번호를 확인해주세요.");
  });
}

function join() {
  let id = $("#userJoinId").val();
  console.log(id);
  let password = $("#password").val();
  let passwordCheck = $("#password_check").val();
  let email = $("#userEmail").val();

  if (validateId(id) != "유효") {
    alert(validateId(id));
    return false;
  }

  if (password != passwordCheck) {
    alert("비밀번호를 동일하게 입력해주세요.");
    return false;
  } else if (validatePassword(password) != "유효") {
    alert(validatePassword(password));
    return false;
  }

  let data = {
    userLoginId: $("#userJoinId").val(),
    userPassword: $("#password").val(),
    userNickname: $("#userNickname").val(),
    userEmail: $("#userEmail").val()
  };

  $.ajax("/user/join", {
    type: "POST",
    dataType: "json",
    data: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json"
    }
  }).done((res) => {
    if (res.code == 1) {
      alert(res.msg);
      location.reload();
    } else {
      alert(res.msg);
      return;
    }
  });
}
//비밀번호 유효성 검사
function validatePassword(password) {
  // 최소 길이
  if (password.length < 8) {
    return "비밀번호는 최소 8자 이상이어야 합니다.";
  }

  // 영문 대소문자 혼합
  const hasUpperCase = /[A-Z]/.test(password);
  const hasLowerCase = /[a-z]/.test(password);
  if (!(hasUpperCase && hasLowerCase)) {
    return "영문 대문자와 소문자를 혼합하여 사용하세요.";
  }

  // 숫자 포함
  const hasNumber = /\d/.test(password);
  if (!hasNumber) {
    return "숫자를 포함하세요.";
  }

  // 특수 문자 포함
  const hasSpecialChar = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/.test(password);
  if (!hasSpecialChar) {
    return "특수 문자를 포함하세요.";
  }

  // 모든 조건 충족
  return "유효";
}

//아이디 유효성 검사
function validateId(id) {
  // 길이 제약
  if (id.length < 4 || id.length > 12) {
    return "아이디는 4자리 이상 12자리 이하여야 합니다.";
  }

  // 영어 대소문자와 숫자로만 구성
  const alphanumericRegex = /^[a-zA-Z0-9]+$/;
  if (!alphanumericRegex.test(id)) {
    return "아이디는 영어 대소문자와 숫자로만 구성되어야 합니다.";
  }

  //모든 조건 충족
  return "유효";
}
