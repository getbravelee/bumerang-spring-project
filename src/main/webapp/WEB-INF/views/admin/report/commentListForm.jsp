<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <%@ include file="../layout/sidebar.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">신고된 댓글</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                신고된 댓글의 정보를 관리합니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                신고된 댓글 정보
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>신고대상</th>
                                            <th>신고사유</th>
                                            <th>신고내용</th>
                                            <th>상태</th>
                                            <th>작성일시</th>
                                            <th>신고일시</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>신고대상</th>
                                            <th>신고사유</th>
                                            <th>신고내용</th>
                                            <th>상태</th>
                                            <th>작성일시</th>
                                            <th>신고일시</th>
                                            <th>삭제</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="comment" items="${commentList}" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>
                                                    ${comment.commentContent}
                                                </td>
                                                <td>${comment.reportType}</td>
                                                <td>${comment.reportContent}</td>
                                                <td>${comment.commentStatus}</td>
                                                <td>${comment.createdAt}</td>
                                                <td>${comment.reportCreatedAt}</td>
                                                <td>
                                                    <button onclick="remove(${comment.commentId})"
                                                        class="btn btn-danger">
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
                function remove(commentId) {
                    if (confirm("댓글을 삭제하시겠습니까?")) {
                        $.ajax({
                            url: "/manage/commentDelete/" + commentId,
                            type: "DELETE",
                            headers: {
                                "Content-Type": "application/json; charset=utf-8",
                            },
                        }).done((res) => {
                            if (res.code == 1) {
                                alert(res.msg);
                                location.href = "/report/commentListForm";
                            } else {
                                alert(res.msg);
                                location.reload();
                            }
                        });
                    }
                }
            </script>
            <%@ include file="../layout/footer.jsp" %>