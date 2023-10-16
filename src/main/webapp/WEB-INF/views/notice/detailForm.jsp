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
                <label for="noticeTitle">공지사항 제목</label>
                <p>${notice.noticeTitle}</p>


                <label for="noticeContent">공지사항 내용</label>
                <p>${notice.noticeContent}</p>

                <label for="createdAt">공지사항 작성일</label>
                <p>${notice.createdAt}</p>

                <label for="userNickname">작성자 닉네임</label>
                <p>${notice.userNickname}</p>

                <label for="userProfileImg">작성자 프로필 이미지</label>
                <p>${notice.userProfileImg}</p>
            </div>
        </body>

        </html>