function Passwdinit() {
  // 비밀번호 수정 //
  document
    .querySelector(".edit_passwd")
    .addEventListener("click", openPasswdChanger);
  document
    .querySelector("#closeChanger")
    .addEventListener("click", closePasswdChanger);
  document
    .querySelector("#saveChanger")
    .addEventListener("click", savePasswdChanger);

  // 비밀번호 변경 열기
  function openPasswdChanger() {
    let PasswdChanger = document.querySelector(".passwordChanger");
    PasswdChanger.style.display = "flex";
  }

  // 비밀번호 변경 닫기
  function closePasswdChanger() {
    let PasswdChanger = document.querySelector(".passwordChanger");
    PasswdChanger.style.display = "none";
  }

  // 패스워드 구조 체크
  function isPasswd(passwd) {
    const condition =
      /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    return condition.test(passwd);
  }

  // 비밀번호 확인 검사

  function isSamePasswd() {
    var passwd = document.getElementById("userPassword");
    var passwdConfirm = document.getElementById("userPasswordConfirm");

    if (passwd.value !== passwdConfirm.value) {
      // 비밀번호와 비밀번호 확인 값이 다를 경우 경고를 표시
      document.getElementById("passwordError").style.display = "flex";
    } else {
      // 두 값이 같을 때 경고를 숨김
      document.getElementById("passwordError").style.display = "none";
    }
    if (userPasswd.value !== userPasswdConf.value) {
          alert("비밀번호가 일치하지 않습니다.");
          return; // 비밀번호 불일치 시 함수 종료
      }
    if (userPasswd.value.length < 8) {
          alert("비밀번호는 최소 8자 이상이어야 합니다.");
          return; // 비밀번호 길이 검사
      }
    if (!isPasswd(userPasswd.value)) {
          alert("비밀번호는 영어 대문자, 소문자, 숫자, 특수문자를 모두 포함하여 8자 이상이어야 합니다.");
          return; // 비밀번호 구조 검사
      }
  }

  function savePasswdChanger() {
    var userPasswd = document.getElementById("userPassword");
    var userPasswdConf = document.getElementById("userPasswordConfirm");
    if (userPasswd.value !== userPasswdConf.value) {
      alert("비밀번호가 일치하지 않습니다.");
      return; // 비밀번호 불일치 시 함수 종료
    }

    var data = {
      userPassword: userPasswd.value
    };

    alert("data.userPassword: " + data.userPassword);

    $.ajax("/s/api/user/passwdUpdate", {
      type: "PUT", // HTTP 메소드를 PUT으로 수정
      data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환
      contentType: "application/json", // 컨텐츠 타입을 application/json으로 설정
      headers: {
        Accept: "application/json" // Accept 헤더 설정
      }
    }).done((res) => {
      if (res.code == 1) {
        alert("비밀번호가 변경되었습니다.");
      } else {
        alert("비밀번호 입력 정보를 다시 확인해주세요.");
      }
    });

    closePasswdChanger();
  }
}
window.addEventListener("load", Passwdinit);
