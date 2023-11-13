package com.example.bumerang.domain.report;

import com.example.bumerang.web.dto.request.report.ReportDto;
import java.util.List;

public interface ReportDao {

    public void insert(Report report);

    public Report findByRecent();

    public ReportDto findByTargetIdPf(Integer targetId);

    public ReportDto findByTargetIdJob(Integer targetId);

    public ReportDto findByTargetIdComment(Integer targetId);
}
