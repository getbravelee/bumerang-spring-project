// JavaScript 비밀번호 이메일 전송
function sendEmailAndRedirect() {
    var userEmail = document.getElementById("userEmail").value; // 사용자 이메일 입력란의 값
    var userEmailPw = document.getElementById("userEmailPw").value; // 사용자 이메일과 관련된 기타 필드 값

    var data = {
        userEmail: userEmail,
        // 이메일과 관련된 기타 필드를 이곳에 추가
    };

    // AJAX 요청을 보냅니다.
    $.ajax({
        type: "POST",
        url: "/user/findPw",
        data: data,
        success: function (response) {
            // 이메일을 성공적으로 전송하면 "findPw" 페이지로 리다이렉트
            window.location.href = "/findPw";
        },
        error: function (error) {
            // 오류 처리
            alert("이메일 전송 중 오류가 발생했습니다.");
        }
    });
}
