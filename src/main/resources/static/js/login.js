const container = document.getElementById("container");
const registerBtn = document.getElementById("register");
const loginBtn = document.getElementById("login");

registerBtn.addEventListener("click", () => {
  container.classList.add("active");
});

loginBtn.addEventListener("click", () => {
  container.classList.remove("active");
});

document
  .getElementById("loginForm")
  .addEventListener("submit", function (event) {
    event.preventDefault();
    login();
  });

document
  .getElementById("joinForm")
  .addEventListener("submit", function (event) {
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
      alert(res.msg);
      location.href = "/";
    } else {
      alert(res.msg);
      return false;
    }
  });
}

function join() {
  let password = $("#password").val();
  let passwordCheck = $("#password_check").val();

  if (password != passwordCheck) {
    alert("비밀번호를 동일하게 입력해주세요.");
    return false;
  }

  let data = {
    userLoginId: $("#userLoginId").val(),
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
