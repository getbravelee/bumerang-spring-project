package com.example.bumerang.service;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.bumerang.domain.likey.LikeyDao;
import com.example.bumerang.domain.user.User;
import com.example.bumerang.domain.user.UserDao;
import com.example.bumerang.domain.userPortfolio.UserPortfolio;
import com.example.bumerang.util.SHA256;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.user.JoinDto;
import com.example.bumerang.web.dto.request.user.LoginDto;
import com.example.bumerang.web.dto.request.user.UpdateDto;
import com.example.bumerang.web.dto.response.likey.LikeyJSListDto;
import com.example.bumerang.web.dto.response.likey.LikeyPFListDto;
import com.example.bumerang.web.dto.response.user.SearchIdDto;
import com.example.bumerang.web.dto.response.user.SearchPwDto;
import com.example.bumerang.web.dto.response.user.UserJobSearchDto;
import com.example.bumerang.web.dto.response.user.UserPerformanceDto;
import com.example.bumerang.web.dto.response.user.UserRespDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class UserService {

    private final HttpSession session;
    private final UserDao userDao;
    private final LikeyDao likeyDao;
    private final JavaMailSender emailSender;
    private final String imageUploadPath = "C:/bumerang/img/"; // 여기서 경로 수정
    private final SHA256 sha256;

    //회원가입
    public SessionUserDto join(JoinDto joinDto) {
        String enPassword = sha256.encrypt(joinDto.getUserPassword()); // 비밀번호 암호화
        joinDto.setUserPassword(enPassword); // 암호화된 비밀번호로 회원가입
        User user = joinDto.toEntity();
         userDao.insert(user);
        SessionUserDto joinResult = userDao.findByUser(joinDto.toLoginDto());
        return joinResult;
    }

    //로그인 정보와 맞는 사용자 찾기
    public SessionUserDto findByUser(LoginDto loginDto) {
        String enPassword = sha256.encrypt(loginDto.getUserPassword());
        loginDto.setUserPassword(enPassword); // 암호화된 비밀번호로 회원가입
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
    public UserRespDto update(UpdateDto updateDto){
        String enPassword = sha256.encrypt(updateDto.getUserPassword());
        updateDto.setUserPassword(enPassword);
        userDao.updateUser(updateDto);
        // 사용자 분야 수정
        List<String> uftitleList = updateDto.getUftitle();
        userDao.fieldDelete(updateDto.getUserId());
        for(String ufTitle : uftitleList){
            userDao.fieldInsert(ufTitle, updateDto.getUserId());
        }
        // 사용자 포트폴리오 수정
        List<UserPortfolio> upList = updateDto.getUserPortfolio();
        userDao.portfolioDelete(updateDto.getUserId());
        for(UserPortfolio userPortfolio : upList){
            userDao.portfolioInsert(userPortfolio);
        }
        UserRespDto updateResult = userDao.findByDetail(updateDto.getUserId());
        List<UserPortfolio> userPortfolioList = userDao.findByPortfolioList(updateDto.getUserId());
        updateResult.setUserPortfolio(userPortfolioList);
        return updateResult;
    }

    //userId로 사용자 정보 보기
    public UserRespDto findByDetail(Integer userId) {
        UserRespDto userDetail = userDao.findByDetail(userId);
        List<UserPortfolio> userPortfolioList = userDao.findByPortfolioList(userId);
        userDetail.setUserPortfolio(userPortfolioList);
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
    public SimpleMailMessage sendMessage(SearchPwDto searchPwDto) {
        String str = randomPw();
        updateNewPw(str, searchPwDto.getUserEmail());
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("#"); //관리자 이메일
        message.setTo(searchPwDto.getUserEmail()); //사용자 이메일
        message.setSubject("비밀번호 찾기 성공 !");
        message.setText("임시 비밀번호는 " + str + "입니다.");
        emailSender.send(message);
        return message;
    }

    public String randomPw() {
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String str = "";

        // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }

    public void updateNewPw(String str, String userEmail){
        String encPassword = sha256.encrypt(str);
        User userPS = userDao.findByEmail(userEmail);
        userDao.updatePw(encPassword, userPS.getUserId());
    }

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

    public User findByLogin(String userLoginId) {
        User userPS = userDao.findByLoginId(userLoginId);
        return userPS;
    }

    public User findByNickname(String userNickname) {
        User userPS = userDao.findByNickname(userNickname);
        return userPS;
    }

    public User findByEmail(String userEmail) {
        User userPS = userDao.findByEmail(userEmail);
        return userPS;
    }
}
