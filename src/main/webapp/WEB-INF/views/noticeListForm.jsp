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
        <link rel="stylesheet" href="/css/notice.css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600&display=swap"
          rel="stylesheet" />
        <link
          href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
          rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <title>공지사항</title>
      </head>

      <body>
        <!-- 헤더 -->
        <%@ include file="layout/header.jsp" %>

          <div class="container">
            <div class="board_list_wrap">
              <div class="top">
                <div class="board_name">
                  <i class="fa-solid fa-bullhorn"></i>
                  <h2>공지사항</h2>
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
                  <c:forEach var="notice" items="${noticeList}">
                    <tr class="notice_slide">
                      <td>${notice.noticeType}</td>
                      <td class="tit">
                        <a href="/notice/detailForm/${notice.noticeId}">${notice.noticeTitle}</a>
                      </td>
                      <td>
                        <fmt:formatDate value="${notice.createdAt}" pattern="yyyy-MM-dd" />
                      </td>

                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <!-- 글목록 하단 -->
              <div class="board_bot">
                <!-- 페이지네이션 -->
                <div class="pagination"></div>
              </div>
            </div>
          </div>
          <script src="/js/notice.js"></script>
          <script src="/js/default.js"></script>
      </body>

      </html>