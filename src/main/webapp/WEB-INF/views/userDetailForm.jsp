<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />

                <link rel="stylesheet" href="/css/default.css" />
                <link rel="stylesheet" href="/css/memberInfo.css" />
                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600&display=swap"
                    rel="stylesheet">
                <link
                    href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
                    rel="stylesheet">
                <title>마이페이지</title>
            </head>

            <body>
                <%@ include file="layout/header.jsp" %>
                    <div class="myPage">
                        <!-- <section class="profile_wrap"> -->
                        <div class="container">
                            <div class="pro_left">
                                <div class="pro_img">
                                    <c:choose>
                                        <c:when test="${userDetail.userProfileImg==null}">
                                            <img src="/image/noProfileImg.jpg" />
                                        </c:when>
                                        <c:otherwise><img src="/img/${userDetail.userProfileImg}" />
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </div>
                            <div class="pro_right">
                                <div class="name">
                                    <p>${userDetail.userNickname}</p>
                                    <c:if test="${principal.userId == userDetail.userId}">
                                        <button class="edit_btn"
                                            onclick="location.href='/s/api/user/updateForm/${principal.userId}'">수정하기
                                        </button>
                                    </c:if>
                                </div>
                                <div class="profile_con">
                                    <div class="profile_txt">
                                        <div class="pro_txt pro_info">
                                            <p class="pro_tit">PROFILE</p>
                                            <ul class="pro_info1">
                                                <li>성별</li>
                                                <li>키</li>
                                                <li>체형</li>
                                                <li>목소리톤</li>
                                                <li>분야</li>
                                                <li>연령대</li>
                                            </ul>
                                            <ul class="pro_info2">
                                                <li>${userDetail.userGender}</li>
                                                <li>${userDetail.userHeight}</li>
                                                <li>${userDetail.userForm}</li>
                                                <li>${userDetail.userTone}</li>
                                                <li>${userDetail.uftitles}</li>
                                                <li>${userDetail.userAge}</li>
                                            </ul>
                                            <div class="pro_txt">
                                                <p class="pro_tit">EDUCATION</p>
                                                <p class="pro_data">${userDetail.userEducation}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- profile_txt Left -->
                                    <div class="profile_txt">
                                        <div class="pro_txt">
                                            <p class="pro_tit">CAREER</p>
                                            <p class="pro_data">${userDetail.userCareer}</p>
                                        </div>

                                        <div class="pro_txt">
                                            <p class="pro_tit">SKILLS</p>
                                            <p class="pro_data">${userDetail.userSkill}</p>
                                        </div>
                                        <div class="pro_txt">
                                            <p class="pro_tit">CONTACT</p>
                                            <a href="${userDetail.userContactLink}" target="_blank"
                                                class="pro_data">카카오톡 오픈채팅<i
                                                    class="fa-solid fa-arrow-up-right-from-square"
                                                    title="새창 열기"></i></a>
                                            <p class="pro_data email">
                                                <input id="contact" type="hidden" value="${userDetail.userEmail}" />이메일
                                            </p>
                                            <i class="fa-regular fa-copy fa-lg" title="복사하기"></i>
                                            <div id="copy_pop" style="display: none">
                                                <p>복사되었습니다</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- profile_txt Right -->
                                </div>
                            </div>
                        </div>
                        <!-- </section> -->
                        <section class="filmo_wrap">
                            <div class="container">
                                <div class="profile_con">
                                    <div class="profile_txt">
                                        <div class="pro_txt">
                                            <p class="pro_tit">FILMOGRAPHY</p>
                                        </div>
                                    </div>
                                </div>
                                <table class="filmo_table">
                                    <colgroup>
                                        <col />
                                        <col width="9%" />
                                        <col width="20%" />
                                        <col width="15%" />
                                        <col width="12%" />
                                        <col width="18%" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>작품</th>
                                            <th>년도</th>
                                            <th>역할</th>
                                            <th>장르</th>
                                            <th>감독(연출)</th>
                                            <th>수상 및 초청 이력</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${userDetail.userPortfolio}" var="portfolio">
                                            <tr>
                                                <td>${portfolio.upTitle}</td>
                                                <td>${portfolio.upProdYear}</td>
                                                <td>${portfolio.upRole}</td>
                                                <td>${portfolio.upGenre}</td>
                                                <td>${portfolio.upDirector}</td>
                                                <td>${portfolio.upDirector} </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <c:if test="${principal.userId == userDetail.userId}">
                                <div class="withdrawal_wrap">
                                    <input type="hidden" value="${userDetail.userId}">
                                    <input type="hidden" value="${principal.userId}">
                                    <button type="button" class="withdrawal_btn"
                                        onclick="showWithdrawalConfirm();">탈퇴하기</button>
                                    <div class="withdrawal_comfirm" id="withdrawalConfirmModal" style="display:none;">
                                        <h2 class="pro_tit">정말로 탈퇴하시겠습니까?</h2>
                                        <div class="confirm">
                                            <button id="confirmWithdrawal" onclick="confirmWithdrawal()">탈퇴</button>
                                            <button id="closeWithdrawal" onclick="closeWithdrawal()">닫기</button>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </section>
                    </div>
                    <script src="https://kit.fontawesome.com/bfb14eb01e.js" crossorigin="anonymous"></script>
                    <script src="/js/showMemberInfo.js" crossorigin="anonymous"></script>
                    <script src="/js/editMemberInfo.js" crossorigin="anonymous"></script>
                    <script src="/js/default.js"></script>
                    <%@ include file="layout/footer.jsp" %>
            </body>

            </html>