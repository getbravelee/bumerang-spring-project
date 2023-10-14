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

<form action="/ex/delete" method="post">
        <!-- 삭제할 아이디 입력 -->
        <label for="username">아이디:</label>
        <input type="text" id="username" name="userId" required>
        <br>
        <!-- 삭제 버튼 -->
        <input type="submit" value="삭제">
    </form>
</body>

</html>