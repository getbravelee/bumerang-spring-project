<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <title>구인 작성</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        </head>

        <body>
            <header style="background-color: #333;color: #fff;padding: 20px 0;text-align: center;">
                <a href="/" style="text-decoration: none; outline: none ">
                    <h1>메인 페이지</h1>
                </a>
            </header>
            <h1>구인글 목록</h1>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>공지사항Id</th>
                        <th>공지사항 유형</th>
                        <th>공지사항 제목</th>
                        <th>공지사항 작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="notice" items="${noticeList}">
                        <tr>
                            <td><a href="/notice/detailForm/${notice.noticeId}">${notice.noticeId}이동하기</a></td>
                            <td>${notice.noticeTitle}</td>
                            <td>${notice.noticeContent}</td>
                            <td>${notice.noticeType}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </body>

        </html>