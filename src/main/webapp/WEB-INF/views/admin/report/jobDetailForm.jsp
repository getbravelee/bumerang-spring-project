<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
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
            <div class="mb-3 mt-3">
                구인글 제목 : ${jobPS.jobContentTitle}
            </div>
            <div class="mb-3 mt-3">
                구인글 내용 : ${jobPS.jobContent}
            </div>
            <div class="mb-3 mt-3">
                구인글 장르 : ${jobPS.jobGenre}
            </div>
            <div class="mb-3 mt-3">
                구인글 작품 제목 : ${jobPS.jobArtTitle}
            </div>
            <div class="mb-3 mt-3">
                구인글 작품 포지션 : ${jobPS.jobPositionTitles}
            </div>
            <div class="mb-3 mt-3">
                시작 예정일 : ${jobPS.jobStartDate}
            </div>
            <div class="mb-3 mt-3">
                예상 제작 기간 : ${jobPS.jobProductionDate}
            </div>
            <div class="mb-3 mt-3">
                모집 인원 : ${jobPS.jobTo}
            </div>
            <div class="mb-3 mt-3">
                출연료 : ${jobPS.jobPay}
            </div>
            <div class="mb-3 mt-3">
                모집 성별 : ${jobPS.jobGender}
            </div>
            <div class="mb-3 mt-3">
                연락방법 : ${jobPS.jobContact}
            </div>
            <div class="mb-3 mt-3">
                마감일 : ${jobPS.jobDeadline}
            </div>
            <div class="mb-3 mt-3">
                상태 : ${jobPS.jobStatus}
            </div>
            <div class="mb-3 mt-3">
                작성일 : ${jobPS.createdAt}
            </div>
            <div class="mb-3 mt-3">
                수정일 : ${jobPS.updatedAt}
            </div>
        </div>
    </main>
</div>
</div>
<%@ include file="../layout/footer.jsp" %>