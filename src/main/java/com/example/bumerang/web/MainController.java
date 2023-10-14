package com.example.bumerang.web;

import com.example.bumerang.domain.user.UserDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@RequiredArgsConstructor
@Controller
public class MainController {

	private final UserDao userDao;

	@GetMapping("/")
	public String hello() {
		return "mainForm";
	}
}
