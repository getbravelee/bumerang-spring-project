package com.example.bumerang.domain.view;

import java.util.List;

public interface ViewDao {
    public View findById(Integer viewId);

    public List<View> findAll();

    public void insert(View view);

}
