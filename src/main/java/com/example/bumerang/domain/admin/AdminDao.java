package com.example.bumerang.domain.admin;

import com.example.bumerang.web.dto.request.notice.WriteDto;
import com.example.bumerang.web.dto.response.admin.*;
import com.example.bumerang.web.dto.response.admin.UserRespDto;

import java.util.List;

public interface AdminDao {
    List<UserListDto> findUserList();

    List<JobListDto> findJobList();

    List<PfListDto> findPfList();

    List<NoticeListDto> findNoticeList();

    UserRespDto findByUserId(Integer userId);

    void updateUser(UserDetailDto userDetailDto);

    void deleteUser(Integer userId);

    JobDetailDto findByJobId(Integer jobId);

    void updateJob(JobDetailDto jobDetailDto);

    void insertJobPosition(String jobPositionTitle, Integer jobId);

    List<String> findByJobPosition(Integer jobId);

    void deleteJobPosition(Integer jobId);

    void deleteJob(Integer jobId);

    PfDetailDto findByPfId(Integer pfId);

    void updatePf(PfDetailDto pfDetailDto);

    void deletePf(Integer pfId);

    NoticeDetailDto findByNoticeId(Integer noticeId);

    void updateNotice(NoticeDetailDto noticeDetailDto);

    void deleteNotice(Integer noticeId);

    List<JobListDto> findReportJobList();

    List<PfListDto>  findReportPfList();

    List<CommentListDto> findReportCommentList();

    void deleteComment(Integer commentId);

    CommentDetailDto findByCommentId(Integer commentId);

    List<SignupDto> findBySignup();

    List<JSGenreDto> findByGenreJob();

    List<PfGenreDto> findByGenrePf();

    List<PostListDto> findAllPost();

    ViewListDto findByView();

    ExitListDto findByExit();

    List<ViewYAxisDto> jsDailyOfWeekViews();

    List<ViewYAxisDto> jsMonthlyOfViews();

    List<ViewYAxisDto> pfDailyOfWeekViews();

    List<ViewYAxisDto> pfMonthlyOfViews();

    List<BoardCountOfWeekDto> boardCountOfWeek();

}
