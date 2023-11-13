<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://kit.fontawesome.com/bfb14eb01e.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="/css/default.css" />
        <link rel="stylesheet" href="/css/writeNotice.css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600&display=swap"
          rel="stylesheet">
        <link
          href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
          rel="stylesheet">
        <link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
        <link href="//cdn.quilljs.com/1.3.6/quill.core.css" rel="stylesheet" />
        <!-- JQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- AJax -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
        <script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>
        <title>공지사항</title>
      </head>

      <body>
        <%@ include file="layout/header.jsp" %>

          <input type="hidden" value="${principal.userId}" id="userId">
          <div class="container">
            <div class="board_write_wrap">
              <div class="top">
                <div class="board_name">
                  <i class="fa-solid fa-bullhorn"></i>
                  <h2>공지사항</h2>
                </div>
                <div class="bt_wrap">
                  <a class="save" id="noticeWriteBtn">등록</a>
                  <a href="/jobSearch/mainForm" class="cancel">취소</a>
                </div>
              </div>
              <div class="board_write">
                <div class="info">
                  <dl class="title">
                    <dt>제목</dt>
                    <dd>
                      <input type="text" placeholder="글 제목을 입력하세요" id="noticeTitle" maxlength="30" />
                    </dd>
                  </dl>
                  <dl class="type">
                    <dt>공지 유형</dt>
                    <dd>
                      <select id="noticeType">
                        <option>유형 선택</option>
                        <option value="컨텐츠 공지">컨텐츠 공지</option>
                        <option value="서비스 공지">서비스 공지</option>
                      </select>
                    </dd>
                  </dl>
                </div>
                <div class="content">
                  <div id="editor-container" id="noticeContent" ></div>
                </div>
              </div>

            </div>
          </div>
          <script src="/js/writeNotice.js"></script>
          <script src="/js/default.js"></script>
          <%@ include file="layout/footer.jsp" %>
      </body>

      </html>