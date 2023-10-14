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

<h1> 변경전 사용자 정보 </h1>
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
            <td>${beforeUser.userId}</td>
            <td>${beforeUser.userLoginId}</td>
            <td>${beforeUser.userPassword}</td>
            <td>${beforeUser.userNickname}</td>
        </tr>
        </tbody>
    </table></br></br>
<h1> 변경후 사용자 정보 </h1>
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
                <td>${afterUser.userId}</td>
                <td>${afterUser.userLoginId}</td>
                <td>${afterUser.userPassword}</td>
                <td>${afterUser.userNickname}</td>
            </tr>
            </tbody>
        </table>
</body>

</html>