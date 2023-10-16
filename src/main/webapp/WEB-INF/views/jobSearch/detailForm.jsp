<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>구인 상세보기</title>
    <style>
        /* CSS 스타일링을 여기에 추가합니다. */
        div {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            max-width: 800px;
            margin: 0 auto;
        }

        label {
            width: 48%;
            margin-bottom: 10px;
        }

        p {
            width: 48%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            padding: 5px;
        }

        /* "수정" 버튼 가로로 너비 맞춤 스타일 */
        input[type="button"] {
            width: 100%;
            padding: 5px;
        }
    </style>
</head>
<body>
<a href="/"><h1> 메인 페이지 </h1></a>
<h1>구인 상세보기</h1>
<div>
    <label for="jobContentTitle">모집 제목</label>
    <p>${jobSearch.jobContentTitle}</p>

    <label for="jobContent">모집 내용</label>
    <p>${jobSearch.jobContent}</p>

    <label for="jobGenre">모집 장르</label>
    <p>${jobSearch.jobGenre}</p>

    <label for="jobArtTitle">작품 제목</label>
    <p>${jobSearch.jobArtTitle}</p>

    <label for="jobStartDate">모집 시작일</label>
    <p>${jobSearch.jobStartDate}</p>

    <label for="jobProductionDate">제작일</label>
    <p>${jobSearch.jobProductionDate}</p>

    <label for="jobTo">모집 인원</label>
    <p>${jobSearch.jobTo}</p>

    <label for="jobField">모집 분야</label>
    <p>${jobSearch.jobField}</p>

    <label for="jobGender">모집 성별</label>
    <p>${jobSearch.jobGender}</p>

    <label for="jobContact">연락방법</label>
    <p>${jobSearch.jobContact}</p>

    <label for="jobDeadline">마감일</label>
    <p>${jobSearch.jobDeadline}</p>

    <label for="userId">작성자 id</label>
    <p>${jobSearch.userId}</p>

</div>
</body>
</html>
