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
                        <div class="mb-3 mt-3">
                            아이디 : ${userPS.userLoginId}
                        </div>
                        <div class="mb-3 mt-3">
                            이메일 : ${userPS.userEmail}
                        </div>
                        <div class="mb-3 mt-3">
                            닉네임 : ${userPS.userNickname}
                        </div>
                        <div class="mb-3 mt-3">
                            연령대 : ${userPS.userAge}
                        </div>
                        <div class="mb-3 mt-3">
                            포지션 : ${userPS.userPosition}
                        </div>
                        <div class="mb-3 mt-3">
                            성별 : ${userPS.userGender}
                        </div>
                        <div class="mb-3 mt-3">
                            경력 : ${userPS.userCareer}
                        </div>
                        <div class="mb-3 mt-3">
                            자기소개 : ${userPS.userIntro}
                        </div>
                        <div class="mb-3 mt-3">
                            포트폴리오 링크 : ${userPS.userPortfolioLink}
                        </div>
                        <div class="mb-3 mt-3">
                            연락방법 : ${userPS.userContactLink}
                        </div>
                        <div class="mb-3 mt-3">
                            프로필 이미지 : ${userPS.userProfileImg}
                        </div>
                        <div class="mb-3 mt-3">
                            권한 : ${userPS.userRole}
                        </div>
                        <div class="mb-3 mt-3">
                            상태 : ${userPS.userStatus}
                        </div>
                        <div class="mb-3 mt-3">
                            회원가입일 : ${userPS.createdAt}
                        </div>
                        <div class="mb-3 mt-3">
                            회원정보 수정일 : ${userPS.updatedAt}
                        </div>
                    </div>
                </main>
            </div>
            </div>
            <%@ include file="../layout/footer.jsp" %>