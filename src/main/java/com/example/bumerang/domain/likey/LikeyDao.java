package com.example.bumerang.domain.likey;

import com.example.bumerang.web.dto.response.Likey.LikeyJSListDto;
import com.example.bumerang.web.dto.response.Likey.LikeyPFListDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LikeyDao {

    public Likey findById(Integer likeyId);

    public List<Likey> findAll();

    public void insert(Likey likey);

    public void delete(Integer likeyId);

    public Integer findByJobId(@Param("userId") Integer userId, @Param("jobId") Integer jobId);

    public Integer findByPfId(@Param("userId") Integer userId, @Param("pfId") Integer pfId);

    public Integer findByCommentId(@Param("userId") Integer userId, @Param("commentId") Integer commentId);

    public Likey findByRecent();

    List<LikeyJSListDto> likeyFindSJList();

    List<LikeyPFListDto> likeyFindPFList();
}
