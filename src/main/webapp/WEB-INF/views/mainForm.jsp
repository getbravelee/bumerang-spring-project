<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link rel="stylesheet" href="/css/mainform.css"/>
    <link rel="stylesheet" href="/css/default.css"/>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
            integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <link
            href="https://fonts.googleapis.com/css?family=Material+Icons%7CMaterial+Icons+Outlined%7CMaterial+Icons+Two+Tone%7CMaterial+Icons+Round%7CMaterial+Icons+Sharp"
            rel="stylesheet">
    <title>Document</title>
</head>

<body>
<div class="loader">
    <div class="loading">
        <div class="load_text">
            <h2>
                부산 <span class="accent">메이트</span
            ><span class="accent2">랑</span>
            </h2>
        </div>
        <label class="percent">100%</label>
        <div class="progress-bar">
            <div class="progress"></div>
        </div>
    </div>
</div>
<!-- 헤더 -->
<%@ include file="layout/header.jsp" %>
<div class="container">
    <div class="header" style="margin: 10px 30px"></div>
    <div class="effect">
        <div class="birt">
            <img src="/image/giphy2.gif" alt=""/>
        </div>
        <div class="comm"></div>
    </div>
    <div class="list">
        <div class="item" id="item_0">
            <img src="/image/sky2.png" alt=""/>
            <div class="content">
                <h2>부산 상공 20,000피트</h2>
                <div class="content1">
                    안녕, 나는 '부메랑(부산+메이트랑)' 홈페이지의 마스코트를 맡은
                    미로라고해. <br/>
                    현재 내가 있는 곳은 부산 상공 20,000피트야!<br/>
                    내가 만들어진 이유를 알 수 있도록 먼저 부산의 영화제와 문화에 대해
                    소개할게. 잘 따라와줘!<br/>
                    (다음 버튼을 클릭해서 넘어가줘)
                </div>
            </div>
        </div>
        <div class="item" id="item_1">
            <img src="/image/hing.jpg" alt=""/>
            <div class="content">
                <h2>부산 국제 영화제</h2>
                <div class="content1">
                    짜잔. 여기는 부산 국제 영화제의 주 개최지인 영화의 전당이야.<br/>
                    1996년을 최초로 지금까지 매년 개최되는 부산국제영화제(BIFF)는 세계
                    5대 영화제로 불리며 부산은 물론 아시아의 영화를 세계에 알리는데 큰
                    역할을 해주었어.<br/>
                    이를 계기로 다양한 문화예술 컨텐츠가 폭발적으로 생산되기 시작했어.
                    바로 이곳 부산에서!
                </div>
            </div>
        </div>
        <div class="item" id="item_2">
            <img src="/image/603.jpg" alt=""/>
            <div class="content">
                <h2>꿈을 키우고 있는 청년들</h2>
                <div class="content1">
                    부산은 문화 컨텐츠를 생산하는 중심지로도 성장하고 있어.<br/>
                    영상, 영화 관련학과 졸업생이 부산에만 한 해에 1,700여명!<br/>
                    영화 뿐만 아니라 다양한 연극과 전시, 공연들이 제작되고 있어.
                </div>
            </div>
        </div>
        <div class="item" id="item_3">
            <img src="/image/604.jpg" alt=""/>
            <div class="content">
                <h2>꿈을 키우고 있는 청년들</h2>
                <div class="content1">
                    그런데 다들 만들어봐서 알지?<br/>
                    같이 멋진 프로젝트를 꾸려갈 사람 찾기 진-짜 힘든 거!<br/>
                    그래서 바로 나, 부메랑이 만들어졌어.
                </div>
            </div>
        </div>
        <div class="item" id="item_4">
            <img src="/image/kwan.jfif" alt=""/>
            <div class="content">
                <h2>막을 내리면서</h2>
                <div class="content1">
                    부메랑을 날려봐!<br/>
                    영화 뿐만 아니라 연극, 뮤지컬, 전시, 음악회 등 다양한 컨텐츠로
                    꿈을 실현시킬 수 있도록 도와줄게!<br/>
                </div>
                <div class="button">
                    <a href="/jobSearch/mainForm">메인으로</a>
                </div>
            </div>
        </div>
    </div>
    <button id="next"><i class="fa-solid fa-angle-right"></i></button>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/3f247b3389.js" crossorigin="anonymous"></script>
<script src="/js/default.js"></script>
<script src="/js/mainform.js"></script>
</body>
</html>
