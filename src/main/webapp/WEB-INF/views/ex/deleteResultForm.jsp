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

<h1> 삭제된 사용자 정보 </h1>
    <table>
        <thead>
        <tr>
            <th>사용자ID</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>닉네임</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${user.userId}</td>
            <td>${user.userLoginId}</td>
            <td>${user.userPassword}</td>
            <td>${user.userNickname}</td>
        </tr>
        </tbody>
    </table>
</body>

</html>