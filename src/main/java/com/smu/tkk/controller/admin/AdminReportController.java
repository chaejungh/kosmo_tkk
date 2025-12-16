package com.smu.tkk.controller.admin;

import com.smu.tkk.entity.BoardReport;
import com.smu.tkk.service.AdminReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/reports")
@RequiredArgsConstructor
public class AdminReportController {

    private final AdminReportService adminReportService;

    /**
     * 신고 목록 화면
     *   /admin/reports?page=0&status=WAIT
     */
    @GetMapping
    public String list(@RequestParam(defaultValue = "0") int page,
                       @RequestParam(defaultValue = "ALL") String status,
                       Model model) {

        Pageable pageable = PageRequest.of(
                page,
                20,
                Sort.by(Sort.Direction.DESC, "createdAt")
        );

        Page<BoardReport> reports = adminReportService.readReports(pageable, status);

        model.addAttribute("reports", reports);
        model.addAttribute("status", status);

        return "admin/report_list";
    }

    /** 신고만 처리 완료 */
    @PostMapping("/{id}/resolve")
    @ResponseBody
    public ResponseEntity<Void> resolve(@PathVariable("id") Long reportId) {
        adminReportService.markResolved(reportId);
        return ResponseEntity.ok().build();
    }

    /** 게시글/댓글 숨기고 처리 완료 */
    @PostMapping("/{id}/hide")
    @ResponseBody
    public ResponseEntity<Void> hideAndResolve(@PathVariable("id") Long reportId) {
        adminReportService.hideContentAndResolve(reportId);
        return ResponseEntity.ok().build();
    }

    /** 신고 자체 삭제 */
    @DeleteMapping("/{id}")
    @ResponseBody
    public ResponseEntity<Void> delete(@PathVariable("id") Long reportId) {
        adminReportService.deleteReport(reportId);
        return ResponseEntity.ok().build();
    }
}
