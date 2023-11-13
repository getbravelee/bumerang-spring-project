<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Core</div>
                    <div class="sb-sidenav-menu-heading">Interface</div>
                    <a class="nav-link collapsed" href="/jobSearch/mainForm" aria-expanded="false" aria-controls="collapsePages">
                     <div class="sb-nav-link-icon"> <i class="fas fa-tachometer-alt" > </i></div>
                     부메랑돌아가기
                     <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                     </a>
                    <div class="sb-sidenav-menu-heading">Interface</div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages"
                       aria-expanded="false" aria-controls="collapsePages">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        정보관리
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                         data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="/s/api/auth/manage/userListForm">사용자 관리</a>
                            <a class="nav-link" href="/s/api/auth/manage/jobListForm">구인정보글 관리</a>
                            <a class="nav-link" href="/s/api/auth/manage/pfListForm">공연홍보글 관리</a>
                            <a class="nav-link" href="/s/api/auth/manage/noticeListForm">공지사항 관리</a>
                        </nav>
                    </div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                       data-bs-target="#collapsePages2" aria-expanded="false" aria-controls="collapsePages2">
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        신고관리
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePages2" aria-labelledby="headingTwo"
                         data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="/s/api/auth/report/jobListForm">신고된 구인정보글</a>
                            <a class="nav-link" href="/s/api/auth/report/pfListForm">신고된 공연홍보글</a>
                            <a class="nav-link" href="/s/api/auth/report/commentListForm">신고된 댓글</a>
                        </nav>
                    </div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                       data-bs-target="#collapsePages3" aria-expanded="false" aria-controls="collapsePages2">
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        통계
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePages3" aria-labelledby="headingTwo"
                         data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="/s/api/auth/statistics/jobChartForm">구인정보글 통계</a>
                            <a class="nav-link" href="/s/api/auth/statistics/pfChartForm">공연홍보글 통계</a>
                        </nav>
                    </div>
                </div>
            </div>
        </nav>
    </div>