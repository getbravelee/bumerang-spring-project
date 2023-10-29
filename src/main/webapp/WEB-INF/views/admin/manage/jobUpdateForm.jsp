<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ include file="../layout/sidebar.jsp" %>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">구인글</h1>
                            <div class="card mb-4">
                                <div class="card-body">
                                    구인글의 정보를 관리합니다.
                                </div>
                            </div>
                            <input id="jobId" type="hidden" value="${jobPS.jobId}">
                            <div class="mb-3 mt-3">
                                구인글 제목 :
                                <input id="jobContentTitle" type="text" value="${jobPS.jobContentTitle}" />
                            </div>
                            <div class="mb-3 mt-3">
                                구인글 내용 :
                                <input id="jobContent" type="text" value="${jobPS.jobContent}" />
                            </div>

                            <div class="mb-3 mt-3">
                                구인글 장르 :
                                <select id="jobGenre">
                                    <option>${jobPS.jobGenre}</option>
                                    <option value="뮤지컬">뮤지컬</option>
                                    <option value="국악">국악</option>
                                    <option value="무용">무용</option>
                                    <option value="클래식">클래식</option>
                                    <option value="오페라">오페라</option>
                                    <option value="연극">연극</option>
                                </select>
                            </div>
                            <div class="mb-3 mt-3">
                                구인글 작품 제목 :
                                <input id="jobArtTitle" type="text" value="${jobPS.jobArtTitle}" />
                            </div>
                            구인글 작품 포지션 :
                            <div id="positionContainer">
                                <c:forEach var="jobPosition" items="${jobPS.jobPositionTitle}">
                                    <select id="jobPositionTitle">
                                        <option>${jobPosition}</option>
                                        <option value="배우">배우</option>
                                        <option value="스텝">스텝</option>
                                        <option value="감독">감독</option>
                                        <option value="성우">성우</option>
                                    </select>
                                </c:forEach>
                            </div>
                            <button type="button" onclick="addPositionField()">포지션 추가</button>
                            <br>
                            <div class="mb-3 mt-3">
                                시작 예정일 :
                                <input type="date" id="jobStartDate" name="jobStartDate" value="${jobPS.jobStartDate}">
                            </div>
                            <div class="mb-3 mt-3">
                                예상 제작 기간 :
                                <input type="date" id="jobProductionDate" name="jobProductionDate"
                                    value="${jobPS.jobProductionDate}">
                            </div>
                            <div class="mb-3 mt-3">
                                모집 인원 :
                                <input type="number" id="jobTo" name="jobTo" min="0" step="1" value="${jobPS.jobTo}">
                            </div>
                            <div class="mb-3 mt-3">
                                출연료 :
                                <input type="text" id="jobPay" name="jobPay" value="${jobPS.jobPay}">
                            </div>
                            <div class="mb-3 mt-3">
                                모집 성별 :
                                <select id="jobGender">
                                    <option>${jobPS.jobGender}</option>
                                    <option value="남성">남성</option>
                                    <option value="여성">여성</option>
                                </select>
                            </div>
                            <div class="mb-3 mt-3">
                                연락방법 :
                                <select id="jobContact">
                                    <option>${jobPS.jobContact}</option>
                                    <option value="오픈톡">오픈톡</option>
                                    <option value="구글폼">구글폼</option>
                                </select>
                            </div>
                            <div class="mb-3 mt-3">
                                마감일 :
                                <input type="date" id="jobDeadline" name="jobDeadline" value="${jobPS.jobDeadline}">
                            </div>
                            <div class="mb-3 mt-3">
                                상태 :
                                <select id="jobStatus">
                                    <option>${jobPS.jobStatus}</option>
                                    <option value="active">active</option>
                                    <option value="dead">dead</option>
                                    <option value="deleted">deleted</option>
                                </select>
                            </div>
                            <div class="mb-3 mt-3">
                                작성일 : ${jobPS.createdAt}
                            </div>
                            <div class="mb-3 mt-3">
                                수정일 : ${jobPS.updatedAt}
                            </div>
                            <button class="btn btn-warning" id="updateBtn" onclick="update()">수정하기</button>
                        </div>
                    </main>
                </div>
                </div>
                <script>
                    function update() {
                        let selectedPositions = []; // 여러 개의 포지션을 저장할 배열

                        // 여러 포지션을 선택하고 배열에 추가
                        $('select[id="jobPositionTitle"]').each(function () {
                            selectedPositions.push($(this).val());
                        });

                        let data = {
                            jobContentTitle: $("#jobContentTitle").val(),
                            jobContent: $("#jobContent").val(),
                            jobGenre: $("#jobGenre").val(),
                            jobArtTitle: $("#jobArtTitle").val(),
                            jobStartDate: $("#jobStartDate").val(),
                            jobProductionDate: $("#jobProductionDate").val(),
                            jobTo: $("#jobTo").val(),
                            jobPay: $("#jobPay").val(),
                            jobGender: $("#jobGender").val(),
                            jobContact: $("#jobContact").val(),
                            jobDeadline: $("#jobDeadline").val(),
                            jobStatus: $("#jobStatus").val(),
                            jobPositionTitle: selectedPositions,
                            jobId: $("#jobId").val()
                        };

                        $.ajax("/manage/jobUpdate", {
                            type: "PUT",
                            dataType: "json",
                            data: JSON.stringify(data),
                            headers: {
                                "Content-Type": "application/json",
                            },
                        }).done((res) => {
                            if (res.code == 1) {
                                alert(res.msg);
                                location.href = "/manage/jobListForm";
                            } else {
                                alert(res.msg);
                                location.reload();
                            }
                        });
                    }
                </script>
                <script>
                    function addPositionField() {
                        var container = document.getElementById("positionContainer");
                        var newSelect = document.createElement("select");
                        newSelect.id = "jobPositionTitle"

                        var options = ["배우", "스텝", "감독", "성우"];

                        options.forEach(function (optionValue) {
                            var option = document.createElement("option");
                            option.value = optionValue;
                            option.text = optionValue;
                            newSelect.appendChild(option);
                        });

                        container.appendChild(newSelect);
                    }

                </script>
                <%@ include file="../layout/footer.jsp" %>