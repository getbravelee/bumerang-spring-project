package com.example.bumerang.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bumerang.domain.user.User;
import com.example.bumerang.service.UserService;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.user.JoinDto;
import com.example.bumerang.web.dto.request.user.LoginDto;
import com.example.bumerang.web.dto.request.user.UpdateDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.likey.LikeyJSListDto;
import com.example.bumerang.web.dto.response.likey.LikeyPFListDto;
import com.example.bumerang.web.dto.response.likey.LikeyRespDto;
import com.example.bumerang.web.dto.response.user.SearchIdDto;
import com.example.bumerang.web.dto.response.user.SearchPwDto;
import com.example.bumerang.web.dto.response.user.UserCreateRespoDto;
import com.example.bumerang.web.dto.response.user.UserJobSearchDto;
import com.example.bumerang.web.dto.response.user.UserPerformanceDto;
import com.example.bumerang.web.dto.response.user.UserRespDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class UserController {
    private final HttpSession session;
    private final UserService userService;

    // 회원가입 화면
    @GetMapping("/user/joinForm")
    public @ResponseBody CMRespDto<?> joinForm() {
        return new CMRespDto<>(1, "회원가입 화면 불러오기 성공.", null);
    }

    // 회원가입 기능
    @PostMapping("/user/join")
    public @ResponseBody CMRespDto<?> join(@RequestBody JoinDto joinDto) {
        SessionUserDto findByUser = userService.findByUser(joinDto.toLoginDto());
        if (findByUser != null) {
            return new CMRespDto<>(-1, "이미 가입되어 있는 회원입니다.", null);
        }
        SessionUserDto joinResult = userService.join(joinDto);
        return new CMRespDto<>(1, "회원가입 성공.", joinResult);
    }
    // 로그인 화면
    @GetMapping("/user/loginForm")
    public @ResponseBody CMRespDto<?> loginForm() {
        return new CMRespDto<>(1, "로그인 화면 불러오기 성공.", null);
    }

    // 로그인 기능
    @PostMapping("/user/login")
    public @ResponseBody CMRespDto<?> login(@RequestBody LoginDto loginDto) {
        SessionUserDto loginResult = userService.findByUser(loginDto);
        if (loginResult == null) {
            return new CMRespDto<>(-1, "아이디 혹은 비밀번호를 잘못 입력하셨습니다.", null);
        }
        userService.login(loginResult);
        return new CMRespDto<>(1, "로그인 성공.", loginResult);
    }

    // 로그아웃
    @PostMapping("/s/api/user/logout")
    public @ResponseBody CMRespDto<?> logout() {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        if(principal==null){
            return new CMRespDto<>(-1, "로그인 상태가 아닙니다.", null);
        }
        session.invalidate();
        return new CMRespDto<>(1, "로그아웃 성공.", principal);
    }

    // 회원수정기능
    @PutMapping("/s/api/user/update")
    public @ResponseBody CMRespDto<?> update(@RequestBody UpdateDto updateDto) {
        SessionUserDto principal = (SessionUserDto)session.getAttribute("principal");
        Integer userId = updateDto.getUserId();
        Integer userPId = principal.getUserId();
        if(userId.equals(userPId)){
            User userUpdateResult = userService.update(updateDto);
            return new CMRespDto<>(1, "회원정보 수정 성공.", userUpdateResult );
        }
        return new CMRespDto<>(-1, "올바르지 않은 요청입니다.", null);
    }

    // 계정 상세 화면
    @GetMapping("/s/api/user/detailForm")
    public @ResponseBody CMRespDto<?> detailForm() {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userId = principal.getUserId();
        UserRespDto userDetail = userService.findByDetail(userId);
        return new CMRespDto<>(1, "계정정보 불러오기 성공.", userDetail);
    }

    // 내가 작성한 구인글 화면
    @GetMapping("/s/api/user/writeListForm")
    public @ResponseBody CMRespDto<?> writeListForm() {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userId = principal.getUserId();
        UserCreateRespoDto userWriteList = new UserCreateRespoDto();
        List<UserJobSearchDto> myJSList = userService.myJSList(userId);
        List<UserPerformanceDto> myPfList = userService.myPfList(userId);
        userWriteList.setMyJSList(myJSList);
        userWriteList.setMyPfList(myPfList);
        return new CMRespDto<>(1, "작성한 글 불러오기 성공.", userWriteList);
    }

    // 아이디 찾기 화면
    @GetMapping("/user/searchIdForm")
    public @ResponseBody CMRespDto<?> searchIdForm() {
        return new CMRespDto<>(1, "아이디 찾기 화면 불러오기 성공.", null);
    }


    // 비밀번호 찾기 화면
    @GetMapping("/user/searchPwForm")
    public @ResponseBody CMRespDto<?> searchPwForm() {
        return new CMRespDto<>(1, "비밀번호 찾기 화면 불러오기 성공.", null);
    }

    // 아이디 찾기
    @PostMapping("/user/searchId")
    public @ResponseBody CMRespDto<?> searchId(@RequestBody SearchIdDto searchIdDto) {
        SearchIdDto userLoginId = userService.findByLoginId(searchIdDto);
        return new CMRespDto<>(1, "아이디 찾기 성공.", userLoginId);
    }

    // 비밀번호 찾기
    @PostMapping("/user/searchPw")
    public @ResponseBody CMRespDto<?> searchPw(@RequestBody SearchPwDto searchPwDto) {
        SearchPwDto userPassword = userService.findByPw(searchPwDto);
        SimpleMailMessage message = userService.sendMessage(userPassword, searchPwDto);
        return new CMRespDto<>(1, "비밀번호 찾기 성공.", message);
    }

    // 관심목록 화면
    @GetMapping("/s/api/user/likeyListForm")
    public @ResponseBody CMRespDto<?> likeyListForm(){
        LikeyRespDto userLikeyList = new LikeyRespDto();
        List<LikeyJSListDto> LikeyJSDetail = userService.likeyfindAllJSList();
        List<LikeyPFListDto> LikeyPFDetail = userService.likeyfindAllPFList();
        userLikeyList.setLJSList(LikeyJSDetail);
        userLikeyList.setLPFList(LikeyPFDetail);
        return new CMRespDto<>(1, "관심목록 불러오기 성공.", userLikeyList);
    }
}

