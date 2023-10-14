<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

</head>

<body>
<a href="/"><h1> 메인 페이지 </h1></a>
<h1> 회원가입 기능 </h1>

<form action="/user/join" method="post" onsubmit="return checkPassword()">
        <!-- 바꿀 아이디 입력 -->
        <label for="userLoginId">아이디:</label>
        <input type="text" id="userLoginId" name="userLoginId" required>
        <br>

        <!-- 닉네임 입력 -->
        <label for="userNickname">닉네임:</label>
        <input type="text" id="userNickname" name="userNickname" required>
        <br>

        <!-- 이메일 입력 -->
        <label for="userEmail">이메일:</label>
        <input type="email" id="userEmail" name="userEmail" required>
        <br>

        <!-- 비밀번호 입력 -->
        <label for="userPassword">비밀번호:</label>
        <input type="password" id="userPassword" name="userPassword" required>
        <br>

        <!-- 비밀번호 확인 입력 -->
        <label for="passwordConfirm">비밀번호 확인:</label>
        <input type="password" id="passwordConfirm" required>
        <br>

        <!-- 회원가입 버튼 -->
        <input type="submit" value="회원가입">
    </form>

    <script>
    function checkPassword() {
        let password = document.getElementById("userPassword").value;
        let passwordConfirm = document.getElementById("passwordConfirm").value;

        if (password !== passwordConfirm) {
            alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
            return false; // 폼 제출을 막음
        }
        return true; // 비밀번호가 일치하면 폼 제출을 허용
    }
    </script>
</body>

</html>
