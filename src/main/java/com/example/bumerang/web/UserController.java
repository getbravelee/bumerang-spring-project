package com.example.bumerang.web;

import com.example.bumerang.domain.user.User;
import com.example.bumerang.service.JobSearchService;
import com.example.bumerang.service.PerformanceService;
import com.example.bumerang.service.UserService;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.user.JoinDto;
import com.example.bumerang.web.dto.request.user.LoginDto;
import com.example.bumerang.web.dto.request.user.PasswdDto;
import com.example.bumerang.web.dto.request.user.UpdateDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.jobSearch.JobListDto;
import com.example.bumerang.web.dto.response.performance.PfListDto;
import com.example.bumerang.web.dto.response.user.SearchIdDto;
import com.example.bumerang.web.dto.response.user.SearchPwDto;
import com.example.bumerang.web.dto.response.user.UserRespDto;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequiredArgsConstructor
@Controller
public class UserController {
    private final HttpSession session;
    private final UserService userService;
    private final JobSearchService jobSearchService;
    private final PerformanceService performanceService;

    // 회원가입 기능
    @PostMapping("/user/join")
    public @ResponseBody CMRespDto<?> join(@RequestBody JoinDto joinDto) {
        String userLoginId = joinDto.getUserLoginId();
        String userNickname = joinDto.getUserNickname();
        String userEmail = joinDto.getUserEmail();
        User loginResult = userService.findByLogin(userLoginId);
        User nicknameResult = userService.findByNickname(userNickname);
        User emailResult = userService.findByEmail(userEmail);
        if (loginResult != null) {
            return new CMRespDto<>(-1, "중복되는 아이디입니다.", null);
        }
        if (nicknameResult != null) {
            return new CMRespDto<>(-1, "중복되는 닉네임입니다.", null);
        }
        if (emailResult != null) {
            return new CMRespDto<>(-1, "중복되는 이메일입니다.", null);
        }
        SessionUserDto joinResult = userService.join(joinDto);
        return new CMRespDto<>(1, "회원가입 성공.", joinResult);
    }

    // 로그인과 회원가입 화면
    @GetMapping("/user/loginForm")
    public String loginForm() {
        return "loginForm";
    }

    // 로그인 기능
    @PostMapping("/user/login")
    public @ResponseBody CMRespDto<?> login(@RequestBody LoginDto loginDto) {
        System.err.println("getUserLoginId" + loginDto.getUserLoginId());
        System.err.println("getUserPassword" + loginDto.getUserPassword());
        SessionUserDto loginResult = userService.findByUser(loginDto);
        System.err.println("loginResultgetUserLoginId" + loginResult.getUserLoginId());
        if (loginResult == null) {
            return new CMRespDto<>(-1, "아이디 혹은 비밀번호를 잘못 입력하셨습니다.", null);
        }
        userService.login(loginResult);
        return new CMRespDto<>(1, "로그인 성공.", loginResult);
    }

    // 로그아웃
    @GetMapping("/s/api/user/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/";
    }

