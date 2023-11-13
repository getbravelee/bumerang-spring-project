<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <link rel="stylesheet" href="/css/performance.css">
                <link rel="stylesheet" href="/css/default.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600&display=swap"
                    rel="stylesheet">
                <link
                    href="https://fonts.googleapis.com/css?family=Material+Icons%7CMaterial+Icons+Outlined%7CMaterial+Icons+Two+Tone%7CMaterial+Icons+Round%7CMaterial+Icons+Sharp"
                    rel="stylesheet">

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

                <title>BusanMate with performance</title>
            </head>

            <body>
                <div class="loader">
                    <div class="loading">
                        <div class="load_text">
                            <h2>부산 <span class="accent">메이트</span><span class="accent2">랑</span></h2>
                        </div>
                        <label class="percent">100%</label>
                        <div class="progress-bar">
                            <div class="progress"></div>
                        </div>
                    </div>
                </div>
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

                    <div class="ranking_post">
                        <ul class="title_area">
                            <li><i class="fa-solid fa-fire"></i></li>
                            <li>
                                <h2>인기 전시 공연글</h2>
                            </li>
                        </ul>
                        <div class="top_list">
                            <c:forEach var="best" items="${bestPfList}">
                                <div class="top">

                                    <img class="medal" src="${best.imgPath}">
                                    <article class="poster">
                                        <div class="img"></div>
                                        <a href="/s/api/performance/detailForm/${best.pfId}">
                                            <img src="/img/${best.pfThumbnail}" class="img-hover">
                                        </a>
                                        <div class="info">
                                            <div class="badge">
                                                <c:if test="${best.pfGenre == '단편영화' || best.pfGenre == '장편영화'}">
                                                    <div class="category forMovie"><i class="fa-solid fa-clapperboard"></i> ${best.pfGenre}</div>
                                                </c:if>
                                                <c:if test="${best.pfGenre == '연극'}">
                                                    <div class="category forTheater"><i class="fa-solid fa-masks-theater"></i> ${best.pfGenre}</div>
                                                </c:if>
                                                <c:if test="${best.pfGenre == '드라마'}">
                                                    <div class="category forDrama"><i class="fa-solid fa-panorama"></i> ${best.pfGenre}</div>
                                                </c:if>
                                                <c:if test="${best.pfGenre == '웹 컨텐츠'}">
                                                    <div class="category forWebContent"><i class="fa-solid fa-icons"></i> ${best.pfGenre}</div>
                                                </c:if>
                                                <c:if test="${best.pfGenre == '광고'}">
                                                    <div class="category forAdvertising"><i class="fa-solid fa-video"></i> ${best.pfGenre}</div>
                                                </c:if>
                                                <c:if test="${best.pfGenre == '전시'}">
                                                    <div class="category forExhibition"><i class="fa-solid fa-palette"></i> ${best.pfGenre}</div>
                                                </c:if>
                                                <c:if test="${best.pfGenre == '기타'}">
                                                    <div class="category forEtc"><i class="fa-solid fa-paperclip"></i> ${best.pfGenre}</div>
                                                </c:if>
                                                <div class="age forAge">${best.pfAgerating}</div>
                                                <c:if test="${best.isPrice == true}">
                                                    <div class="charge">유료</div>
                                                </c:if>

                                                <c:if test="${best.isPrice == false}">
                                                    <div class="charge">무료</div>
                                                </c:if>
                                            </div>
                                            <h3 class="title">${best.pfTitle}</h3>
                                            <h4 class="location">${best.pfLocation}</h4>
                                            <h5 class="date">${best.pfStartDate} ~ ${best.pfDeadline}</h5>
                                        </div>
                                    </article>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="main_post">
                        <ul class="main_title">
                            <li><i class="fa-solid fa-compact-disc"></i></li>
                            <li>
                                <h2>전시 공연 정보</h2>
                            </li>
                        </ul>

                        <div class="filter">
                            <div class="search_bar">
                                <input type="text" id="filterText"
                                    placeholder="제목, 장르를 입력해보세요.">
                                <button><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </div>

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
                    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
                    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
                    <script src="/js/performance.js"></script>
                    <script src="/js/default.js"></script>

                    <%@ include file="layout/footer.jsp" %>
            </body>

            </html>