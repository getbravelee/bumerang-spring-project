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
            <a href="/">
                <h1> 메인 페이지 </h1>
            </a>
            <h1>구인 상세보기</h1>
            <div>
                <label for="jobContentTitle">모집 제목</label>
                <p>${job.jobContentTitle}</p>

                <label for="jobContent">모집 내용</label>
                <p>${job.jobContent}</p>

                <label for="jobGenre">모집 장르</label>
                <p>${job.jobGenre}</p>

                <label for="jobArtTitle">작품 제목</label>
                <p>${job.jobArtTitle}</p>

                <label for="jobStartDate">모집 시작일</label>
                <p>${job.jobStartDate}</p>

                <label for="jobProductionDate">제작일</label>
                <p>${job.jobProductionDate}</p>

                <label for="jobTo">모집 인원</label>
                <p>${job.jobTo}</p>

                <label for="jobField">모집 분야</label>
                <p>${job.jobField}</p>

                <label for="jobGender">모집 성별</label>
                <p>${job.jobGender}</p>

                <label for="jobContact">연락방법</label>
                <p>${job.jobContact}</p>

                <label for="jobDeadline">마감일</label>
                <p>${job.jobDeadline}</p>

                <label for="createdAt">구인정보글 작성일</label>
                <p>${job.createdAt}</p>

                <label for="userNickname">작성자 닉네임</label>
                <p>${job.userNickname}</p>

                <label for="userProfileImg">작성자 프로필 이미지</label>
                <p>${job.userProfileImg}</p>

                <h1>게시글 추천 수: ${likeyCount}</h1>
                <h1>댓글 목록</h1>
                <table>
                    <thead>
                        <tr>
                            <th>댓글Id</th>
                            <th>댓글 내용</th>
                            <th>댓글 작성자 닉네임</th>
                            <th>댓글 작성자 프로필이미지</th>
                            <th>댓글 작성 시간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="comment" items="${commentList}">
                            <tr>
                                <td>${comment.commentId}</td>
                                <td>${comment.commentContent}</td>
                                <td>${comment.userNickname}</td>
                                <td>${comment.userProfileImg}</td>
                                <td>${comment.createdAt}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </body>

        </html>