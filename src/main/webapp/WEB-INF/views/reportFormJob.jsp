 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/css/default.css" />
        <link rel="stylesheet" href="/css/report.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
        <title>BusanMate with Write</title>
        <!-- JQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- AJax -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

      </head>

      <body>
        <div class="report_container">
          <h1>신고하기</h1>
          <input type="hidden" value="${targetId}" id="targetId">
          <input type="hidden" value="${principal.userId}" id="userId">

          <div class="target_info" id="targetInfo">
            <div><span>작 성 자</span><span>${jobInfo.userNickname}</span></div>
            <div><span>제 목</span><span>${jobInfo.jobContentTitle}</span></div>
          </div>
          <div class="reason_info">
            <h3>사유선택</h3>
            <ul class="type">
              <li>
                <input type="radio" name="reportType" value="같은 내용의 반복 게시(도배)" />스팸홍보/도배글입니다.
              </li>
              <li>
                <input type="radio" name="reportType" value="음란성/선전성" /><label>음란물입니다.</label>
              </li>
              <li>
                <input type="radio" name="reportType" value="불법정보" /><label>불법정보를 포함하고 있습니다.</label>
              </li>
              <li>
                <input type="radio" name="reportType" value="영리목적/홍보성" /><label>영리목적/홍보성 내용입니다.</label>
              </li>
              <li>
                <input type="radio" name="reportType" value="욕설/인신공격" /><label>욕설/생명경시/혐오/차별적 표현입니다.</label>
              </li>
              <li>
                <input type="radio" name="reportType" value="개인정보노출" /><label>개인정보 노출 게시물입니다.</label>
              </li>
              <li>
                <input type="radio" name="reportType" value="불법촬영물등 유통 신고" /><label>불법촬영물등이 있습니다.</label>
              </li>
              <li class="guitarli">
                <input type="radio" name="reportType" value="기타" />
                <label>기타</label>
              </li>
              <li>
                <input id="reportContent" type="text" class="guitar" wrap="hard" />
              </li>
            </ul>
          </div>
          <div class="btn_wrap">
            <button class="jobReportBtn">제 출</button>
          </div>
        </div>
        <script src="/js/reportJob.js"></script>
      </body>

      </html>