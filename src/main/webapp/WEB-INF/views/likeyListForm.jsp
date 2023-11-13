<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" href="/css/myLikey.css" />
        <link rel="stylesheet" href="/css/default.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600&display=swap"
          rel="stylesheet" />
        <link
          href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
          rel="stylesheet" />

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <title>BusanMate with Write</title>
      </head>

      <body>
        <%@ include file="layout/header.jsp" %>
          <div class="write_title">

            <h2>내 관심 글 목록</h2>
          </div>

          <div class="main_post">
            <ul class="main_title">
              <li><i class="fa-solid fa-rocket"></i></li>
              <li>
                <h2>구인 정보 관심 목록</h2>
              </li>
            </ul>

            <!-- 구인글 및 페이지네이션 -->
            <div class="search_job_container">
              <c:forEach var="job" items="${jobList}">
                <input id="jobId" type="hidden" value="${job.jobId}" />
                <input id="userId" type="hidden" value="${principal.userId}" />

                <div class="search_job_slide">
                  <c:if test="${job.isDead}">
                    <img src="/image/deadline.png" class="deadline">
                  </c:if>
                  <div class="project">
                    <div class="badge_wrapper">
                      <c:choose>
                        <c:when test="${job.jobGenre == '장편영화'}">
                          <!-- 장편영화 장르일 때 -->
                          <div class="badge_movie">
                            <i class="fa-solid fa-clapperboard"></i>
                            <p>장편영화</p>
                          </div>
                          <c:if test="${job.isToday}">
                            <!-- 새로 올라온 글일 때 -->
                            <div class="badge_new">
                              <i class="fa-solid fa-gift"> 새로 올라온 글</i>
                            </div>
                          </c:if>
                        </c:when>
                        <c:when test="${job.jobGenre == '단편영화'}">
                          <!-- 단편영화 장르일 때 -->
                          <div class="badge_movie">
                            <i class="fa-solid fa-clapperboard"></i>
                            <p>단편영화</p>
                          </div>
                          <c:if test="${job.isToday}">
                            <!-- 새로 올라온 글일 때 -->
                            <div class="badge_new">
                              <i class="fa-solid fa-gift"></i>
                              <p>새로 올라온 글</p>
                            </div>
                          </c:if>
                        </c:when>
                        <c:when test="${job.jobGenre == '연극'}">
                          <!-- 연극 장르일 때 -->
                          <div class="badge_theater">
                            <i class="fa-solid fa-masks-theater"></i>
                            <p>연극</p>
                          </div>
                          <c:if test="${job.isToday}">
                            <!-- 새로 올라온 글일 때 -->
                            <div class="badge_new">
                              <i class="fa-solid fa-gift"> 새로 올라온 글</i>
                            </div>
                          </c:if>
                        </c:when>
                        <c:when test="${job.jobGenre == '드라마'}">
                          <!-- 드라마 장르일 때 -->
                          <div class="badge_drama">
                            <i class="fa-solid fa-panorama"></i>
                            <p>드라마</p>
                          </div>
                          <c:if test="${job.isToday}">
                            <!-- 새로 올라온 글일 때 -->
                            <div class="badge_new">
                              <i class="fa-solid fa-gift"> 새로 올라온 글</i>
                            </div>
                          </c:if>
                        </c:when>
                        <c:when test="${job.jobGenre == '웹 컨텐츠'}">
                          <!-- 웹 컨텐츠 장르일 때 -->
                          <div class="badge_web_content">
                            <i class="fa-solid fa-icons"></i>
                            <p>웹 컨텐츠</p>
                          </div>
                          <c:if test="${job.isToday}">
                            <!-- 새로 올라온 글일 때 -->
                            <div class="badge_new">
                              <i class="fa-solid fa-gift"> 새로 올라온 글</i>
                            </div>
                          </c:if>
                        </c:when>
                        <c:when test="${job.jobGenre == '광고'}">
                          <!-- 광고 장르일 때 -->
                          <div class="badge_advertising">
                            <i class="fa-solid fa-video"></i>
                            <p>광고</p>
                          </div>
                          <c:if test="${job.isToday}">
                            <!-- 새로 올라온 글일 때 -->
                            <div class="badge_new">
                              <i class="fa-solid fa-gift"> 새로 올라온 글</i>
                            </div>
                          </c:if>
                        </c:when>
                        <c:when test="${job.jobGenre == '전시'}">
                          <!-- 전시 장르일 때 -->
                          <div class="badge_exhibition">
                            <i class="fa-solid fa-palette"></i>
                            <p>전시</p>
                          </div>
                          <c:if test="${job.isToday}">
                            <!-- 새로 올라온 글일 때 -->
                            <div class="badge_new">
                              <i class="fa-solid fa-gift"> 새로 올라온 글</i>
                            </div>
                          </c:if>
                        </c:when>
                        <c:when test="${job.jobGenre == '기타'}">
                          <!-- 기타 장르일 때 -->
                          <div class="badge_movie">
                            <i class="fa-solid fa-paperclip"></i>
                            <p>기타</p>
                          </div>
                          <c:if test="${job.isToday}">
                            <!-- 새로 올라온 글일 때 -->
                            <div class="badge_new">
                              <i class="fa-solid fa-gift"> 새로 올라온 글</i>
                            </div>
                          </c:if>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                      </c:choose>
                    </div>

                    <div class="schedule">
                      <p>마감일 | </p>
                      <p>${job.jobDeadline}</p>
                    </div>

                    <h1 class="project_title">
                      ${job.jobContentTitle}
                    </h1>

                    <ul class="position_list">
                      <c:forEach var="position" items="${job.jobPositionTitle}">
                        <li class="position">
                          ${position.jobPositionTitle}
                        </li>
                      </c:forEach>
                    </ul>

                    <div class="content">
                      <div class="more_btn">
                        <p><a href="/s/api/jobSearch/detailForm/${job.jobId}">자세히보기</a></p>
                        <i class="fa-solid fa-arrow-up-right-from-square"></i>
                      </div>
                    </div>

                    <div class="border"></div>

                    <div class="myinfo">
                      <div class="user_info">
                        <a href="/s/api/user/detailForm/${job.userId}" style="display: flex;">
                          <div>
                            <c:choose>
                              <c:when test="${job.userProfileImg==null}">
                                <img class="icon" src="/image/noProfileImg.jpg" />
                              </c:when>
                              <c:otherwise><img class="icon" src="/img/${job.userProfileImg}">
                              </c:otherwise>
                            </c:choose>
                          </div>
                          <div class="nickname">
                            <span class="accent">${job.userCareer}</span>
                            <p>${job.userNickname}</p>
                          </div>
                        </a>
                      </div>

                      <div class="viewAndInfo">
                        <div class="like">
                          <i class="fa-regular fa-heart"> ${job.likeyCount}</i>
                        </div>
                        <div class="comment">
                          <i class="fa-regular fa-comment"> ${job.commentCount}</i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
              <!-- 여기까지만 복사 -->
            </div>

            <div class="pagination">
              <!--<li class="page-item previous-page disable"><a class="page-link" href="#">Prev</a></li>
      <li class="page-item current-page active"><a class="page-link" href="#">1</a></li>
      <li class="page-item dots"><a class="page-link" href="#">...</a></li>
      <li class="page-item current-page"><a class="page-link" href="#">5</a></li>
      <li class="page-item current-page"><a class="page-link" href="#">6</a></li>
      <li class="page-item dots"><a class="page-link" href="#">...</a></li>
      <li class="page-item current-page"><a class="page-link" href="#">10</a></li>
      <li class="page-item next-page"><a class="page-link" href="#">Next</a></li>-->
            </div>
          </div>

          <div class="main_post2">
            <ul class="main_title">
              <li><i class="fa-solid fa-rocket"></i></li>
              <li>
                <h2>전시·공연 관심 목록</h2>
              </li>
            </ul>

            <!-- 전시 공연 정보 -->
            <section class="poster_wrapper">
              <c:forEach var="pf" items="${pfList}">
                <article class="poster search">
                  <div class="img"></div>
                  <a href="/s/api/performance/detailForm/${pf.pfId}">
                    <c:if test="${pf.isDead}">
                      <img src="/image/deadlinePf.png" class="deadline">
                    </c:if>
                    <img src="/img/${pf.pfThumbnail}" class="img-hover">
                  </a>
                  <div class="info">
                    <div class="badge">
                      <c:if test="${pf.pfGenre == '단편영화' || pf.pfGenre == '장편영화'}">
                        <div class="category forMovie"><i class="fa-solid fa-clapperboard"></i> ${pf.pfGenre}</div>
                      </c:if>
                      <c:if test="${pf.pfGenre == '연극'}">
                        <div class="category forTheater"><i class="fa-solid fa-masks-theater"></i> ${pf.pfGenre}</div>
                      </c:if>
                      <c:if test="${pf.pfGenre == '드라마'}">
                        <div class="category forDrama"><i class="fa-solid fa-panorama"></i> ${pf.pfGenre}</div>
                      </c:if>
                      <c:if test="${pf.pfGenre == '웹 컨텐츠'}">
                        <div class="category forWebContent"><i class="fa-solid fa-icons"></i> ${pf.pfGenre}</div>
                      </c:if>
                      <c:if test="${pf.pfGenre == '광고'}">
                        <div class="category forAdvertising"><i class="fa-solid fa-video"></i> ${pf.pfGenre}</div>
                      </c:if>
                      <c:if test="${pf.pfGenre == '전시'}">
                        <div class="category forExhibition"><i class="fa-solid fa-palette"></i> ${pf.pfGenre}</div>
                      </c:if>
                      <c:if test="${pf.pfGenre == '기타'}">
                        <div class="category forEtc"><i class="fa-solid fa-paperclip"></i> ${pf.pfGenre}</div>
                      </c:if>
                      <div class="age forAge">${pf.pfAgerating}</div>
                      <c:if test="${pf.isPrice == true}">
                        <div class="charge">유료</div>
                      </c:if>
                      <c:if test="${pf.isPrice == false}">
                        <div class="charge">무료</div>
                      </c:if>
                    </div>
                    <h3 class="title">${pf.pfTitle}</h3>
                    <h4 class="location">${pf.pfLocation}</h4>
                    <h5 class="date">${pf.pfStartDate} ~ ${pf.pfDeadline}</h5>
                    <c:if test="${pf.isDead == true}">
                      <div class="opening" hidden>상영중</div>
                    </c:if>
                    <c:if test="${pf.isDead == false}">
                      <div class="opening" hidden>상영마감</div>
                    </c:if>
                  </div>
                </article>
              </c:forEach>
            </section>
            <div class="pagination2">
              <!--<li class="page-item previous-page disable"><a class="page-link" href="#">Prev</a></li>
  <li class="page-item current-page active"><a class="page-link" href="#">1</a></li>
  <li class="page-item dots"><a class="page-link" href="#">...</a></li>
  <li class="page-item current-page"><a class="page-link" href="#">5</a></li>
  <li class="page-item current-page"><a class="page-link" href="#">6</a></li>
  <li class="page-item dots"><a class="page-link" href="#">...</a></li>
  <li class="page-item current-page"><a class="page-link" href="#">10</a></li>
  <li class="page-item next-page"><a class="page-link" href="#">Next</a></li>-->
            </div>

          </div>

          <footer class="footer">
            <div class="left_cover"></div>
          </footer>

          <script src="https://kit.fontawesome.com/3f247b3389.js" crossorigin="anonymous"></script>
          <script src="/js/myLikey.js"></script>
          <script src="/js/default.js"></script>
          <%@ include file="layout/footer.jsp" %>
      </body>

      </html>