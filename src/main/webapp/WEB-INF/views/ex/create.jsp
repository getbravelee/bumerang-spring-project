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

<h1>회원가입</h1>
    <form action="/ex/create" method="post">
        <!-- 닉네임 입력 -->
        <label for="nickname">닉네임:</label>
        <input type="text" id="nickname" name="userNickname" required>
        <br>

        <!-- 아이디 입력 -->
        <label for="username">아이디:</label>
        <input type="text" id="username" name="userLoginId" required>
        <br>

        <!-- 이메일 입력 -->
        <label for="email">이메일:</label>
        <input type="email" id="email" name="userEmail" required>
        <br>

        <!-- 비밀번호 입력 -->
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="userPassword" required>
        <br>

        <!-- 회원가입 버튼 -->
        <input type="submit" value="회원가입">
    </form>
</body>

</html>