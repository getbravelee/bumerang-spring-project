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
        <title>마이페이지 수정하기</title>
      </head>

      <body>
        <%@ include file="layout/header.jsp" %>
          <div class="myPage">
            <!-- <section class="profile_wrap"> -->
            <div class="container">
              <div class="pro_left">
                <div class="pro_img">
                  <img src="/image/임성수.png" />
                </div>
                <div class="edit_btn">
                  <button class="edit_img">사진 변경</button>
                  <button class="edit_passwd">비밀번호 변경</button>
                </div>
                <div class="img_editor">
                  <h2 class="pro_tit">프로필 이미지 변경하기</h2>
                  <!-- <label for="userProfileImg" class="custom-file-upload">
                파일 선택
              </label> -->
                  <input id="userProfileImg" type="file" />
                  <div>
                    <button id="save_editor">저장</button>
                    <button id="close_editor">닫기</button>
                  </div>
                </div>
                <div class="passwordChanger">
                  <h2 class="pro_tit">비밀번호 변경하기</h2>
                  <label for="userPassword">비밀번호<input type="password" name="userPassword" id="userPassword"
                      placeholder="영어 대/소문자, 특수문자를 포함하여 8자 이상" /></label>

                  <label for="userPasswordConfirm">비밀번호 확인<input type="password" name="userPasswordConfirm"
                      id="userPasswordConfirm" placeholder="위 입력한 비밀번호와 동일하게 적어주세요" /></label>

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
                    <input id="user_nickname" type="text" value="임성수" /><button class="save" onclick="">
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
                          <label for="male">남성</label>
                          <input type="radio" class="user_gender" name="user_gender" value="남성" checked />
                          <label for="female">여성</label>
                          <input type="radio" class="user_gender" name="user_gender" value="여성" />
                        </li>
                        <li>
                          <input id="user_height" type="number" value="182" />cm
                        </li>
                        <li>
                          <select class="dropdown" name="user_form" id="user_form">
                            <option value="아주 마름">아주 마름</option>
                            <option value="마름" selected>마름</option>
                            <option value="보통">보통</option>
                            <option value="건장">건장</option>
                            <option value="통통">통통</option>
                            <option value="아주 큼">아주 큼</option>
                          </select>
                        </li>
                        <li>
                          <select class="dropdown" name="user_tone" id="user_tone">
                            <option value="아주 낮음">아주 낮음</option>
                            <option value="낮음" selected>낮음</option>
                            <option value="보통">보통</option>
                            <option value="높음">높음</option>
                            <option value="아주 높음">아주 높음</option>
                          </select>
                        </li>
                        <li>
                          <select class="dropdown" name="user_position" id="user_position">
                            <option value="배우" selected>배우</option>
                            <option value="연출">연출</option>
                            <option value="음향">음향</option>
                            <option value="카메라">카메라</option>
                            <option value="조명">조명</option>
                            <option value="작가">작가</option>
                            <option value="기타">기타</option>
                          </select>
                        </li>
                        <li>
                          <select class="dropdown" name="user_age" id="user_age">
                            <option value="0">10대 미만</option>
                            <option value="10">10대</option>
                            <option value="20">20대</option>
                            <option value="30" selected>30대</option>
                            <option value="40">40대</option>
                            <option value="50">50대</option>
                            <option value="60">60대 이상</option>
                            <option value="70">70대 이상</option>
                            <option value="80">80대 이상</option>
                            <option value="90">90대 이상</option>
                          </select>
                        </li>
                      </ul>
                      <div class="pro_txt">
                        <p class="pro_tit">EDUCATION</p>
                        <p class="pro_data">
                          <input type="text" id="user_education" value="숭실대학교 금융학부" />
                        </p>
                      </div>
                    </div>
                  </div>
                  <!-- profile_txt Left -->
                  <div class="profile_txt">
                    <div class="pro_txt">
                      <p class="pro_tit">CAREER</p>
                      <p class="pro_data">
                        <select class="dropdown" id="user_career">
                          <option value="신인">신입</option>
                          <option value="1년차">1년차</option>
                          <option value="1년차">2년차</option>
                          <option value="1년차">3년차</option>
                          <option value="1년차" selected>4년차</option>
                          <option value="1년차">5년차</option>
                          <option value="1년차">6년차</option>
                          <option value="1년차">7년차</option>
                          <option value="1년차">8년차</option>
                          <option value="1년차">9년차</option>
                          <option value="1년차">10년차 이상</option>
                        </select>
                      </p>
                    </div>

                    <div class="pro_txt">
                      <p class="pro_tit">SKILLS</p>
                      <textarea id="user_skill">토익 920점, 성악(바리톤)</textarea>
                    </div>
                    <div class="pro_txt">
                      <p class="pro_tit">CONTACT</p>
                      <div>
                        <div>
                          <p class="pro_data kakao">오픈 채팅<input class="user_contact" type="text" id="user_contact"
                              value="https://open.kakao.com/o/suUDopxe" /></p>

                        </div>

                        <div>
                          <p class="pro_data email">
                            이메일<input class="user_contact" id="user_email" type="email" value="hugobayit@gmail.com" />
                          </p>
                        </div>
                      </div>
                      <!-- <div>
                  <p class="pro_data kakao">카카오톡 오픈 채팅</p>
                  <input
                    class="user_contact"
                    type="text"
                    id="user_contact"
                    value="https://open.kakao.com/o/suUDopxe"
                  />
                </div>
                <div>
                  <p class="pro_data email">이메일</p>
                  <input
                    class="user_contact"
                    id="user_email"
                    type="email"
                    value="hugobayit@gmail.com"
                  />
                </div> -->
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
                    <tr id="1">
                      <td><input id="up_1_title" type="text" value="파문" /></td>
                      <td>
                        <input id="up_1_prod_year" type="number" value="2023" />
                      </td>
                      <td>
                        <input id="up_1_role" type="text" value="성우: 집 나간 아들, 타쿠야" />
                      </td>
                      <td><input id="up_1_genre" type="text" value="장편영화" /></td>
                      <td>
                        <input id="up_1_director" type="text" value="오기가미 나오코" />
                      </td>
                      <td>
                        <input id="up_1_history" type="text" value="2023 부산국제영화제" />
                      </td>
                      <td><button class="filmo_del">삭제</button></td>
                    </tr>
                    <tr id="2">
                      <td><input id="title" type="text" value="비공식작전" /></td>
                      <td><input id="prod_year" type="number" value="2023" /></td>
                      <td><input id="role" type="text" value="성우: 주지훈" /></td>
                      <td><input id="genre" type="text" value="장편영화" /></td>
                      <td><input id="director" type="text" value="김성훈" /></td>
                      <td>
                        <input id="history" type="text" value="2023 부산국제영화제" />
                      </td>
                      <td><button class="filmo_del">삭제</button></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="withdrawal_wrap">
                <button class="withdrawal_btn">탈퇴하기</button>
                <div class="withdrawal_comfirm">
                  <h2 class="pro_tit">정말로 탈퇴하시겠습니까?</h2>
                  <div>
                    <button id="confirmWithdrawal">탈퇴</button>
                    <button id="closeWithdrawal">닫기</button>
                  </div>
                </div>
              </div>
            </section>
          </div>
          <script src="https://kit.fontawesome.com/bfb14eb01e.js" crossorigin="anonymous"></script>
          <script src="/js/editMemberInfo.js" crossorigin="anonymous"></script>
          <script src="/js/default.js"></script>
      </body>

      </html>