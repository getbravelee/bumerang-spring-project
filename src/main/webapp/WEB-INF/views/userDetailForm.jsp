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
                  <img src="/image/임성수.png" />
                </div>
              </div>
              <div class="pro_right">
                <div class="name">
                  <p>임성수</p>
                  <button class="edit_btn" onclick="">수정하기</button>
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
                        <li>남성</li>
                        <li>182cm</li>
                        <li>표준</li>
                        <li>밝은 저음</li>
                        <li>영화, 연극, 뮤지컬, 더빙, 나레이션</li>
                        <li>30대</li>
                      </ul>
                      <div class="pro_txt">
                        <p class="pro_tit">EDUCATION</p>
                        <p class="pro_data">숭실대학교 금융학부</p>
                      </div>
                    </div>
                  </div>
                  <!-- profile_txt Left -->
                  <div class="profile_txt">
                    <div class="pro_txt">
                      <p class="pro_tit">CAREER</p>
                      <p class="pro_data">1~3년</p>
                    </div>

                    <div class="pro_txt">
                      <p class="pro_tit">SKILLS</p>
                      <p class="pro_data">토익 920점</p>
                      <p class="pro_data">해군 중위 전역</p>
                      <p class="pro_data">성악(바리톤)</p>
                      <p class="pro_data">베이킹</p>
                    </div>
                    <div class="pro_txt">
                      <p class="pro_tit">CONTACT</p>
                      <a href="https://open.kakao.com/o/suUDopxe" target="_blank" class="pro_data">카카오톡 오픈채팅<i
                          class="fa-solid fa-arrow-up-right-from-square" title="새창 열기"></i></a>
                      <p class="pro_data email">
                        <input id="contact" type="hidden" value="hugobayit@gmail.com" />이메일
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
                    <tr>
                      <td>파문</td>
                      <td>2023</td>
                      <td>성우: 집 나간 아들, 타쿠야</td>
                      <td>장편영화</td>
                      <td>오기가미 나오코</td>
                      <td>2023 부산국제영화제</td>
                    </tr>
                    <tr>
                      <td>비공식작전</td>
                      <td>2023</td>
                      <td>성우: 주지훈</td>
                      <td>장편영화</td>
                      <td>김성훈</td>
                      <td>2023 부산국제영화제</td>
                    </tr>
                    <tr>
                      <td>할머니의 잘지은 밥상</td>
                      <td>2023</td>
                      <td>나레이션</td>
                      <td>다큐멘터리</td>
                      <td>로컬리티</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>한국어 능력평가 모의고사</td>
                      <td>2023</td>
                      <td>성우</td>
                      <td>기타</td>
                      <td>랑스</td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </section>
          </div>
          <script src="https://kit.fontawesome.com/bfb14eb01e.js" crossorigin="anonymous"></script>
          <script src="/js/showMemberInfo.js" crossorigin="anonymous"></script>
          <script src="/js/default.js"></script>
      </body>

      </html>