package com.example.bumerang.service;

import com.example.bumerang.domain.Likey.LikeyDao;
import com.example.bumerang.domain.user.User;
import com.example.bumerang.domain.user.UserDao;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.user.JoinDto;
import com.example.bumerang.web.dto.request.user.LoginDto;
import com.example.bumerang.web.dto.request.user.UpdateDto;
import com.example.bumerang.web.dto.response.user.UserJobSearchDto;
import com.example.bumerang.web.dto.response.user.UserPerformanceDto;
import com.example.bumerang.web.dto.response.likey.LikeyJSListDto;
import com.example.bumerang.web.dto.response.likey.LikeyPFListDto;
import com.example.bumerang.web.dto.response.user.SearchIdDto;
import com.example.bumerang.web.dto.response.user.SearchPwDto;
import com.example.bumerang.web.dto.response.user.UserRespDto;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;


@RequiredArgsConstructor
@Service
public class UserService {

    private final HttpSession session;
    private final UserDao userDao;
    private final LikeyDao likeyDao;
    private final JavaMailSender emailSender;

    //회원가입
    public SessionUserDto join(JoinDto joinDto) {
        userDao.insert(joinDto.toEntity());
        SessionUserDto joinResult = userDao.findByUser(joinDto.toLoginDto());
        return joinResult;
    }


    //로그인 정보와 맞는 사용자 찾기
    public SessionUserDto findByUser(LoginDto loginDto) {
        SessionUserDto userPS = userDao.findByUser(loginDto);
        return userPS;
    }

    //로그인
    public void login(SessionUserDto userPS) {
        session.setAttribute("principal", userPS);
    }

    //사용자 목록
    public List<User> findAll() {
        List<User> userList = userDao.findAll();
        return userList;
    }

    // userId로 사용자 찾기
    public User findById(Integer userId){
        return userDao.findById(userId);
    }

    // 사용자 정보 수정
    public User update(UpdateDto updateDto){
        userDao.update(updateDto.toEntity());
        User userPS = userDao.findById(updateDto.getUserId());
        return userPS;
    }

    //userId로 사용자 정보 보기
    public UserRespDto findByDetail(Integer userId) {
        UserRespDto userDetail = userDao.findByDetail(userId);
        return userDetail;
    }

    //관심 구인글 록록
    public List<LikeyJSListDto> likeyfindAllJSList() {
        return likeyDao.likeyFindSJList ();
    }

    // 관심 공연글 목록
    public List<LikeyPFListDto> likeyfindAllPFList() {
        return likeyDao.likeyFindPFList();

    }
    public List<UserJobSearchDto> myJSList(Integer userId) {
        List<UserJobSearchDto> myJSList = userDao.myJSList(userId);
        return myJSList;
    }

    public List<UserPerformanceDto> myPfList(Integer userId) {
        List<UserPerformanceDto> myPfList = userDao.myPfList(userId);
        return myPfList;
    }


    // loginId로 사용자 정보 찾기
    public SearchIdDto findByLoginId(SearchIdDto searchIdDto) {
        SearchIdDto userPS = userDao.findToLoginId(searchIdDto);
        return userPS;
    }

    // 비밀번호 찾기
    public SearchPwDto findByPw(SearchPwDto searchPwDto) {
        SearchPwDto userPS = userDao.findToPw(searchPwDto);
        return userPS;
    }

    // 찾은 비밀번호 이메일로 보내주기
    public SimpleMailMessage sendMessage(SearchPwDto userPassword, SearchPwDto searchPwDto) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("pathfineder_@naver.com"); //관리자 이메일
        message.setTo(searchPwDto.getUserEmail()); //사용자 이메일
        message.setSubject("비밀번호 찾기 성공 !");
        message.setText("비밀번호는 " + userPassword.getUserPassword() + "입니다.");
        emailSender.send(message);
        return message;
    }

    private final String imageUploadPath = "C:/project/Spring Project/load"; // 여기서 경로 수정

    public String uploadProfileImage(MultipartFile profileImage) {
        if (!profileImage.isEmpty()) {
            try {
                // 이미지 파일 이름을 랜덤으로 생성
                String fileName = UUID.randomUUID() + "_" + profileImage.getOriginalFilename();
                Path imagePath = Paths.get(imageUploadPath + fileName);

                // 이미지 저장
                profileImage.transferTo(imagePath.toFile());

                // 이미지 파일 경로를 반환
                return imageUploadPath + fileName;
            } catch (IOException e) {
                e.printStackTrace();
                // 이미지 업로드 실패 처리
                return null;
            }
        }
        return null;
    }
    }
