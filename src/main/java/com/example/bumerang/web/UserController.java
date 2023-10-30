package com.example.bumerang.web;

import com.example.bumerang.domain.user.User;
import com.example.bumerang.service.UserService;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.user.*;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.user.UserCreateRespoDto;
import com.example.bumerang.web.dto.response.user.UserJobSearchDto;
import com.example.bumerang.web.dto.response.user.UserPerformanceDto;
import com.example.bumerang.web.dto.response.likey.LikeyJSListDto;
import com.example.bumerang.web.dto.response.likey.LikeyPFListDto;
import com.example.bumerang.web.dto.response.likey.LikeyRespDto;
import com.example.bumerang.web.dto.response.user.SearchIdDto;
import com.example.bumerang.web.dto.response.user.SearchPwDto;
import com.example.bumerang.web.dto.response.user.UserRespDto;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


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
    @PostMapping("/user/logout")
    public @ResponseBody CMRespDto<?> logout() {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        if(principal==null){
            return new CMRespDto<>(-1, "로그인 상태가 아닙니다.", null);
        }
        session.invalidate();
        return new CMRespDto<>(1, "로그아웃 성공.", principal);
    }
    // 회원수정기능
    @PutMapping("/user/update")
    public @ResponseBody CMRespDto<?> update(@RequestBody UpdateDto updateDto) {
        User userUpdateResult = userService.update(updateDto);
        return new CMRespDto<>(1, "회원수정 성공.", userUpdateResult );
    }

    // 계정 상세 화면
    @GetMapping("/user/detailForm/{userId}")
    public @ResponseBody CMRespDto<?> detailForm(@PathVariable Integer userId) {
        UserRespDto userDetail = userService.findByDetail(userId);
        return new CMRespDto<>(1, "계정정보 불러오기 성공.", userDetail);
    }

    // 내가 작성한 구인글 화면
    @GetMapping("/user/{userId}/posts")
    public @ResponseBody CMRespDto<?> jobPostsForm(@PathVariable Integer userId) {
        UserCreateRespoDto respoDto = new UserCreateRespoDto();
        List<UserJobSearchDto> myJSList = userService.myJSList(userId);
        List<UserPerformanceDto> myPfList = userService.myPfList(userId);
        respoDto.setMyJSList(myJSList);
        respoDto.setMyPfList(myPfList);
        return new CMRespDto<>(1, "작성한 글 불러오기 성공.", respoDto);
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
        SearchIdDto userPS = userService.findByLoginId(searchIdDto);
        return new CMRespDto<>(1, "아이디 찾기 성공.", userPS);
    }

    // 비밀번호 찾기
    @PostMapping("/user/searchPw")
    public @ResponseBody CMRespDto<?> searchPw(@RequestBody SearchPwDto searchPwDto) {
        SearchPwDto userPassword = userService.findByPw(searchPwDto);
        SimpleMailMessage message = userService.sendMessage(userPassword, searchPwDto);
        return new CMRespDto<>(1, "비밀번호 찾기 성공.", message);
    }

    // 관심목록 화면
    @GetMapping("/user/likeyList")
    public @ResponseBody CMRespDto<?> liketyJSListForm(){
        LikeyRespDto LikeyResp = new LikeyRespDto();
        List<LikeyJSListDto> LikeyJSDetail = userService.likeyfindAllJSList();
        List<LikeyPFListDto> LikeyPFDetail = userService.likeyfindAllPFList();
        LikeyResp.setLJSList(LikeyJSDetail);
        LikeyResp.setLPFList(LikeyPFDetail);
        return new CMRespDto<>(1, "관심목록 불러오기 성공.", LikeyResp);
    }
}

