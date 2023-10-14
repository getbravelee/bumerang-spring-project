<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

</head>

<body>
<a href="/"><h1> 메인 페이지 </h1></a>
<a href="/ex/selectForm"><h2> SELECT 예제 알아보기 </h2></a>
<a href="/ex/createForm"><h2> CREATE 예제 알아보기 </h2></a>
<a href="/ex/updateForm"><h2> UPDATE 예제 알아보기 </h2></a>
<a href="/ex/deleteForm"><h2> DELETE 예제 알아보기 </h2></a>

<form action="/ex/update" method="post" onsubmit="return checkPassword()">
        <!-- 바꿀 아이디 입력 -->
        <label for="username">아이디:</label>
        <input type="text" id="username" name="userLoginId" required>
        <br>

        <!-- 닉네임 입력 -->
        <label for="nickname">닉네임:</label>
        <input type="text" id="nickname" name="userNickname" required>
        <br>

        <!-- 이메일 입력 -->
        <label for="email">이메일:</label>
        <input type="email" id="email" name="userEmail" required>
        <br>

        <!-- 비밀번호 입력 -->
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="userPassword" required>
        <br>

        <!-- 비밀번호 확인 입력 -->
        <label for="passwordConfirm">비밀번호 확인:</label>
        <input type="password" id="passwordConfirm" required>
        <br>

        <!-- 정보수정 버튼 -->
        <input type="submit" value="정보수정">
    </form>

    <script>
    function checkPassword() {
        let password = document.getElementById("password").value;
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
