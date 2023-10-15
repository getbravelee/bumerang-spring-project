package com.example.bumerang.service;

import com.example.bumerang.domain.user.User;
import com.example.bumerang.domain.user.UserDao;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.user.JoinDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequiredArgsConstructor
@Service
public class UserService {

	private final HttpSession session;
	private final UserDao userDao;

	public void join(JoinDto joinDto) {
		userDao.insert(joinDto.toEntity());

	}

    public SessionUserDto findByUser(String userLoginId, String userPassword) {
		SessionUserDto userPS = userDao.findByUser(userLoginId, userPassword);
		return userPS;
    }

	public void login(SessionUserDto userPS) {
		session.setAttribute("principal", userPS);
	}

	public List<User> findAll() {
		List<User> userList = userDao.findAll();
		return userList;
	}
}
