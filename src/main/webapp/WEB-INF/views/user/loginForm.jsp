<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
</head>

<body>
<a href="/"><h1>메인 페이지</h1></a>
<h1>로그인 기능</h1>

<!-- 아이디 입력 -->
<label for="userLoginId">아이디:</label>
<input type="text" id="userLoginId" name="userLoginId" required>
<br>

<!-- 비밀번호 입력 -->
<label for="userPassword">비밀번호:</label>
<input type="password" id="userPassword" name="userPassword" required>
<br>

<!-- 로그인 버튼 -->
<input type="button" onclick="login()" value="로그인">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
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
                "Content-Type": "application/json; charset=utf-8",
            },
        }).done((res) => {
            if (res.code == 1) {
                alert(res.msg);
                location.href = "/user/loginResultForm";
            } else {
                alert(res.msg);
            }
        });
    }
</script>
</body>
</html>
