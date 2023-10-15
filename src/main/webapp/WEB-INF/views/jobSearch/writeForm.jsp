<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>구인 작성</title>
    <style>
        /* CSS 스타일링을 여기에 추가합니다. */
        div {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            max-width: 800px;
            margin: 0 auto;
        }

        label, input, select, textarea {
            width: 48%;
            margin-bottom: 10px;
        }

        /* "작성 완료" 버튼 가로로 너비 맞춤 스타일 */
        input[type="button"] {
            width: 100%;
            padding: 5px;
        }

    </style>
</head>
<body>
<a href="/"><h1> 메인 페이지 </h1></a>
    <h1>구인 작성</h1>
    <div>
        <label for="jobContentTitle">모집 제목</label>
        <input type="text" id="jobContentTitle" name="jobContentTitle" required>

        <label for="jobContent">모집 내용</label>
        <textarea id="jobContent" name="jobContent" rows="4" required></textarea>

        <label for="jobGenre">모집 장르</label>
        <input type="text" id="jobGenre" name "jobGenre">

        <label for="jobArtTitle">작품 제목</label>
        <input type="text" id="jobArtTitle" name="jobArtTitle">

        <label for="jobStartDate">모집 시작일</label>
        <input type="date" id="jobStartDate" name="jobStartDate">

        <label for="jobProductionDate">제작일</label>
        <input type="date" id="jobProductionDate" name="jobProductionDate">

        <label for="jobTo">모집 인원</label>
        <input type="number" id="jobTo" name="jobTo" min="1">

        <label for="jobField">모집 분야</label>
               <select id="jobField" name="jobField">
                    <option value="스텝">스텝</option>
                    <option value="감독">감독</option>
                    <option value="배우">배우</option>
                </select>

        <label for="jobGender">모집 성별</label>
        <select id="jobGender" name="jobGender">
            <option value="true">남성</option>
            <option value="false">여성</option>
            <option value="null">무관</option>
        </select>

        <label for="jobContact">연락방법</label>
        <input type="text" id="jobContact" name="jobContact" required>

        <label for="jobDeadline">마감일</label>
        <input type="date" id="jobDeadline" name="jobDeadline" required>

        <input type="hidden" id="userId" name="userId" value="${principal.userId}" required>

        <!-- "작성 완료" 버튼 -->
        <input type="button"  id="writeBtn" value="작성 완료">
    </div>
<script>
    $("#writeBtn").click(() => {
            write();
        });

        function write() {
            let data = {
                    jobContentTitle: $("#jobContentTitle").val(),
                    jobContent: $("#jobContent").val(),
                    jobGenre: $("#jobGenre").val(),
                    jobArtTitle: $("#jobArtTitle").val(),
                    jobStartDate: $("#jobStartDate").val(),
                    jobProductionDate: $("#jobProductionDate").val(),
                    jobTo: $("#jobTo").val(),
                    jobField: $("#jobField").val(),
                    jobGender: $("#jobGender").val(),
                    jobContact: $("#jobContact").val(),
                    jobDeadline: $("#jobDeadline").val(),
                    userId: $("#userId").val(),
            };

              if (data.jobContentTitle.length<1) {
                alert("제목을 입력해주셔야 합니다.");
                return;
            }

            if (data.jobContent.length<1) {
                alert("내용을 입력해주셔야 합니다.");
                return;
            }

            $.ajax("/jobSearch/write", {
                type: "POST",
                dataType: "json",
                data: JSON.stringify(data),
                headers: {
                    "Content-Type": "application/json",
                },
            }).done((res) => {
                if (res.code == 1) {
                    alert(res.msg);
                    location.href = "/jobSearch/writeList";
                } else {
                    alert(res.msg);
                    return false;
                }
            });
            }
    </script>
</body>
</html>
