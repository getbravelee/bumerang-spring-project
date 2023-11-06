<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" href="/css/writeJobSearch.css" />
        <link rel="stylesheet" href="/css/default.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600&display=swap"
          rel="stylesheet" />
        <!-- JQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- AJax -->
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
          <div class="container">
            <div class="board_write_wrap">
              <div class="top">
                <div class="board_name">
                  <i class="fa-solid fa-feather-pointed"></i>
                  <h2>구인정보 쓰기</h2>
                  <input type="hidden" id="userId" value="${principal.userId}">
                </div>
                <div class="bt_wrap">
                  <a class="save" id="jobUpdateBtn">수정</a>
                  <a href="/jobSearch/mainForm" class="cancel">취소</a>
                </div>
              </div>
              <div class="board_write">
                <div class="title">
                  <dl>
                    <dt>제목</dt>
                    <dd>
                      <input type="text" value="${job.jobContentTitle}" id="jobContentTitle" />
                    </dd>
                  </dl>
                </div>
                <div class="info">
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
                          <span class="item-text jobGenre" data-value="단편영화">단편영화</span>
                        </li>
                        <li class="single_item">
                          <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text" value="장편영화" id="jobGenre">장편영화</span>
                        </li>
                        <li class="single_item">
                          <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text" value="연극" id="jobGenre">연극</span>
                        </li>
                        <li class="single_item">
                          <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text" value="OTT/TV 드라마" id="jobGenre">OTT/TV 드라마</span>
                        </li>
                        <li class="single_item">
                          <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text" value="웹 컨텐츠" id="jobGenre">웹 컨텐츠</span>
                        </li>
                        <li class="single_item">
                          <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text" value="광고" id="jobGenre">광고</span>
                        </li>
                        <li class="single_item">
                          <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text" value="전시" id="jobGenre">전시</span>
                        </li>
                        <li class="single_item">
                          <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text" value="기타" id="jobGenre">기타</span>
                        </li>
                      </ul>
                    </dd>
                    <!-- <dd>
                <select class="dropdown" name="genre" id="jobGenre">
                  <option value="단편영화">단편영화</option>
                  <option value="장편영화" selected>장편영화</option>
                  <option value="연극">연극</option>
                  <option value="OTT/TV 드라마">OTT/TV 드라마</option>
                  <option value="웹 컨텐츠">웹 컨텐츠</option>
                  <option value="광고">광고</option>
                  <option value="전시">전시</option>
                  <option value="기타">기타</option>
                </select>
              </dd> -->
                  </dl>
                  <dl class="art_title">
                    <dt>작품 제목</dt>
                    <dd>
                      <input type="text" id="jobArtTitle" value="${job.jobArtTitle}" />
                    </dd>
                  </dl>
                  <dl>
                    <dt>시작 예정</dt>
                    <dd><input type="date" value="${job.jobStartDate}" id="jobStartDate" /></dd>
                  </dl>
                  <dl>
                    <dt>예상 기간</dt>
                    <dd>
                      <input type="text" value="${job.jobProductionDate}" id="jobProductionDate" />
                    </dd>
                  </dl>
                  <dl>
                    <dt>모집 마감</dt>
                    <dd><input type="date" value="${job.jobDeadline}" id="jobDeadline" /></dd>
                  </dl>
                  <dl>
                    <dt>모집 인원</dt>
                    <dd>
                      <input type="number" value="${job.jobTo}" id="jobTo" />
                    </dd>
                  </dl>
                  <dl>
                    <dt>모집 분야</dt>
                    <dd>
                      <div class="select-btn">
                        <span class="btn-text">모두 골라주세요</span>
                        <span class="arrow-dwn">
                          <i class="fa-solid fa-chevron-down"></i>
                        </span>
                      </div>
                      <ul class="list-items">
                        <li class="item">
                          <span class="checkbox" name="jobPositionTitle" value="배우">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text">배우</span>
                        </li>
                        <li class="item">
                          <span class="checkbox" name="jobPositionTitle" value="연출">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text">연출</span>
                        </li>
                        <li class="item">
                          <span class="checkbox" name="jobPositionTitle" value="음향">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text">음향</span>
                        </li>
                        <li class="item">
                          <span class="checkbox" name="jobPositionTitle" value="카메라">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text">카메라</span>
                        </li>
                        <li class="item">
                          <span class="checkbox" name="jobPositionTitle" value="조명">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text">조명</span>
                        </li>
                        <li class="item">
                          <span class="checkbox" name="jobPositionTitle" value="작가">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text">작가</span>
                        </li>
                        <li class="item">
                          <span class="checkbox" name="jobPositionTitle" value="기타">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text">기타</span>
                        </li>
                      </ul>
                    </dd>
                  </dl>
                  <dl>
                    <dt>모집 성별</dt>
                    <dd>
                      <div class="select_single">
                        <span class="btn-text">성별을 골라주세요</span>
                        <span class="arrow-dwn">
                          <i class="fa-solid fa-chevron-down"></i>
                        </span>
                      </div>
                      <ul class="list-items">
                        <li class="single_item">
                          <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text" value="남성" id="jobGender">남성</span>
                        </li>
                        <li class="single_item">
                          <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text" value="여성" id="jobGender">여성</span>
                        </li>
                        <li class="single_item">
                          <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                          </span>
                          <span class="item-text" value="성별 무관" id="jobGender">성별 무관</span>
                        </li>
                      </ul>
                    </dd>
                  </dl>
                  <dl>
                    <dt>연락 방법</dt>
                    <dd>
                      <input type="text" id="jobContact" value="${job.jobContact}" />
                    </dd>
                  </dl>
                  <dl>
                    <dt>출 연 료</dt>
                    <dd>
                      <input type="text" id="jobPay" value="${job.jobPay}" />
                    </dd>
                  </dl>
                </div>
                <div class="content">
                  <div id="editor-container">"${job.jobContent}"</div>
                </div>
              </div>
            </div>
          </div>

          <footer class="footer">
            <div class="left_cover"></div>
          </footer>

          <script src="https://kit.fontawesome.com/3f247b3389.js" crossorigin="anonymous"></script>
          <script src="/js/writeJobSearch.js"></script>
          <script src="/js/default.js"></script>
      </body>

      </html>