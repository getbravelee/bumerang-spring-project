<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
</head>

<body>
<a href="/"><h1> 메인 페이지 </h1></a>
<h2> 로그인한 세션 정보 </h2>
<table>
            <thead>
            <tr>
                <th>사용자ID</th>
                <th>아이디</th>
                <th>권한</th>
                <th>닉네임</th>
                <th>프로필 이미지</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${principal.userId}</td>
                <td>${principal.userLoginId}</td>
                <td>${principal.userRole}</td>
                <td>${principal.userNickname}</td>
                <td>${principal.userProfileImg}</td>
            </tr>
            </tbody>
</table>
</body>
</html>
