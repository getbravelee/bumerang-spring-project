<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <input id="userId" type="hidden" value="${userPS.userId}">
            <div class="mb-3 mt-3">
                아이디 : ${userPS.userLoginId}
            </div>
            <div class="mb-3 mt-3">
                이메일 :
                <input id="userEmail" type="text" value="${userPS.userEmail}" />
            </div>
            <div class="mb-3 mt-3">
                닉네임 :
                <input id="userNickname" type="text" value="${userPS.userNickname}" />
            </div>
            <div class="mb-3 mt-3">
                성별 :
                <select id="userGender">
                    <option>${userPS.userGender}</option>
                    <option value="남성">남성</option>
                    <option value="여성">여성</option>
                </select>
            </div>
            <div class="mb-3 mt-3">
                키 :
                <input id="userHeight" type="text" value="${userPS.userHeight}" />
            </div>
            <div class="mb-3 mt-3">
                체형 :
                <select id="userForm">
                    <option>${userPS.userForm}</option>
                    <option value="표준">표준</option>
                    <option value="마른">마른</option>
                    <option value="통통">통통</option>
                </select>
            </div>
            <div class="mb-3 mt-3">
                목소리톤 :
                <select id="userTone">
                    <option>${userPS.userTone}</option>
                    <option value="저음">저음</option>
                    <option value="중음">중음</option>
                    <option value="고음">고음</option>
                </select>
            </div>
            <div class="mb-3 mt-3">
                연령대 :
                <select id="userAge">
                    <option>${userPS.userAge}</option>
                    <option value="10대">10대</option>
                    <option value="20대">20대</option>
                    <option value="30대">30대</option>
                    <option value="40대">40대</option>
                    <option value="50대">50대</option>
                    <option value="60대">60대</option>
                    <option value="70대">70대</option>
                    <option value="80대">80대</option>
                    <option value="90대 이상">90대 이상</option>
                </select>
            </div>
            <div class="mb-3 mt-3">
                경력 :
                <select id="userCareer">
                    <option>${userPS.userCareer}</option>
                    <option value="1년차">1년차</option>
                    <option value="2년차">2년차</option>
                    <option value="3년차">3년차</option>
                    <option value="4년차">4년차</option>
                    <option value="5년차">5년차</option>
                    <option value="6년차">6년차</option>
                    <option value="7년차">7년차</option>
                    <option value="8년차">8년차</option>
                    <option value="9년차">9년차</option>
                    <option value="10년차 이상">10년차 이상</option>
                </select>
            </div>
            <div class="mb-3 mt-3">
                기술 :
                <input id="userSkill" type="text" value="${userPS.userSkill}" />
            </div>
            <div class="mb-3 mt-3">
                학력 :
                <input id="userEducation" type="text" value="${userPS.userEducation}" />
            </div>
            <div class="mb-3 mt-3">
                연락방법 :
                <input id="userContactLink" type="text" value="${userPS.userContactLink}" />
            </div>
            <div class="mb-3 mt-3">
                상태 :
                <select id="userStatus">
                    <option>${userPS.userStatus}</option>
                    <option value="active">active</option>
                    <option value="deleted">deleted</option>
                </select>
            </div>
            <div class="mb-3 mt-3">
                권한 :
                <select id="userRole">
                    <option>${userPS.userRole}</option>
                    <option value="사용자">사용자</option>
                    <option value="관리자">관리자</option>
                </select>
            </div>
            <div class="mb-3 mt-3">
                회원가입일 : ${userPS.createdAt}
            </div>
            <div class="mb-3 mt-3">
                회원정보 수정일 : ${userPS.updatedAt}
            </div>
            <button class="btn btn-warning" id="updateBtn" onclick="update()">수정하기</button>
        </div>
    </main>
</div>
</div>
<script>
    function update() {

        let data = {
            userEmail: $("#userEmail").val(),
            userNickname: $("#userNickname").val(),
            userGender: $("#userGender").val(),
            userHeight: $("#userHeight").val(),
            userForm: $("#userForm").val(),
            userTone: $("#userTone").val(),
            userAge: $("#userAge").val(),
            userCareer: $("#userCareer").val(),
            userSkill: $("#userSkill").val(),
            userEducation: $("#userEducation").val(),
            userContactLink: $("#userContactLink").val(),
            userStatus: $("#userStatus").val(),
            userRole: $("#userRole").val(),
            userId: $("#userId").val()
        };

        $.ajax("/manage/userUpdate", {
            type: "PUT",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json",
            },
        }).done((res) => {
            if (res.code == 1) {
                alert(res.msg);
                location.href = "/s/api/auth/manage/userListForm";
            } else {
                alert(res.msg);
                location.reload();
            }
        });
    }
</script>
<%@ include file="../layout/footer.jsp" %>