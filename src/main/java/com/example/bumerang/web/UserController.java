package com.example.bumerang.web;

import com.example.bumerang.service.UserService;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.user.JoinDto;
import com.example.bumerang.web.dto.request.user.LoginDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;


@RequiredArgsConstructor
@Controller
public class UserController {

    private final UserService userService;

    @GetMapping("/user/joinForm")
    public String joinForm() {
        return "user/joinForm";
    }


    @PostMapping("/user/join")
    public String join(JoinDto joinDto) {
        userService.join(joinDto);
        return "redirect:/ex/selectForm";
    }

    @GetMapping("/user/loginResultForm")
    public String loginResultForm() {
        return "user/loginResultForm";
    }

    @GetMapping("/user/loginForm")
    public String loginForm() {
        return "user/loginForm";
    }

    @PostMapping("/user/login")
    public @ResponseBody CMRespDto<?> login(@RequestBody LoginDto loginDto) {
        SessionUserDto userPS = userService.findByUser(loginDto.getUserLoginId(), loginDto.getUserPassword());
        if (userPS == null) {
            return new CMRespDto<>(-1, "아이디 혹은 비밀번호를 잘못 입력하셨습니다.", null);
        }
        userService.login(userPS);
        return new CMRespDto<>(1, "로그인 성공.", null);

    }
}
