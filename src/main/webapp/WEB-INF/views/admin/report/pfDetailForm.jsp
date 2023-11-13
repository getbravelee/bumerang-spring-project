<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/sidebar.jsp" %>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">공연글</h1>
            <div class="card mb-4">
                <div class="card-body">
                    공연글의 정보를 관리합니다.
                </div>
            </div>
            <div class="mb-3 mt-3">
                공연글 제목 : ${pfPS.pfTitle}
            </div>
            <div class="mb-3 mt-3">
                공연글 내용 : ${pfPS.pfContent}
            </div>
            <div class="mb-3 mt-3">
                공연글 연령대 : ${pfPS.pfAgerating}
            </div>
            <div class="mb-3 mt-3">
                공연 시작일 : ${pfPS.pfStartDate}
            </div>
            <div class="mb-3 mt-3">
                공연 마감일 : ${pfPS.pfDeadline}
            </div>
            <div class="mb-3 mt-3">
                예매 방법 : ${pfPS.pfBookingmethod}
            </div>
            <div class="mb-3 mt-3">
                공연 제작사 : ${pfPS.pfProduction}
            </div>
            <div class="mb-3 mt-3">
                공연 장소 : ${pfPS.pfLocation}
            </div>
            <div class="mb-3 mt-3">
                공연시간 : ${pfPS.pfRunningtime} 분
            </div>
            <div class="mb-3 mt-3">
                공연 가격 : ${pfPS.pfPrice} 원
            </div>
            <div class="mb-3 mt-3">
                공연 장르 : ${pfPS.pfGenre}
            </div>
            <div class="mb-3 mt-3">
                공연 썸네일 : ${pfPS.pfThumbnail}
            </div>
            <div class="mb-3 mt-3">
                상태 : ${pfPS.pfStatus}
            </div>
            <div class="mb-3 mt-3">
                작성일 : ${pfPS.createdAt}
            </div>
            <div class="mb-3 mt-3">
                수정일 : ${pfPS.updatedAt}
            </div>
        </div>
    </main>
</div>
</div>
<%@ include file="../layout/footer.jsp" %>