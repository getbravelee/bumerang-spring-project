<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%@ include file="../pf/header.jsp" %>
<%@ include file="../pf/sidebar.jsp" %>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">공연 홍보 게시글 통계</h1>
            <div class="card mb-4">
                <div class="card-body">
                    공연 홍보 게시글 카테고리의 조회수 추이 및 장르 차트 입니다.
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-chart-area me-1"></i>
                    주간 조회수
                    <c:forEach items="${pfViewDaily}" var="pfViewDaily">
                        <input type="hidden" class="dailyView" value="${pfViewDaily.dailyView}">
                    </c:forEach>
                </div>
                <div class="card-body">
                    <canvas id="myAreaChart" width="100%" height="30"></canvas>
                </div>
                <div class="card-footer small text-muted">
                    최근 업데이트 날짜 : <%= formattedDate %>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-1"></i>
                            월별 증가 추세
                            <c:forEach items="${pfViewMonthly}" var="pfViewMonthly">
                                <input type="hidden" class="monthView" value="${pfViewMonthly.monthView}">
                            </c:forEach>
                        </div>
                        <div class="card-body">
                            <canvas id="myBarChart" width="100%" height="50"></canvas>
                        </div>
                        <div class="card-footer small text-muted">
                            최근 업데이트 날짜 : <%= formattedDate %>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-pie me-1"></i>
                            장르별 통계
                            <c:forEach items="${pfPS}" var="pf">
                                <input type="hidden" class="pfGenre" value="${pf.pfGenre}">
                                <input type="hidden" class="genreCount" value="${pf.genreCount}">
                            </c:forEach>
                        </div>
                        <div class="card-body">
                            <canvas id="myPieChart" width="100%" height="50"></canvas>
                        </div>
                        <div class="card-footer small text-muted">
                            최근 업데이트 날짜 : <%= formattedDate %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<%@ include file="../pf/footer.jsp" %>