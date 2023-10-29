<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ include file="../layout/sidebar.jsp" %>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">공연글</h1>
                            <div class="card mb-4">
                                <div class="card-body">
                                    공연글의 정보를 수정 합니다.
                                </div>
                            </div>
                            <input id="pfId" type="hidden" value="${pfPS.pfId}">
                            <div class="mb-3 mt-3">
                                공연글 제목 :
                                <input id="pfTitle" type="text" value="${pfPS.pfTitle}" />
                            </div>
                            <div class="mb-3 mt-3">
                                공연글 내용 :
                                <input id="pfContent" type="text" value="${pfPS.pfContent}" />
                            </div>
                            <div class="mb-3 mt-3">
                                공연 연령대 :
                                <select id="pfAgerating">
                                    <option>${pfPS.pfAgerating}</option>
                                    <option value="전체관람가">전체관람가</option>
                                    <option value="12세 이상">12세 이상</option>
                                    <option value="15세 이상">15세 이상</option>
                                    <option value="청소년 관람불가">청소년 관람불가</option>
                                </select>
                            </div>
                            <div class="mb-3 mt-3">
                                공연 시작일 :
                                <input type="date" id="pfStartDate" name="pfStartDate" value="${pfPS.pfStartDate}">
                            </div>
                            <div class="mb-3 mt-3">
                                공연 마감일 :
                                <input type="date" id="pfDeadline" name="pfDeadline" value="${pfPS.pfDeadline}">
                            </div>
                            <div class="mb-3 mt-3">
                                예매 방법 :
                                <select id="pfBookingmethod">
                                    <option>${pfPS.pfBookingmethod}</option>
                                    <option value="오프라인">오프라인</option>
                                    <option value="온라인">온라인</option>
                                </select>
                            </div>
                            <div class="mb-3 mt-3">
                                공연 제작사 :
                                <input id="pfProduction" type="text" value="${pfPS.pfProduction}" />
                            </div>
                            <div class="mb-3 mt-3">
                                공연 장소 :
                                <input id="pfLocation" type="text" value="${pfPS.pfLocation}" />
                            </div>
                            <div class="mb-3 mt-3">
                                공연 시간 :
                                <input type="number" id="pfRunningtime" name="pfRunningtime" min="0" step="1"
                                    value="${pfPS.pfRunningtime}">
                            </div>
                            <div class="mb-3 mt-3">
                                공연 가격 :
                                <input type="number" id="pfPrice" name="pfPrice" min="0" step="1"
                                    value="${pfPS.pfPrice}">
                            </div>
                            <div class="mb-3 mt-3">
                                공연 장르 :
                                <select id="pfGenre">
                                    <option>${pfPS.pfGenre}</option>
                                    <option value="뮤지컬">뮤지컬</option>
                                    <option value="국악">국악</option>
                                    <option value="무용">무용</option>
                                    <option value="클래식">클래식</option>
                                    <option value="오페라">오페라</option>
                                    <option value="연극">연극</option>
                                </select>
                            </div>

                            <div class="mb-3 mt-3">
                                공연 썸네일 :
                                <input id="pfThumbnail" type="text" value="${pfPS.pfThumbnail}" />
                            </div>
                            <div class="mb-3 mt-3">
                                상태 :
                                <select id="pfStatus">
                                    <option>${pfPS.pfStatus}</option>
                                    <option value="active">active</option>
                                    <option value="dead">dead</option>
                                    <option value="deleted">deleted</option>
                                </select>
                            </div>
                            <div class="mb-3 mt-3">
                                작성일 : ${pfPS.createdAt}
                            </div>
                            <div class="mb-3 mt-3">
                                수정일 : ${pfPS.updatedAt}
                            </div>
                            <button class="btn btn-warning" id="updateBtn" onclick="update()">수정하기</button>
                        </div>
                    </main>
                </div>
                </div>
                <script>
                    function update() {
                        let data = {
                            pfTitle: $("#pfTitle").val(),
                            pfContent: $("#pfContent").val(),
                            pfAgerating: $("#pfAgerating").val(),
                            pfStartDate: $("#pfStartDate").val(),
                            pfDeadline: $("#pfDeadline").val(),
                            pfBookingmethod: $("#pfBookingmethod").val(),
                            pfProduction: $("#pfProduction").val(),
                            pfLocation: $("#pfLocation").val(),
                            pfRunningtime: $("#pfRunningtime").val(),
                            pfPrice: $("#pfPrice").val(),
                            pfGenre: $("#pfGenre").val(),
                            pfThumbnail: $("#pfThumbnail").val(),
                            pfStatus: $("#pfStatus").val(),
                            pfId: $("#pfId").val()
                        };

                        $.ajax("/manage/pfUpdate", {
                            type: "PUT",
                            dataType: "json",
                            data: JSON.stringify(data),
                            headers: {
                                "Content-Type": "application/json",
                            },
                        }).done((res) => {
                            if (res.code == 1) {
                                alert(res.msg);
                                location.href = "/manage/pfListForm";
                            } else {
                                alert(res.msg);
                                location.reload();
                            }
                        });
                    }
                </script>
                <%@ include file="../layout/footer.jsp" %>