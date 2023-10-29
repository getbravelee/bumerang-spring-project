<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <%@ include file="../layout/sidebar.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">사용자</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                사용자의 정보를 관리합니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                사용자 정보
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>닉네임</th>
                                            <th>이메일</th>
                                            <th>성별</th>
                                            <th>연령대</th>
                                            <th>포지션</th>
                                            <th>경력</th>
                                            <th>상태</th>
                                            <th>권한</th>
                                            <th>수정</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>닉네임</th>
                                            <th>이메일</th>
                                            <th>성별</th>
                                            <th>연령대</th>
                                            <th>포지션</th>
                                            <th>경력</th>
                                            <th>상태</th>
                                            <th>권한</th>
                                            <th>수정</th>
                                            <th>삭제</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="user" items="${userList}" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>
                                                    <a href="/manage/userDetailForm/${user.userId}">
                                                        ${user.userNickname}
                                                    </a>
                                                </td>
                                                <td>${user.userEmail}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${user.userGender == true}">남자</c:when>
                                                        <c:otherwise>여자</c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${user.userAge}</td>
                                                <td>${user.userPosition}</td>
                                                <td>${user.userCareer}</td>
                                                <td>${user.userStatus}</td>
                                                <td>${user.userRole}</td>
                                                <td>
                                                    <a href="/manage/userUpdateForm/${user.userId}"
                                                        class="btn btn-warning">수정</a>

                                                </td>
                                                <td>
                                                    <button onclick="remove(${user.userId})" class="btn btn-danger">
                                                        삭제
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            </div>
            <script>
                function remove(userId) {
                    if (confirm("사용자를 삭제하시겠습니까?")) {
                        $.ajax({
                            url: "/manage/userDelete/" + userId,
                            type: "DELETE",
                            headers: {
                                "Content-Type": "application/json; charset=utf-8",
                            },
                        }).done((res) => {
                            if (res.code == 1) {
                                alert(res.msg);
                                location.href = "/manage/userListForm";
                            } else {
                                alert(res.msg);
                                location.reload();
                            }
                        });
                    }
                }
            </script>
            <%@ include file="../layout/footer.jsp" %>