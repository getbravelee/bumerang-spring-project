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
            <h1>구인글 인기글 목록</h1>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>모집글 순위</th>
                        <th>조회수</th>
                        <th>모집 장르</th>
                        <th>모집 제목</th>
                        <th>마감일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="bsetJob" items="${bestJobList}">
                        <tr>
                            <td>${bsetJob.jobRank}</td>
                            <td>${bsetJob.jobView}</td>
                            <td>${bsetJob.jobGenre}</td>
                            <td>${bsetJob.jobContentTitle}</td>
                            <td>${bsetJob.jobDeadline}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h1>구인글 전체 목록</h1>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>모집 장르</th>
                        <th>모집 제목</th>
                        <th>마감일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="job" items="${jobList}">
                        <tr>
                            <td>${job.jobGenre}</td>
                            <td>${job.jobContentTitle}</td>
                            <td>${job.jobDeadline}</td>
                            <td>${job.jobView}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </body>

        </html>