<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://kit.fontawesome.com/bfb14eb01e.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="/css/default.css" />
    <link rel="stylesheet" href="/css/writeNotice.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    <link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
    <link href="//cdn.quilljs.com/1.3.6/quill.core.css" rel="stylesheet" />
    <script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
    <script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>
    <title>공지사항</title>
  </head>
  <body>
    <!-- 헤더 -->
    <header>
      <div class="navbar">
           <div class="bot_menu">
                 <a href=""><img src="image/mainlogo.png"></a>
                 <div class="title">
                     <h2>부산 <span class="accent">메이트</span><span class="accent2">랑</span></h2>  
                 </div>
 
                 <ul class="menubar">
                     <li><a href="index.html"><h3>구인정보</h3></a></li>
                     <li><a href="performance.html"><h3>전시·공연</h3></a></li>
                     <li>
                       <a href="notice.html"><h3>공지사항</h3></a>
                     </li>
                 </ul>
             </div>
            
             <ul class="linkes">
                 <li class="action">
                      <div class="profile" onclick="menuToggle();">
                      <i class="fa-solid fa-pen"></i>
                      </div>

                      <div class="menu">
                          <ul>
                              <li>
                                  <span class="material-icons icons-size">person</span>
                                  <a href="#">구인 글 쓰기</a>
                              </li>
                              <li>
                                  <span class="material-icons icons-size">mode</span>
                                  <a href="https://www.naver.com">공연 글 쓰기</a>
                              </li>
                          </ul>
                      </div>
                  </li>
                  
                 <li><a href=""><i class="fa-solid fa-bell"></i></a></li>

                 <li class="action">
                  <div class="profile" onclick="menu2Toggle();">
                      <i class="fa-solid fa-circle-user"></i>
                  </div>

                  <div class="menu2">
                      <ul>
                          <li>
                              <span class="material-icons icons-size">insert_comment</span>
                              <a href="#">내 작성글</a>
                          </li>
                          <li>
                              <span class="material-icons icons-size">insert_comment</span>
                              <a href="https://www.naver.com">내 관심글</a>
                          </li>
                          <li>
                              <span class="material-icons icons-size">person</span>
                              <a href="viewMemberInfo.html">계정 관리</a>
                          </li>
                          <li>
                              <span class="material-icons icons-size">account_balance_wallet</span>
                              <a href="https://www.naver.com">로그 아웃</a>
                          </li> 
                      </ul>
                  </div>
              </li>
             </ul>
      </div>
     </header>

    <div class="container">
      <div class="board_write_wrap">
        <div class="top">
          <div class="board_name">
            <i class="fa-solid fa-bullhorn"></i>
            <h2>공지사항</h2>
          </div>
          <div class="bt_wrap">
            <a href="viewNotice.html" class="save">등록</a>
            <a href="notice.html" class="cancel">취소</a>
          </div>
        </div>
        <div class="board_write">
          <div class="info">
            <dl class="title">
              <dt>제목</dt>
              <dd>
                <input
                  type="text"
                  placeholder="글 제목을 입력하세요"
                  value=""
                />
              </dd>
            </dl>
            <dl class="type">
              <dt>공지 유형</dt>
              <dd>
                <select>
                  <option>컨텐츠 공지</option>
                  <option>서비스 공지</option>
                </select>
              </dd>
            </dl>
          </div>
          <div class="content">
            <div id="editor-container"></div>
          </div>
        </div>

      </div>
    </div>
    <script src="/js/writeNotice.js"></script>
    <script src="/js/default.js"></script>
  </body>
</html>
