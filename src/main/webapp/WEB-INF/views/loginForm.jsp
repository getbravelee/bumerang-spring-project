<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/login.css">
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- AJax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>Welcome to Bumerang</title>
</head>

<body>

    <div class="container" id="container">
        <div class="form-container sign-up">
            <form id="joinForm">
                <h1>회원 가입</h1>
                <div class="social-icons">
                    <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
                <input type="text" name="user_login_id" id="userLoginId"  placeholder="아이디">
                <input type="password" name="user_password" id="password" placeholder="비밀번호">
                <input type="password" name="user_password_check" id="password_check" placeholder="비밀번호">
                <input type="email" name="user_email" id="userEmail" placeholder="email@xxxx">
                <input type="text" name="user_nickname" id="userNickname" placeholder="닉네임">
                <!-- <input type="number" name="user_age" placeholder="만 나이(숫자만)">
                <label for="male">남성</label>
                <input type="radio" name="user_gender" value="true">
                <label for="male">여성</label>
                <input type="radio" name="user_gender" value="false">
                <input type="text" name="user_position" placeholder="전문 분야">
                <input type="text" name="user_career" placeholder="연출 1년">
                <input type="text" name="user_intro" placeholder="자기소개">
                <input type="text" name="user_porfolio_link" placeholder="포트폴리오 링크">
                <input type="text" name="user_contact_lin" placeholder="연락 방법 ex:전화번호, 오픈톡 등">
                <input type="text" name="user_profile_img" placeholder="프로필 이미지"> -->
                <input type="hidden" name="user_role" value="normal">
                <button id="joinBtn">가입하기</button>
            </form>
        </div>
        <div class="form-container sign-in">
            <form id="loginForm">
                <h1>로그인</h1>
                <div class="social-icons">
                    <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
            
                <input id="userLoginId" type="id" name="userLoginId" placeholder="아이디">
                <input id="userPassword" type="password" name="userPassword" placeholder="비밀번호">
                <a href="#">비밀번호를 잊으셨나요?</a>
                <button type="submit" id="loginBtn">로그인</button>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>부메랑을 함께 날려요!</h1>
                    <p>홀로 날아간 부메랑이 팀이 되어 돌아올 거예요</p>
                    <button class="hidden" id="login">로그인하기</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>안녕하세요!</h1>
                    <p>오늘도 부메랑을 날려볼까요?</p>
                    <button class="hidden" id="register">회원가입하기</button>
                </div>
            </div>
        </div>
    </div>

    <script src="./js/login.js"></script>
</body>

</html>