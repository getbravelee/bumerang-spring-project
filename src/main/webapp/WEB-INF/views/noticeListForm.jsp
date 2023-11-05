<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://kit.fontawesome.com/bfb14eb01e.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="/css/default.css">
        <link rel="stylesheet" href="/css/notice.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600&display=swap"
          rel="stylesheet">
        <link
          href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
          rel="stylesheet">
        <!-- JQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- AJax -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <title>공지사항</title>
      </head>

      <body>
        <%@ include file="layout/header.jsp" %>
          <div class="container">
            <div class="board_list_wrap">
              <div class="top">
                <div class="board_name">
                  <i class="fa-solid fa-bullhorn"></i>
                  <h2>공지사항</h2>
                </div>
                <!-- 검색창 -->
                <div class="search_bar">
                  <input id='filterText' type="text" placeholder="검색어를 입력하세요" />
                  <button><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
              </div>
              <table class="board_list">
                <!-- 게시판 목록 -->
                <thead>
                  <tr>
                    <th class="type">공지 종류</th>
                    <th>제목</th>
                    <th class="created_at">작성일</th>
                  </tr>
                </thead>
                <tbody class="contents_list">
                  <c:forEach items="${noticeList}" var="notice">
                    <td class="notice_type">컨텐츠 공지</td>
                    <td class="notice_title"><a href="viewNotice.html">여기에 제목이 표시됩니다.</a></td>
                    <td class="created_at">23.10.22.</td>
                  </c:forEach>
              </table>
              <!-- 글목록 하단 -->
              <div class="board_bot">
                <!-- 페이지네이션 -->
                <div class="paging"></div>
                <!-- 글쓰기 버튼 -->
                <a class="write active" href="writeNotice.html">공지 쓰기</a>
              </div>
            </div>
          </div>
          <script src="/js/notice.js"></script>
          <script src="/js/default.js"></script>
      </body>

      </html>