<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" href="/css/viewJobSearch.css" />
        <link rel="stylesheet" href="/css/default.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600&display=swap"
          rel="stylesheet" />
        <link
          href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
          rel="stylesheet" />
        <!-- JQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- AJax -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <title>BusanMate with Write</title>
      </head>

      <body>
        <%@ include file="layout/header.jsp" %>
          <input type="hidden" id="jobId" value="${job.jobId}">
          <input type="hidden" id="jobUserId" value="${job.userId}"><!--작성자 ID-->
          <input type="hidden" id="userId" value="${principal.userId}"><!--추천자 ID-->
          <input type="hidden" id="likeyId" value="${job.likeyId}">
          <div class="pf_container">
            <div class="pf_title_area">
              <div class="pf_display">
                <div class="myinfo">
                  <h1 class="pf_title">
                    ${job.jobContentTitle}
                  </h1>
                  <div class="pf_label">
                    <div class="user_info">
                      <a href="/s/api/user/detailForm/${job.userId}" style="display: flex;">
                        <img class="pf_img" src="/img/${job.userProfileImg}" />
                        <p class="pf_nickname">${job.userNickname}</p>
                      </a>
                      <p class="line">|</p>
                      <p class="pf_creation_date">
                        <fmt:formatDate value="${job.createdAt}" pattern="yyyy-MM-dd" />
                      </p>
                    </div>

                    <div class="pf_status">
                      <i class="fa-solid fa-eye"></i>
                      <p class="view_count">${job.viewCount}</p>
                      <i id="iconLove"
                        class='${job.isLikey ? "fa-solid" : "fa-regular"} fa-heart my_pointer my_red'></i>
                      <p class="like_count" id="countLikey">${job.likeyCount}</p>

                      <p class="report"><img src="/image/siren.png" /><button class='jobReportBtn'>신고하기</button></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="border"></div>

            <div class="pf_info">
              <div class="column">
                <ul class="detail_info">
                  <li>
                    <span class="accent">작품명</span>
                    <p>${job.jobArtTitle}</p>
                  </li>
                  <li>
                    <span class="accent">작품 장르</span>
                    <p>${job.jobGenre}</p>
                  </li>

                  <li>
                    <span class="accent">시작 예정일</span>
                    <p>${job.jobStartDate}</p>
                  </li>

                  <li>
                    <span class="accent">모집 인원</span>
                    <p>${job.jobTo}</p>
                  </li>

                  <li>
                    <span class="accent">모집 성별</span>
                    <p>${job.jobGender}</p>
                  </li>

                  <li>
                    <span class="accent">연락 방법</span>
                    <p>${job.jobContact}</p>
                  </li>

                  <li>
                    <span class="accent">모집 분야</span>
                    <p>${job.jobPositionTitles}</p>
                  </li>

                  <li>
                    <span class="accent">마감일</span>
                    <p>${job.jobDeadline}</p>
                  </li>
                  <li>
                    <span class="accent">제작 기간</span>
                    <p>${job.jobProductionDate}</p>
                  </li>
                  <li>
                    <span class="accent">출연료</span>
                    <p>${job.jobPay}</p>
                  </li>
                </ul>

                <div class="pf_intro">
                  <h4>구인글 소개</h4>
                  <div class="border"></div>
                  <textarea readonly class="introduce textarea">
                    ${job.jobContent}
                  </textarea>
                </div>
              </div>
            </div>
            <c:if test="${principal.userId == job.userId}">
              <div class="button_wrap">
                <button type="button" class="edit_btn"><a
                    href="/s/api/jobSearch/updateForm/${job.jobId}">수정</a></button>
                <button type="button" class="delete_btn">삭제</button>
                <div class="delete_confirm">
                  <h2 class="pro_tit">정말로 삭제하시겠습니까?</h2>
                  <div>
                    <button id="confirmDelete">삭제</button>
                    <button id="closeDelete">닫기</button>
                  </div>
                </div>
              </div>
            </c:if>

            <div class="comment_container center_display">
              <!-- 댓글 작성부 여기부터 -->
              <div class="top">
                <form>
                  <div class="write_comment">
                    <div class="comment_img center_display">
                      <img src="/img/${principal.userProfileImg}" alt="image" />
                    </div>
                    <div class="form_info center_display">
                      <input type="hidden" name="user" id="user" value="김휴고" />
                      <textarea type="text" name="comment" id="comment" placeholder="댓글을 입력하세요"></textarea>
                    </div>
                  </div>
                  <button type="button" class="submit_btn">등록</button>
                </form>
              </div>
              <!-- 여기까지 -->

              <div class="comments_container center_display">
                <!-- 댓글이 달리는 부분 -->
                <c:forEach var="comment" items="${job.commentList}">
                  <div class="comment_card">
                    <div class="comment_top">
                      <div class="comment_info">
                        <div class="pic center_display">
                          <img src="/img/${comment.userProfileImg}" alt="image" />
                        </div>
                        <div class="comment_info_txt">
                          <p class="nickname">
                            ${comment.userNickname}
                          </p>
                          <p class="created_date">${comment.createdAt}</p>
                        </div>
                      </div>
                      <div class="comment_btns">
                        <button class='editBtn'>수정</button>
                        <button class='removeBtn'>삭제</button>
                        <button class='reportBtn'>신고하기</button>
                      </div>
                    </div>
                    <textarea class="comment textarea" readonly>${comment.commentContent}</textarea>
                  </div>
                </c:forEach>
              </div>
            </div>

            <footer class="footer">
              <div class="left_cover"></div>
            </footer>

            <script src="https://kit.fontawesome.com/3f247b3389.js" crossorigin="anonymous"></script>
            <script src="/js/viewJobSearch.js"></script>
            <script src="/js/default.js"></script>
      </body>

      </html>