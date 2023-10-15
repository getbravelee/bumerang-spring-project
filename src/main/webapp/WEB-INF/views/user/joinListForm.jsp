<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
<style>
  table {
    border-collapse: collapse;
    width: 100%;
  }

  th, td {
    border: 1px solid #000;
    padding: 8px;
    text-align: left;
  }

  th {
    background-color: #f2f2f2;
  }
</style>
</head>

<body>
            <header style="background-color: #333;color: #fff;padding: 20px 0;text-align: center;">
                <a href="/" style="text-decoration: none; outline: none "><h1>메인 페이지</h1></a>
            </header>
   <h1>사용자 정보 목록</h1>
<table>
            <thead>
            <tr>
                <th>사용자ID</th>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>닉네임</th>
                <th>성별</th>
                <th>나이</th>
                <th>포지션</th>
                <th>경력</th>
                <th>프로필 이미지</th>
                <th>권한</th>
            </tr>
            </thead>
            <tbody><c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.userLoginId}</td>
                <td>${user.userPassword}</td>
                <td>${user.userNickname}</td>
                <td>${user.userGender}</td>
                <td>${user.userAge}</td>
                <td>${user.userPosition}</td>
                <td>${user.userCareer} 년차</td>
                <td>${user.userProfileImg}</td>
                <td>${user.userRole}</td>
            </tr></c:forEach>
            </tbody>
</table>
</body>

</html>
