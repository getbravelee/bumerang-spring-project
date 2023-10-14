package com.example.bumerang.service;

import com.example.bumerang.domain.user.UserDao;
import com.example.bumerang.web.dto.request.user.JoinDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@RequiredArgsConstructor
@Service
public class UserService {

	private final UserDao userDao;

	public void join(JoinDto joinDto) {
		userDao.insert(joinDto.toEntity());

	}
}
