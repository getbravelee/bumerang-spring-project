package com.example.bumerang.domain.likey;

import java.util.List;

public interface LikeyDao {
    public Likey findById(Integer likeyId);

    public List<Likey> findAll();

    public void insert(Likey likey);

    public void delete(Integer likeyId);

    public Integer likeyCount(Integer jobId);
}
