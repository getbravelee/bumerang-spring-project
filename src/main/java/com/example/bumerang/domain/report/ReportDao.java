package com.example.bumerang.domain.report;

import java.util.List;

public interface ReportDao {

    public void insert(Report report);

    public Report findByRecent();
}
