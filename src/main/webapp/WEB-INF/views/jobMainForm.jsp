<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <link rel="stylesheet" href="/css/main.css">
                <link rel="stylesheet" href="/css/default.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600&display=swap"
                    rel="stylesheet">
                <link
                    href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
                    rel="stylesheet">

                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
                <!-- JQuery -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                <!-- AJax -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
                <title>BusanMate with culture</title>
            </head>

            <body>
                <%@ include file="layout/header.jsp" %>
                    <div class="banner">
                        <swiper-container class="banner_Swiper" pagination="true" pagination-clickable="true"
                            space-between="30" centered-slides="true" autoplay-delay="4000"
                            autoplay-disable-on-interaction="false" loop="true">
                            <swiper-slide class="banner_slide1"><img src="/image/banner1.png"></swiper-slide>
                            <swiper-slide class="banner_slide2"><img src="/image/banner2.png"></swiper-slide>
                            <swiper-slide class="banner_slide3"><img src="/image/banner3.png"></swiper-slide>
                        </swiper-container>
                    </div>

                    <div class="hot_post">
                        <div class="title_area">
                            <ul class="hot_title">
                                <li><i class="fa-solid fa-fire"></i></li>
                                <li>
                                    <h2>부메랑 인기 구인글</h2>
                                </li>
                            </ul>

                            <p class="push">← ← 글을 옆으로 밀어보세요</p>
                        </div>

                        <swiper-container class="hot_swiper" space-between="30" init="false">
                            <c:forEach var="job" items="${bestJobList}">
                                <input id="jobId" type="hidden" value="${job.jobId}" />
                                <input id="userId" type="hidden" value="${principal.userId}" />
                                <swiper-slide>
                                    <div class="project">
                                        <div class="badge_wrapper">
                                            <div class="badge_movie">
                                                <i class="fa-solid fa-clapperboard"> ${job.jobGenre}</i>
                                            </div>
                                            <c:if test="${job.isToday}">
                                                <div class="badge_new">
                                                    <i class="fa-solid fa-gift"> 새로 올라온 글</i>
                                                </div>
                                            </c:if>
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
                                                <p><a href="/s/api/jobSearch/detailForm/${job.jobId}">자세히보기</a> </p>
                                                <i class="fa-solid fa-arrow-up-right-from-square"></i>
                                            </div>
                                            <div class="like_btn">
                                                추천수: ${job.likeyCount}
                                            </div>
                                        </div>

                                        <div class="border"></div>

                                        <div class="myinfo">
                                            <div class="user_info">
                                                <a href="/s/api/user/detailForm/${job.userId}" style="display: flex;">
                                                    <div>
                                                        <img class="icon" src="/img/${job.userProfileImg}">

                                                    </div>
                                                    <div class="nickname">
                                                        <span class="accent">${job.userCareer}</span>
                                                        <p>${job.userNickname}</p>
                                                    </div>
                                                </a>
                                            </div>

                                            <div class="viewAndInfo">
                                                <div class="view">
                                                    <i class="fa-regular fa-eye">${job.viewCount}</i>
                                                </div>
                                                <div class="comment">
                                                    <i class="fa-regular fa-comment">${job.commentCount}</i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </swiper-slide>
                            </c:forEach>
                        </swiper-container>
                    </div>

                    <div class="main_post">
                        <ul class="main_title">
                            <li><i class="fa-solid fa-rocket"></i></li>
                            <li>
                                <h2>부메랑 구인 목록</h2>
                            </li>
                        </ul>

                        <div class="filter">
                            <div class="dropdown_list">
                                <select id="filterGenre" onchange="filterPosts()" class="dropdown">
                                    <option value="all">장르</option>
                                    <option value="영화">영화</option>
                                    <option value="연극">연극</option>
                                    <option value="뮤지컬">뮤지컬</option>
                                    <option value="전시/행사">전시/행사</option>
                                </select>

                                <select id="filterPosition" onchange="filterPosts()" class="dropdown">
                                    <option value="all">분야</option>
                                    <option value=“배우“>배우</option>
                                    <option value=“연출“>연출</option>
                                    <option value=“음향“>음향</option>
                                    <option value=“카메라“>카메라</option>
                                    <option value=“조명“>조명</option>
                                    <option value=“작가“>작가</option>
                                    <option value=“기타“>기타</option>
                                </select>

                                <select id="filterGender" onchange="filterPosts()" class="dropdown">
                                    <option value="all">성별</option>
                                    <option value="남자">남자</option>
                                    <option value="여자">여자</option>
                                    <option value="성별무관">성별무관</option>
                                </select>

                                <select id="filterOpening" onchange="filterPosts()" class="dropdown">
                                    <option value="all">모집 여부</option>
                                    <option value="모집중">모집중</option>
                                    <option value="모집 마감">모집 마감</option>
                                </select>
                            </div>
                            <div class="search_bar">
                                <input type="text" id="filterText" oninput="filterSearch()"
                                    placeholder="제목, 닉네임을 입력해보세요.">
                                <button><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </div>

                        <!-- 구인글 및 페이지네이션 -->
                        <div class="search_job_container">
                            <!--해당 부분부터 게시글 목록 (더미데이터)-->
                            <c:forEach var="job" items="${jobList}">
                                <input id="jobId" type="hidden" value="${job.jobId}" />
                                <input id="userId" type="hidden" value="${principal.userId}" />

                                <div class="search_job_slide">
                                    <div class="project">
                                        <div class="badge_wrapper">
                                            <div class="badge_movie">
                                                <i class="fa-solid fa-clapperboard"></i>
                                                <p class="badge_genre">${job.jobGenre}</p>
                                            </div>
                                            <c:if test="${job.isToday}">
                                                <div class="badge_new">
                                                    <i class="fa-solid fa-gift"> 새로 올라온 글</i>
                                                </div>
                                            </c:if>
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
                                                <p><a href="/s/api/jobSearch/detailForm/${job.jobId}">자세히보기</a> </p>
                                                <i class="fa-solid fa-arrow-up-right-from-square"></i>
                                            </div>
                                            <div class="like_btn">
                                                추천수: ${job.likeyCount}
                                            </div>
                                        </div>

                                        <div class="border"></div>

                                        <div class="myinfo">
                                            <div class="user_info">
                                                <div>
                                                    <a href="/s/api/user/detailForm/${job.userId}">
                                                        <img class="icon" src="/img/${job.userProfileImg}">
                                                    </a>
                                                </div>
                                                <div class="nickname">
                                                    <span class="accent">${job.userCareer}</span>
                                                    <p>${job.userNickname}</p>
                                                </div>
                                            </div>

                                            <div class="viewAndInfo">
                                                <div class="view">
                                                    <i class="fa-regular fa-eye">${job.viewCount}</i>
                                                </div>
                                                <div class="comment">
                                                    <i class="fa-regular fa-comment">${job.commentCount}</i>
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


                    <footer class="footer">
                        <div class="left_cover"></div>
                    </footer>

                    <script src="https://kit.fontawesome.com/3f247b3389.js" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-element-bundle.min.js"></script>
                    <script src="/js/default.js"></script>
                    <script src="/js/main.js"></script>

            </body>

            </html>