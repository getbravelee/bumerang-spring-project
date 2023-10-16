package com.example.bumerang.web;

import com.example.bumerang.domain.user.User;
import com.example.bumerang.service.UserService;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.user.JoinDto;
import com.example.bumerang.web.dto.request.user.LoginDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequiredArgsConstructor
@Controller
public class UserController {
    private final HttpSession session;
    private final UserService userService;

    // 회원가입 화면
    @GetMapping("/user/joinForm")
    public String joinForm() {
        return "user/joinForm";
    }


    // 회원가입 기능
    @PostMapping("/user/join")
    public String join(JoinDto joinDto) {
        userService.join(joinDto);
        return "redirect:/user/joinListForm";
    }

    // 로그인한 세션 화면
    @GetMapping("/user/loginResultForm")
    public String loginResultForm() {
        return "user/loginResultForm";
    }

    // 로그인 화면
    @GetMapping("/user/loginForm")
    public String loginForm() {
        return "user/loginForm";
    }

    // 로그인 기능
    @PostMapping("/user/login")
    public @ResponseBody CMRespDto<?> login(@RequestBody LoginDto loginDto) {
        SessionUserDto userPS = userService.findByUser(loginDto.getUserLoginId(), loginDto.getUserPassword());
        if (userPS == null) {
            return new CMRespDto<>(-1, "아이디 혹은 비밀번호를 잘못 입력하셨습니다.", null);
        }
        userService.login(userPS);
        return new CMRespDto<>(1, "로그인 성공.", null);
    }

    // 회원가입된 사용자 목록
    @GetMapping("/user/joinListForm")
    public String selectForm(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("userList", users);
        return "user/joinListForm";
    }

    // 로그아웃
    @GetMapping("/user/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/";
    }

}
