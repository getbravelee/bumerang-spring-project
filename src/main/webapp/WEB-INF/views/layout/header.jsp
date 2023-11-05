<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <header>
            <div class="navbar">
                <div class="bot_menu">
                    <a href=""><img src="/image/mainlogo.png"></a>
                    <div class="title">
                        <h2>부산 <span class="accent">메이트</span><span class="accent2">랑</span></h2>
                    </div>

                    <ul class="menubar">
                        <li><a href="/jobSearch/mainForm">
                                <h3>구인정보</h3>
                            </a></li>
                        <li><a href="/performance/mainForm">
                                <h3>전시·공연</h3>
                            </a></li>
                        <li>
                            <a href="/notice/listForm">
                                <h3>공지사항</h3>
                            </a>
                        </li>
                    </ul>
                </div>
                <c:choose>
                    <c:when test="${principal != null}">
                        <!-- <ul class="linkes">
                            <li class="action">
                                <div class="profile" onclick="menuToggle();">
                                    <i class="fa-solid fa-pen"></i>
                                </div>

                                <div class="menu">
                                    <ul>
                                        <li>
                                            <span class="material-symbols-outlined">
                                                stylus_note
                                            </span>
                                            <a href="/s/api/jobSearch/writeForm">구인 글 쓰기</a>
                                        </li>
                                        <li>
                                            <span class="material-symbols-outlined">
                                                ink_highlighter_move
                                            </span>
                                            <a href="/s/api/performance/writeForm">공연 글 쓰기</a>
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

                                            <span class="material-symbols-outlined">
                                                border_color
                                            </span>
                                            <a href="#">내 작성글</a>
                                        </li>
                                        <li>
                                            <span class="material-symbols-outlined">
                                                favorite
                                            </span>
                                            <a href="/s/api/user/likeyListForm">내 관심글</a>
                                        </li>
                                        <li>
                                            <span class="material-symbols-outlined">
                                                assignment_ind
                                            </span>
                                            <a href="viewMemberInfo.html">계정 관리</a>
                                        </li>
                                        <li>
                                            <span class="material-symbols-outlined">
                                                logout
                                            </span>
                                            <a href="myPost.html">내 작성글</a>
                                        </li>
                                        <li>
                                            <span class="material-symbols-outlined">
                                                logout
                                            </span>
                                            <a href="/s/api/user/logout">로그아웃</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul> -->
                        <ul class="linkes">
                            <li class="action">
                                <div class="profile" onclick="menuToggle();">
                                    <i class="fa-solid fa-pen"></i>
                                </div>

                                <div class="menu">
                                    <ul>
                                        <li>
                                            <span class="material-icons icons-size">person</span>
                                            <a href="/s/api/jobSearch/writeForm">구인 글 쓰기</a>
                                        </li>
                                        <li>
                                            <span class="material-icons icons-size">mode</span>
                                            <a href="/s/api/performance/writeForm">공연 글 쓰기</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>

                            <li>
                                <a href=""><i class="fa-solid fa-bell"></i></a>
                            </li>

                            <li class="action">
                                <div class="profile" onclick="menu2Toggle();">
                                    <i class="fa-solid fa-circle-user"></i>
                                </div>

                                <div class="menu2">
                                    <ul>
                                        <li>
                                            <span class="material-icons icons-size">insert_comment</span>
                                            <a href="/s/api/user/writeListForm">내 작성글</a>
                                        </li>
                                        <li>
                                            <span class="material-icons icons-size">insert_comment</span>
                                            <a href="/s/api/user/likeyListForm">내 관심글</a>
                                        </li>
                                        <li>
                                            <span class="material-icons icons-size">person</span>
                                            <a href="viewMemberInfo.html">계정 관리</a>
                                        </li>
                                        <li>
                                            <span class="material-icons icons-size">account_balance_wallet</span>
                                            <a href="/s/api/user/logout">로그 아웃</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <a href="/user/loginForm" class="linkes">로그인</a>
                    </c:otherwise>
                </c:choose>

            </div>
        </header>