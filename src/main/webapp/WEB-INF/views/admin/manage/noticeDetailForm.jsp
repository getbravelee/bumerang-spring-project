<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <%@ include file="../layout/sidebar.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공지글</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                공지글의 정보를 관리합니다.
                            </div>
                        </div>
                        <div class="mb-3 mt-3">
                            공지글 제목 : ${noticePS.noticeTitle}
                        </div>
                        <div class="mb-3 mt-3">
                            공지글 내용 : ${noticePS.noticeContent}
                        </div>
                        <div class="mb-3 mt-3">
                            공지글 유형 : ${noticePS.noticeType}
                        </div>
                        <div class="mb-3 mt-3">
                            상태 : ${noticePS.noticeStatus}
                        </div>
                        <div class="mb-3 mt-3">
                            작성일 : ${noticePS.createdAt}
                        </div>
                        <div class="mb-3 mt-3">
                            수정일 : ${noticePS.updatedAt}
                        </div>
                    </div>
                </main>
            </div>
            </div>
            <%@ include file="../layout/footer.jsp" %>