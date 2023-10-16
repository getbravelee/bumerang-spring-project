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
                        <th>상세보기</th>
                        <th>모집 제목</th>
                        <th>모집 내용</th>
                        <th>모집 장르</th>
                        <th>작품 제목</th>
                        <th>모집 시작일</th>
                        <th>제작일</th>
                        <th>모집 인원</th>
                        <th>모집 분야</th>
                        <th>모집 성별</th>
                        <th>연락방법</th>
                        <th>마감일</th>
                        <th>작성자 userId</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="jobSearch" items="${jobSearchList}">
                        <tr>
                            <td><a href="/jobSearch/detailForm/${jobSearch.jobId}">${jobSearch.jobId}이동하기</a></td>
                            <td>${jobSearch.jobContentTitle}</td>
                            <td>${jobSearch.jobContent}</td>
                            <td>${jobSearch.jobGenre}</td>
                            <td>${jobSearch.jobArtTitle}</td>
                            <td>${jobSearch.jobStartDate}</td>
                            <td>${jobSearch.jobProductionDate}</td>
                            <td>${jobSearch.jobTo}</td>
                            <td>${jobSearch.jobField}</td>
                            <td>${jobSearch.jobGender}</td>
                            <td>${jobSearch.jobContact}</td>
                            <td>${jobSearch.jobDeadline}</td>
                            <td>${jobSearch.userId}</td>
                            <td>
                                <a href="/jobSearch/updateForm/${jobSearch.jobId}" class="btn btn-warning">수정</a>
                            </td>
                            <td>
                                <form action="/jobSearch/delete/${jobSearch.jobId}" method="post"
                                    onsubmit="return confirmDelete()">
                                    <button type="submit" class="btn btn-danger">
                                        삭제
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <script>
                function confirmDelete() {
                    return confirm("정말 삭제하시겠습니까?");
                }
            </script>

        </body>

        </html>