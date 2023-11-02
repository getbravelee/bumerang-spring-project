package com.example.bumerang.service;

import com.example.bumerang.domain.admin.AdminDao;
import com.example.bumerang.domain.user.UserDao;
import com.example.bumerang.web.dto.response.admin.*;
import com.example.bumerang.web.dto.response.admin.UserRespDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequiredArgsConstructor
@Service
public class AdminService {

    private final HttpSession session;
    private final AdminDao adminDao;

    public List<UserListDto> findUserList() {
        List<UserListDto> userList = adminDao.findUserList();
        return userList;
    }

    public List<JobListDto> findJobList() {
        List<JobListDto> jobList = adminDao.findJobList();
        return jobList;
    }

    public List<PfListDto> findPfList() {
        List<PfListDto> pfList = adminDao.findPfList();
        return pfList;
    }
    public List<NoticeListDto> findNoticeList() {
        List<NoticeListDto> noticeList = adminDao.findNoticeList();
        return noticeList;
    }

    public UserRespDto findByUserId(Integer userId) {
        UserRespDto userPS = adminDao.findByUserId(userId);
        return userPS;
    }

    public UserRespDto updateUser(UserDetailDto userDetailDto) {
        adminDao.updateUser(userDetailDto);
        UserRespDto userPS = adminDao.findByUserId(userDetailDto.getUserId());
        return userPS;
    }

    public UserRespDto deleteUser(Integer userId) {
        adminDao.deleteUser(userId);
        UserRespDto userPS = adminDao.findByUserId(userId);
        return userPS;
    }

    public JobDetailDto findByJobId(Integer jobId) {
        JobDetailDto jobPS = adminDao.findByJobId(jobId);
        return jobPS;
    }

    public JobDetailDto updateJob(JobDetailDto jobDetailDto) {
        adminDao.updateJob(jobDetailDto);
        List<String> jobPositionList = jobDetailDto.getJobPositionTitle();
        adminDao.deleteJobPosition(jobDetailDto.getJobId());
        for(String jobPositionTitle : jobPositionList){
            adminDao.insertJobPosition(jobPositionTitle, jobDetailDto.getJobId());
        }
        JobDetailDto jobPS = adminDao.findByJobId(jobDetailDto.getJobId());
        return jobPS;
    }

    public List<String> findByJobPosition(Integer jobId) {
        List<String> jobPositionTitle = adminDao.findByJobPosition(jobId);
        return jobPositionTitle;
    }

    public JobDetailDto deleteJob(Integer jobId) {
        adminDao.deleteJob(jobId);
        JobDetailDto jobPS = adminDao.findByJobId(jobId);
        return jobPS;
    }

    public PfDetailDto findByPfId(Integer pfId) {
        PfDetailDto pfPS = adminDao.findByPfId(pfId);
        return pfPS;
    }

    public PfDetailDto updatePf(PfDetailDto pfDetailDto) {
        adminDao.updatePf(pfDetailDto);
        PfDetailDto pfPS = adminDao.findByPfId(pfDetailDto.getPfId());
        return pfPS;
    }

    public PfDetailDto deletePf(Integer pfId) {
        adminDao.deletePf(pfId);
        PfDetailDto pfPS = adminDao.findByPfId(pfId);
        return pfPS;
    }

    public NoticeDetailDto findByNoticeId(Integer noticeId) {
        NoticeDetailDto noticePS = adminDao.findByNoticeId(noticeId);
        return noticePS;
    }

    public NoticeDetailDto updateNotice(NoticeDetailDto noticeDetailDto) {
        adminDao.updateNotice(noticeDetailDto);
        NoticeDetailDto noticePS = adminDao.findByNoticeId(noticeDetailDto.getNoticeId());
        return noticePS;
    }

    public NoticeDetailDto deleteNotice(Integer noticeId) {
        adminDao.deleteNotice(noticeId);
        NoticeDetailDto noticePS = adminDao.findByNoticeId(noticeId);
        return noticePS;
    }

    public List<JobListDto> findReportJobList() {
        List<JobListDto> jobList = adminDao.findReportJobList();
        return jobList;
    }

    public List<PfListDto> findReportPfList() {
        List<PfListDto> pfList = adminDao.findReportPfList();
        return pfList;
    }

    public List<CommentListDto> findReportCommentList() {
        List<CommentListDto> commentList = adminDao.findReportCommentList();
        return commentList;
    }

    public CommentDetailDto deleteComment(Integer commentId) {
        adminDao.deleteComment(commentId);
        CommentDetailDto commentPS = adminDao.findByCommentId(commentId);
        return commentPS;
    }

    public List<SignupDto> findBySignup() {
        List<SignupDto> signupPS = adminDao.findBySignup();
        return signupPS;
    }

    public List<JSGenreDto> findByGenreJob() {
        List<JSGenreDto> jobPS = adminDao.findByGenreJob();
        return jobPS;
    }

    public List<PfGenreDto> findByGenrePf() {
        List<PfGenreDto> pfPS = adminDao.findByGenrePf();
        return pfPS;
    }

    public List<PostListDto> findAllPost() {
        List<PostListDto> postPS = adminDao.findAllPost();
        return postPS;
    }

    public ViewListDto findByView() {
        ViewListDto viewPS = adminDao.findByView();
        return viewPS;
    }

    public ExitListDto findByExit() {
        ExitListDto exitPS = adminDao.findByExit();
        return exitPS;
    }

    public List<ViewYAxisDto> jsDailyOfWeekViews() {
        List<ViewYAxisDto> jsViewDaily = adminDao.jsDailyOfWeekViews();
        return jsViewDaily;
    }

    public List<ViewYAxisDto> jsMonthlyOfViews() {
        List<ViewYAxisDto> jsViewMonthly = adminDao.jsMonthlyOfViews();
        return jsViewMonthly;
    }

    public List<ViewYAxisDto> pfDailyOfWeekViews() {
        List<ViewYAxisDto> pfViewDaily = adminDao.pfDailyOfWeekViews();
        return pfViewDaily;
    }

    public List<ViewYAxisDto> pfMonthlyOfViews() {
        List<ViewYAxisDto> pfViewMonthly = adminDao.pfMonthlyOfViews();
        return pfViewMonthly;
    }

    public List<BoardCountOfWeekDto> boardCountOfWeek() {
        List<BoardCountOfWeekDto> boardCountOfWeek = adminDao.boardCountOfWeek();
        return boardCountOfWeek;
    }
}
