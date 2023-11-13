<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" href="/css/writePerformance.css" />
        <link rel="stylesheet" href="/css/default.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600&display=swap"
          rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link
          href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
          rel="stylesheet" />
        <link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
        <link href="//cdn.quilljs.com/1.3.6/quill.core.css" rel="stylesheet" />
        <script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
        <script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>

        <title>BusanMate with Write</title>
      </head>

      <body>
        <%@ include file="layout/header.jsp" %>
          <input type="hidden" value="${pf.pfId}" id="pfId">
          <div class="container">
            <div class="board_write_wrap">
              <div class="top">
                <div class="board_name">
                  <i class="fa-solid fa-feather-pointed"></i>
                  <h2>공연정보 수정하기</h2>
                  <input type="hidden" id="userId" value="${principal.userId}">
                </div>
                <div class="bt_wrap">
                  <a class="save" id="pfUpdateBtn">수정</a>
                  <a href="/performance/mainForm" class="cancel">취소</a>
                </div>
              </div>
              <div class="board_write">
                <div class="title">
                  <dl>
                    <dt>작품 제목</dt>
                    <dd>
                      <input type="text" value="${pf.pfTitle}" id="pfTitle" />
                    </dd>
                  </dl>
                </div>
                <div class="info">
                  <div class="left">
                    <div id="imagePreviewContainer">
                      <img id="imagePreview" alt="미리 보기 이미지"  src="/img/${pf.pfThumbnail}">
                    </div>
                    <input type="file" name="thumbnail" id="pfThumbnail" onchange="previewImage(event)" />
                  </div>
                  <div class="right">
                    <dl>
                      <dt>공연 기간</dt>
                      <dd>
                        <input class="date" type="date" id="pfStartDate" value="${pf.pfStartDate}" />부터
                        <input class="date" type="date" id="pfDeadline" value="${pf.pfDeadline}" />까지
                      </dd>
                    </dl>
                    <dl class="select">
                      <dt>관람 연령</dt>
                      <dd>
                        <div class="select_single">
                          <span class="btn-text" id="pfAgerating">${pf.pfAgerating}</span>
                          <span class="arrow-dwn">
                            <i class="fa-solid fa-chevron-down"></i>
                          </span>
                        </div>
                        <ul class="list-items">
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">전체관람가</span>
                          </li>
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">12세 이상</span>
                          </li>
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">15세 이상</span>
                          </li>
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">청소년 관람불가</span>
                          </li>
                        </ul>
                      </dd>
                    </dl>
                    <dl>
                      <dt>공연 시간</dt>
                      <dd>
                        <input type="number" id="pfRunningtime" value="${pf.pfRunningtime}" />
                      </dd>
                    </dl>
                    <dl>
                      <dt>예매 링크</dt>
                      <dd>
                        <input type="text" id="pfBookingmethod" value="${pf.pfBookingmethod}" />
                      </dd>
                    </dl>
                    <dl class="select">
                      <dt>작품 장르</dt>
                      <dd>
                        <div class="select_single">
                          <span class="btn-text" id="pfGenre">${pf.pfGenre}</span>
                          <span class="arrow-dwn">
                            <i class="fa-solid fa-chevron-down"></i>
                          </span>
                        </div>
                        <ul class="list-items">
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">단편영화</span>
                          </li>
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">장편영화</span>
                          </li>
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">연극</span>
                          </li>
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">드라마</span>
                          </li>
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">웹 컨텐츠</span>
                          </li>
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">광고</span>
                          </li>
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">전시</span>
                          </li>
                          <li class="single_item">
                            <span class="checkbox">
                              <i class="fa-solid fa-check check-icon"></i>
                            </span>
                            <span class="item-text">기타</span>
                          </li>
                        </ul>
                      </dd>
                    </dl>
                    <dl>
                      <dt>제 작</dt>
                      <dd>
                        <input type="text" id="pfProduction" value="${pf.pfProduction}" />
                      </dd>
                    </dl>
                    <dl>
                      <dt>가 격</dt>
                      <dd>
                        <input type="number" id="pfPrice" value="${pf.pfPrice}" />
                      </dd>
                    </dl>
                    <dl>
                      <dt>위 치</dt>
                      <dd>
                        <input type="text" id="pfLocation" value="${pf.pfLocation}" />
                      </dd>
                    </dl>
                  </div>
                </div>
                <div class="content">
                  <div id="editor-container">
                    ${pf.pfContent}
                  </div>
                </div>
              </div>
            </div>
          </div>

          <footer class="footer">
            <div class="left_cover"></div>
          </footer>

          <script src="https://kit.fontawesome.com/3f247b3389.js" crossorigin="anonymous"></script>
          <script src="/js/writePerformance.js"></script>
          <script src="/js/default.js"></script>
          <%@ include file="layout/footer.jsp" %>
      </body>

      </html>