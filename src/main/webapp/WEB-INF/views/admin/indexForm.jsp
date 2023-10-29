<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="./layout/header.jsp" %>
        <%@ include file="./layout/sidebar.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">대쉬보드</h1>

                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">일간 조회수 ${viewPS.dailyView}</div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">주간 조회수 ${viewPS.weeklyView}</div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">일간 탈퇴수 ${exitPS.dailyExitCount}</div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">주간 탈퇴수 ${exitPS.weeklyExitCount}</div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        주간 게시글수
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        월간 가입자수
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                최근글
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>장르</th>
                                            <th>상태</th>
                                            <th>작성일</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>장르</th>
                                            <th>상태</th>
                                            <th>작성일</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="post" items="${postPS}" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <c:choose>
                                                    <c:when test="${post.type eq 'job'}">
                                                        <td>
                                                            <a href="/manage/jobDetailForm/${post.contentId}">
                                                                ${post.title}
                                                            </a>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${post.type eq 'performance'}">
                                                        <td>
                                                            <a href="/manage/pfDetailForm/${post.contentId}">
                                                                ${post.title}
                                                            </a>
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>${post.title}</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td>${post.genre}</td>
                                                <td>${post.status}</td>
                                                <td>${post.createdAt}</td>
                                            </tr>
                                        </c:forEach>



                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <%@ include file="./layout/footer.jsp" %>