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

                label,
                input,
                select,
                textarea {
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
            <a href="/">
                <h1> 메인 페이지 </h1>
            </a>
            <h1>구인 작성</h1>
            <div>
                <label for="noticeTitle">공지사항 제목</label>
                <input type="text" id="noticeTitle" name="noticeTitle" required>

                <label for="noticeContent">공지사항 내용</label>
                <textarea id="noticeContent" name="noticeContent" rows="4" required></textarea>

                <label for="noticeType">공지사항 유형</label>
                <select id="noticeType" name="noticeType">
                    <option value="컨텐츠 공지">컨텐츠 공지</option>
                    <option value="서비스 공지">서비스 공지</option>
                </select>

                <input type="hidden" id="userId" name="userId" value="${principal.userId}" required>

                <!-- "작성 완료" 버튼 -->
                <input type="button" id="writeBtn" value="작성 완료">
            </div>
            <script>
                $("#writeBtn").click(() => {
                    write();
                });

                function write() {
                    let data = {
                        noticeTitle: $("#noticeTitle").val(),
                        noticeContent: $("#noticeContent").val(),
                        noticeType: $("#noticeType").val(),
                        userId: $("#userId").val()
                    };

                    if (data.noticeTitle.length < 1) {
                        alert("제목을 입력해주셔야 합니다.");
                        return;
                    }

                    if (data.noticeContent.length < 1) {
                        alert("내용을 입력해주셔야 합니다.");
                        return;
                    }

                    $.ajax("/notice/write", {
                        type: "POST",
                        dataType: "json",
                        data: JSON.stringify(data),
                        headers: {
                            "Content-Type": "application/json",
                        },
                    }).done((res) => {
                        if (res.code == 1) {
                            alert(res.msg);
                            location.href = "/notice/writeList";
                        } else {
                            alert(res.msg);
                            return false;
                        }
                    });
                }
            </script>
        </body>

        </html>