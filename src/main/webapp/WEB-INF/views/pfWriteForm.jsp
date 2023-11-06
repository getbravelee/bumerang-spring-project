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

          <div class="container">
            <div class="board_write_wrap">
              <div class="top">
                <div class="board_name">
                  <i class="fa-solid fa-feather-pointed"></i>
                  <h2>공연정보 쓰기</h2>
                </div>
                <div class="bt_wrap">
                  <a href="viewPerformance.html" class="save">등록</a>
                  <a href="performance.html" class="cancel">취소</a>
                </div>
              </div>
              <div class="board_write">
                <div class="title">
                  <dl>
                    <dt>작품 제목</dt>
                    <dd>
                      <input type="text" placeholder="" value="" />
                    </dd>
                  </dl>
                </div>
                <div class="info">
                  <div class="left">
                    <input type="file" id="pf_img" />
                  </div>
                  <div class="right">
                    <dl>
                      <dt>공연 기간</dt>
                      <dd>
                        <input class="date" type="date" id="pf_start_date" value="" />부터
                        <input class="date" type="date" id="pf_deadline" value="" />까지
                      </dd>
                    </dl>
                    <dl>
                      <dt>관람 연령</dt>
                      <dd>
                        <div class="select_single">
                          <span class="btn-text">하나를 골라주세요</span>
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
                        <input type="number" id="pf_runningtime" value="" placeholder="00분" />
                      </dd>
                    </dl>
                    <dl>
                      <dt>예매 링크</dt>
                      <dd>
                        <input type="text" id="pf_bookingmethod" value="" placeholder="예매링크, 예매처 번호 등" />
                      </dd>
                    </dl>
                    <dl>
                      <dt>작품 장르</dt>
                      <dd>
                        <div class="select_single">
                          <span class="btn-text">하나를 골라주세요</span>
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
                            <span class="item-text">OTT/TV 드라마</span>
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
                        <input type="text" id="pf_production" value="" placeholder="제작자 또는 제작사" />
                      </dd>
                    </dl>
                    <dl>
                      <dt>가 격</dt>
                      <dd>
                        <input type="number" id="pf_price" value="" placeholder="00원" />
                      </dd>
                    </dl>
                    <dl>
                      <dt>위 치</dt>
                      <dd>
                        <input type="text" id="pf_location" value="" placeholder="공연장소" />
                      </dd>
                    </dl>
                  </div>
                </div>
                <div class="content">
                  <div id="editor-container"></div>
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
      </body>

      </html>