    // 내 회원정보 수정 화면
    @GetMapping("/s/api/user/updateForm/{userId}")
    public String updateForm(Model model) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        UserRespDto userDetail = userService.findByDetail(principal.getUserId());
        // System.err.println("userId"+userDetail.getUserId());
        // System.err.println("userEmail"+userDetail.getUserEmail());
        // System.err.println("userNickname"+userDetail.getUserNickname());
        // System.err.println("userGender"+userDetail.getUserGender());
        // System.err.println("userHeight"+userDetail.getUserHeight());
        // System.err.println("userForm"+userDetail.getUserForm());
        // System.err.println("userTone"+userDetail.getUserTone());
        // System.err.println("userAge"+userDetail.getUserAge());
        // System.err.println("userCareer"+userDetail.getUserCareer());
        // System.err.println("userSkill"+userDetail.getUserSkill());
        // System.err.println("userEducation"+userDetail.getUserEducation());
        // System.err.println("userContactLink"+userDetail.getUserContactLink());
        System.err.println("uftitles"+userDetail.getUftitles());
        model.addAttribute("userDetail", userDetail);
        return "userUpdateForm";
    }

    // 회원 비밀번호 수정
    @PutMapping("/s/api/user/passwdUpdate")
    public @ResponseBody CMRespDto<?> passwdUpdate(@RequestBody PasswdDto passwordDto) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userId = principal.getUserId();

        if (userId == null) {
            return new CMRespDto<>(1, "존재하지 않는 계정입니다.", null);
        }
        System.err.println("디버그userId: " + userId);
        PasswdDto passwd = userService.updatePasswd(passwordDto.getUserPassword(), userId);
        System.err.println("디버그getUserPassword: " + passwd.getUserPassword());
        return new CMRespDto<>(1, "비밀번호 수정 성공.", passwd);
    }

    // 계정 상세 화면
    @GetMapping("s/api/user/detailForm/{userId}")
    public String detailForm(@PathVariable Integer userId, Model model) {
        UserRespDto userDetail = userService.findByDetail(userId);
        model.addAttribute("userDetail", userDetail);
        if (userId == null) {
            return "404";
        }
        return "userDetailForm";
    }

    // 내가 작성한 글 화면
    @GetMapping("/s/api/user/writeListForm")
    public String writeListForm(Model model) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userId = principal.getUserId();
        if (userId == null) {
            return "404";
        }
        List<JobListDto> myJSList = jobSearchService.findMyJSList(userId);
        List<PfListDto> myPfList = performanceService.findMyPfList(userId);
        model.addAttribute("myJSList", myJSList);
        model.addAttribute("myPfList", myPfList);
        return "writeListForm";
    }

    // 아이디 찾기 화면
    @GetMapping("/user/helpId")
    public String helpIdForm() {
        return "helpIdForm";
    }

    // 비밀번호 찾기 화면
    @GetMapping("/user/helpPw")
    public String helpPwForm() {
        return "helpPwForm";
    }

    // 아이디 찾기
    @PostMapping("/user/findId")
    public String searchId(@RequestParam String userEmail, SearchIdDto userEmailId, Model model) {
        userEmailId.setUserEmail(userEmail);
        SearchIdDto userId = userService.findByLoginId(userEmailId);
        if (userId == null) {
            return "redirect:/user/helpId";
        }
        model.addAttribute("userId", userId);
        return "findId";
    }

    // 비밀번호 찾기
    @PostMapping("/user/findPw")
    public String searchPw(@RequestParam String userEmail, SearchPwDto userEmailPw, Model model) {
        userEmailPw.setUserEmail(userEmail);
        SearchPwDto userPw = userService.findByPw(userEmailPw);
        if (userPw == null) {
            return "redirect:/user/helpPw";
        }
        SimpleMailMessage message = userService.sendMessage(userEmailPw);
        return "findPw";
    }

    // 관심목록 화면
    @GetMapping("/s/api/user/likeyListForm")
    public String likeyListForm(Model model) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userId = principal.getUserId();
        if (userId == null) {
            return "404";
        }
        List<JobListDto> LikeyJSDetail = userService.likeyfindAllJSList(userId);
        List<PfListDto> LikeyPFDetail = userService.likeyfindAllPFList(userId);
        model.addAttribute("jobList", LikeyJSDetail);
        model.addAttribute("pfList", LikeyPFDetail);
        return "likeyListForm";
    }

    // 내 회원정보 수정 기능
    @PutMapping("/s/api/user/update")
    public @ResponseBody CMRespDto<?> updateUser(@RequestBody UpdateDto userReqDto) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userId = userReqDto.getUserId();
        Integer userPId = principal.getUserId();
        if (userId.equals(userPId)) {
            // System.err.println("userId"+userReqDto.getUserId());
            // System.err.println("userEmail"+userReqDto.getUserEmail());
            // System.err.println("userNickname"+userReqDto.getUserNickname());
            // System.err.println("userGender"+userReqDto.getUserGender());
            // System.err.println("userHeight"+userReqDto.getUserHeight());
            // System.err.println("userForm"+userReqDto.getUserForm());
            // System.err.println("userTone"+userReqDto.getUserTone());
            // System.err.println("userAge"+userReqDto.getUserAge());
            // System.err.println("userCareer"+userReqDto.getUserCareer());
            // System.err.println("userSkill"+userReqDto.getUserSkill());
            // System.err.println("userEducation"+userReqDto.getUserEducation());
            // System.err.println("userContactLink"+userReqDto.getUserContactLink());
            System.err.println("uftitle" + userReqDto.getUftitle());
            UserRespDto userPS = userService.update(userReqDto);
            return new CMRespDto<>(1, "사용자 정보 변경 성공", userPS);
        }
        return new CMRespDto<>(-1, "실패", null);

    }

    // 프로필 이미지 수정 기능
    @PutMapping("/s/api/user/updateProfile/{userId}")
    public @ResponseBody CMRespDto<?> updateProfile(@PathVariable Integer userId,
                                                    @RequestPart("profileImg") MultipartFile profileImg) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userPId = principal.getUserId();
        if (userId.equals(userPId)) {
            try {
                // 썸네일 업로드 및 업데이트
                String imagePath = userService.uploadProfileImage(profileImg);
                System.err.println("imagePath: " + imagePath);
                System.err.println("userId: " + userId);
                userService.updateProfileImage(userId, imagePath);
                principal.setUserProfileImg(imagePath);
                return new CMRespDto<>(1, "프로필 이미지 변경 성공.", null);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return new CMRespDto<>(-1, "올바르지 않은 요청입니다.", null);
    }

    @PostMapping("/user/withDraw/{userId}")
    public @ResponseBody CMRespDto<?> withDrawUser(@PathVariable Integer userId) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        userService.delete(userId);
        return new CMRespDto<>(1, "프로필 이미지 변경 성공.", null);
    }
}

