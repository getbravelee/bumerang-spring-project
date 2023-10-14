package com.example.bumerang.web;

import com.example.bumerang.service.UserService;
import com.example.bumerang.web.dto.request.user.JoinDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@RequiredArgsConstructor
@Controller
public class UserController {

	private final UserService userService;

	@GetMapping("/user/joinForm")
	public String joinForm()
	{
		return "user/joinForm";
	}


	@PostMapping ("/user/join")
	public String join(JoinDto joinDto) {
		userService.join(joinDto);
		return "redirect:/ex/selectForm";
	}

}
