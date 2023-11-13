package com.example.bumerang.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.bumerang.domain.performance.Performance;
import com.example.bumerang.service.PerformanceService;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.performance.UpdateDto;
import com.example.bumerang.web.dto.request.performance.WriteDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.performance.DetailFormDto;
import com.example.bumerang.web.dto.response.performance.PfRespDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class PerformanceController {

    private final HttpSession session;
    private final PerformanceService performanceService;

    // 공연글 작성하기 화면
    @GetMapping("/s/api/performance/writeForm")
    public String writeForm() {
        return "pfWriteForm";
    }

    // 공연글 등록하기 기능
    @PostMapping("/s/api/performance/write")
    public @ResponseBody CMRespDto<?> write(@RequestPart("thumbnail") MultipartFile thumbnail,
            @RequestPart("writeDto") WriteDto writeDto) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userId = writeDto.getUserId();
        Integer userPId = principal.getUserId();
        if (userId.equals(userPId)) {
            try {
                // 썸네일 업로드 및 업데이트
                String imagePath = performanceService.uploadThumbnail(thumbnail);
                // UpdateDto에 imagePath를 설정
                writeDto.setPfThumbnail(imagePath);
                // 공연글 등록 업데이트
                PfRespDto writeResult = performanceService.write(writeDto);
                return new CMRespDto<>(1, "공연글 등록 성공.", writeResult);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return new CMRespDto<>(-1, "올바르지 않은 요청입니다.", null);
    }

    // 공연글 상세보기 화면
    @GetMapping("/s/api/performance/detailForm/{pfId}")
    public String detailForm(@PathVariable Integer pfId, Model model) {
        Performance pfPS = performanceService.findById(pfId);
        if (pfPS == null) {
            return "redirect:/404";
        }
        SessionUserDto userPS = (SessionUserDto) session.getAttribute("principal");
        Integer userId = userPS.getUserId();
        DetailFormDto pfDetail = performanceService.findByPf(userId, pfId);
        model.addAttribute("pf", pfDetail);
        return "pfDetailForm";
    }

    // 공연글 수정하기 화면
    @GetMapping("/s/api/performance/updateForm/{pfId}")
    public String updateForm(@PathVariable Integer pfId, Model model) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Performance pfPS = performanceService.findById(pfId);
        Integer userId = pfPS.getUserId();
        Integer userPId = principal.getUserId();
        if (userId.equals(userPId)) {
            DetailFormDto pfDetail = performanceService.findByPf(userId, pfId);
            model.addAttribute("pf", pfDetail);
            return "pfUpdateForm";
        }
        return null;
    }

    // 공연글 수정하기 기능
    @PutMapping("/s/api/performance/update")
    public @ResponseBody CMRespDto<?> update(@RequestPart("thumbnail") MultipartFile thumbnail,
            @RequestPart("updateDto") UpdateDto updateDto) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userId = updateDto.getUserId();
        Integer userPId = principal.getUserId();
        System.err.println("컨트롤러 입성");
        if (userId.equals(userPId)) {
            // 썸네일 업로드 및 업데이트
            String imagePath = performanceService.uploadThumbnail(thumbnail);
            // UpdateDto에 imagePath를 설정
            updateDto.setPfThumbnail(imagePath);
            // 공연글 수정 업데이트
            Performance updateResult = performanceService.update(updateDto);
            return new CMRespDto<>(1, "공연글 수정 성공.", updateResult);
            // 공연글 수정 업데이트
        }
        return new CMRespDto<>(-1, "올바르지 않은 요청입니다.", null);
    }

    // 썸네일 없는 게시글 수정 응답
    @PutMapping("/s/api/performance/update/noThumbnail")
    public @ResponseBody CMRespDto<?> updateNoImg(@RequestBody UpdateDto updateDto) {
         SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userId = updateDto.getUserId();
        Integer userPId = principal.getUserId();
        if (userId.equals(userPId)) {
            performanceService.updateNoTumbnail(updateDto);
            return new CMRespDto<>(1, "썸네일없는게시글 수정 성공", null);
        }
        return new CMRespDto<>(-1, "올바르지 않은 요청입니다.", null);
    }

    // 공연글 삭제하기 기능
    @DeleteMapping("/s/api/performance/delete")
    public @ResponseBody CMRespDto<?> delete(@RequestBody DetailFormDto detailFormDto) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userId = detailFormDto.getUserId();
        Integer pfId = detailFormDto.getPfId();
        Integer userPId = principal.getUserId();
        if (userId.equals(userPId)) {
            Performance deleteResult = performanceService.delete(pfId);
            return new CMRespDto<>(1, "공연글 삭제하기 성공.", deleteResult);
        }
        return new CMRespDto<>(-1, "올바르지 않은 요청입니다.", null);
    }

}

