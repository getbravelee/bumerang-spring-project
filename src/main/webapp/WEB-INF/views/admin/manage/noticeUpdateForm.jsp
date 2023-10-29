<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <input id="noticeId" type="hidden" value="${noticePS.noticeId}">
                            <div class="mb-3 mt-3">
                                공지글 제목 :
                                <input id="noticeTitle" type="text" value="${noticePS.noticeTitle}" />
                            </div>
                            <div class="mb-3 mt-3">
                                공지글 내용 :
                                <input id="noticeContent" type="text" value="${noticePS.noticeContent}" />
                            </div>

                            <div class="mb-3 mt-3">
                                공지글 장르 :
                                <select id="noticeType">
                                    <option>${noticePS.noticeType}</option>
                                    <option value="서비스 공지">서비스 공지</option>
                                    <option value="컨텐츠 공지">컨텐츠 공지</option>
                                </select>
                            </div>
                            <div class="mb-3 mt-3">
                                상태 :
                                <select id="noticeStatus">
                                    <option>${noticePS.noticeStatus}</option>
                                    <option value="active">active</option>
                                    <option value="deleted">deleted</option>
                                </select>
                            </div>
                            <div class="mb-3 mt-3">
                                작성일 : ${noticePS.createdAt}
                            </div>
                            <div class="mb-3 mt-3">
                                수정일 : ${noticePS.updatedAt}
                            </div>
                            <button class="btn btn-warning" id="updateBtn" onclick="update()">수정하기</button>
                        </div>
                    </main>
                </div>
                </div>
                <script>
                    function update() {
                        let data = {
                            noticeTitle: $("#noticeTitle").val(),
                            noticeContent: $("#noticeContent").val(),
                            noticeType: $("#noticeType").val(),
                            noticeStatus: $("#noticeStatus").val(),
                            noticeId: $("#noticeId").val()
                        };

                        $.ajax("/manage/noticeUpdate", {
                            type: "PUT",
                            dataType: "json",
                            data: JSON.stringify(data),
                            headers: {
                                "Content-Type": "application/json",
                            },
                        }).done((res) => {
                            if (res.code == 1) {
                                alert(res.msg);
                                location.href = "/manage/noticeListForm";
                            } else {
                                alert(res.msg);
                                location.reload();
                            }
                        });
                    }
                </script>
                <%@ include file="../layout/footer.jsp" %>