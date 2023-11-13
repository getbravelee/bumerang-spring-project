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
        <title>수정하기</title>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      </head>

      <body>
        <%@ include file="layout/header.jsp" %>
          <input type="hidden" value="${principal.userId}" id="userId">
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
                <div class="edit_btn">
                  <button class="edit_img">사진 변경</button>
                  <button class="edit_passwd">비밀번호 변경</button>
                </div>
                <div class="img_editor">
                  <h2 class="pro_tit">프로필 이미지 변경하기</h2>
                  <div id="imageForm" enctype="multipart/form-data">
                    <input id="userProfileImg" type="file" accept="image/*">
                    <div>
                      <button id="save_editor">저장</button>
                      <button id="close_editor">닫기</button>
                    </div>
                  </div>
                </div>
                <div class="passwordChanger">
                  <h2 class="pro_tit">비밀번호 변경하기</h2>
                  <label for="userPassword">비밀번호
                    <input type="password" name="userPassword" id="userPassword"
                      placeholder="영어 대/소문자, 특수문자를 포함하여 8자 이상" />
                  </label>

                  <label for="userPasswordConfirm">비밀번호 확인
                    <input type="password" name="userPasswordConfirm" id="userPasswordConfirm"
                      placeholder="위 입력한 비밀번호와 동일하게 적어주세요" />
                  </label>

                  <div id="passwordError" style="display: none; color: red">
                    비밀번호가 일치하지 않습니다.
                  </div>

                  <div>
                    <button id="saveChanger">저장</button>
                    <button id="closeChanger">닫기</button>
                  </div>
                </div>
              </div>
              <div class="pro_right">
                <div class="name">
                  <p>
                    <input id="userNickname" type="text" value="${userDetail.userNickname}" /><button class="save"
                      onclick="updateUser()">
                      저장하기
                    </button>
                  </p>
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
                        <li>
                          <label>
                            <input type="radio" name="user_gender" value="남성" ${"남성".equals(userDetail.userGender)
                              ? "checked" : "" }>
                            남성
                          </label>
                          <label>
                            <input type="radio" name="user_gender" value="여성" ${"여성".equals(userDetail.userGender)
                              ? "checked" : "" }>
                            여성
                          </label>
                        </li>
                        <li>
                          <input id="user_height" type="number" value="${userDetail.userHeight}" />cm
                        </li>
                        <li>
                          <input type="hidden" id="userForm" value="${userDetail.userForm}">
                          <select class="dropdown" name="user_form" id="user_form">
                            <option class="user_form" value="아주 마름">아주 마름</option>
                            <option class="user_form" value="마름">마름</option>
                            <option class="user_form" value="보통">보통</option>
                            <option class="user_form" value="건장">건장</option>
                            <option class="user_form" value="통통">통통</option>
                            <option class="user_form" value="아주 큼">아주 큼</option>
                          </select>
                        </li>
                        <li>
                          <input type="hidden" id="userTone" value="${userDetail.userTone}">
                          <select class="dropdown" name="user_tone" id="user_tone">
                            <option class="user_tone" value="아주 낮음">아주 낮음</option>
                            <option class="user_tone" value="낮음">낮음</option>
                            <option class="user_tone" value="보통">보통</option>
                            <option class="user_tone" value="높음">높음</option>
                            <option class="user_tone" value="아주 높음">아주 높음</option>
                          </select>
                        </li>
                        <li>
                          <input type="hidden" id="userField" value="${userDetail.uftitles}">
                          <select class="dropdown" name="user_field" id="user_field">
                            <option class="user_field" value="배우">배우</option>
                            <option class="user_field" value="연출">연출</option>
                            <option class="user_field" value="음향">음향</option>
                            <option class="user_field" value="카메라">카메라</option>
                            <option class="user_field" value="조명">조명</option>
                            <option class="user_field" value="작가">작가</option>
                            <option class="user_field" value="기타">기타</option>
                          </select>
                        </li>
                        <li>
                          <input type="hidden" id="userAge" value="${userDetail.userAge}">
                          <select class="dropdown" name="user_age" id="user_age">
                            <option class="user_age" value="10대 미만">10대 미만</option>
                            <option class="user_age" value="10대">10대</option>
                            <option class="user_age" value="20대">20대</option>
                            <option class="user_age" value="30대">30대</option>
                            <option class="user_age" value="40대">40대</option>
                            <option class="user_age" value="50대">50대</option>
                            <option class="user_age" value="60대">60대</option>
                            <option class="user_age" value="70대">70대</option>
                            <option class="user_age" value="80대">80대</option>
                            <option class="user_age" value="90대 이상">90대 이상</option>
                          </select>
                        </li>
                      </ul>
                      <div class="pro_txt">
                        <p class="pro_tit">EDUCATION</p>
                        <p class="pro_data">
                          <input type="text" id="user_education" value="${userDetail.userEducation}" />
                        </p>
                      </div>
                    </div>
                  </div>
                  <!-- profile_txt Left -->
                  <div class="profile_txt">
                    <div class="pro_txt">
                      <p class="pro_tit">CAREER</p>
                      <p class="pro_data">
                        <input type="hidden" id="userCareer" value="${userDetail.userCareer}">
                        <select class="dropdown" id="user_career">

                          <option class="user_career" value="신입">신입</option>
                          <option class="user_career" value="1년차">1년차</option>
                          <option class="user_career" value="2년차">2년차</option>
                          <option class="user_career" value="3년차">3년차</option>
                          <option class="user_career" value="4년차">4년차</option>
                          <option class="user_career" value="5년차">5년차</option>
                          <option class="user_career" value="6년차">6년차</option>
                          <option class="user_career" value="7년차">7년차</option>
                          <option class="user_career" value="8년차">8년차</option>
                          <option class="user_career" value="9년차">9년차</option>
                          <option class="user_career" value="10년차 아성">10년차 이상</option>
                        </select>
                      </p>
                    </div>

                    <div class="pro_txt">
                      <p class="pro_tit">SKILLS</p>
                      <textarea id="user_skill">${userDetail.userSkill}</textarea>
                    </div>
                    <div class="pro_txt">
                      <p class="pro_tit">CONTACT</p>
                      <div>
                        <div>
                          <p class="pro_data kakao">오픈 채팅<input class="user_contact" type="text" id="user_contact"
                              value="${userDetail.userContactLink}" /></p>

                        </div>

                        <div>
                          <p class="pro_data email">
                            이메일<input class="user_contact" id="userEmail" type="email"
                              value="${userDetail.userEmail}" />
                          </p>
                        </div>
                      </div>
                      <%-- <!-- <div>--%>
                        <%-- <p class="pro_data kakao">카카오톡 오픈 채팅</p>--%>
                          <%-- <input--%>
                            <%-- class="user_contact" --%>
                              <%-- type="text" --%>
                                <%-- id="user_contact" --%>
                                  <%-- value="user_contact" --%>
                                    <%-- />--%>
                                    <%-- </div>--%>
                                      <%-- <div>--%>
                                        <%-- <p class="pro_data email">이메일</p>--%>
                                          <%-- <input--%>
                                            <%-- class="user_contact" --%>
                                              <%-- id="user_email" --%>
                                                <%-- type="email" --%>
                                                  <%-- value="user_email" --%>
                                                    <%-- />${userDetail.userEmail}--%>
                                                    <%-- </div> -->--%>
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
                    <col width="5%" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th>작품</th>
                      <th>년도</th>
                      <th>역할</th>
                      <th>장르</th>
                      <th>감독(연출)</th>
                      <th>수상 및 초청 이력</th>
                      <th><button id="filmo_add" class="filmo_add">추가</button></th>
                    </tr>
                  </thead>
                  <tbody class="filmo_body">
                    <c:forEach items="${userDetail.userPortfolio}" var="portfolio">
                      <tr>
                        <td><input id="up_1_title" class="upTitle" type="text" value="${portfolio.upTitle}" /></td>
                        <td>
                          <input id="up_1_prod_year" class="upProdYear" type="number" value="${portfolio.upProdYear}" />
                        </td>
                        <td>
                          <input id="up_1_role" class="upRole" type="text" value="${portfolio.upRole}" />
                        </td>
                        <td><input id="up_1_genre" class="upGenre" type="text" value="${portfolio.upGenre}" /></td>
                        <td>
                          <input id="up_1_director" class="upDirector" type="text" value="${portfolio.upDirector}" />
                        </td>
                        <td>
                          <input id="up_1_history" class="upHistory" type="text" value="${portfolio.upHistory}" />
                        </td>
                        <td><button class="filmo_del">삭제</button></td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </section>
          </div>
          <script src="https://kit.fontawesome.com/bfb14eb01e.js" crossorigin="anonymous"></script>
          <script src="/js/editMemberInfo.js" crossorigin="anonymous"></script>
          <script src="/js/editMemberInfo-img.js" crossorigin="anonymous"></script>
          <script src="/js/editMemberInfo-password.js" crossorigin="anonymous"></script>
          <script src="/js/default.js"></script>
          <%@ include file="layout/footer.jsp" %>
      </body>

      </html>