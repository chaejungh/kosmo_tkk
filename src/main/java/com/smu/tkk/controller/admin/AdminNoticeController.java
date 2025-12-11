package com.smu.tkk.controller.admin;

import com.smu.tkk.config.NotificationPublisher;
import com.smu.tkk.entity.ServiceNotice;
import com.smu.tkk.service.AdminNoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;

@Controller
@RequestMapping("/admin/notices")
@RequiredArgsConstructor
public class AdminNoticeController {

    private final AdminNoticeService adminNoticeService;
    private final NotificationPublisher notificationPublisher;

    @GetMapping
    public String list(@RequestParam(defaultValue = "0") int page,
                       @RequestParam(defaultValue = "20") int size,
                       @RequestParam(required = false) String keyword,
                       Model model) {

        Page<ServiceNotice> noticePage = adminNoticeService.getNoticePage(page, size, keyword);

        model.addAttribute("noticePage", noticePage);
        model.addAttribute("currentPage", page);
        model.addAttribute("size", size);
        model.addAttribute("keyword", keyword);

        return "admin/notice_list";
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable Long id,
                         @ModelAttribute("msg") String msg,
                         Model model) {

        ServiceNotice notice = adminNoticeService.getNotice(id);

        model.addAttribute("notice", notice);
        model.addAttribute("msg", msg);

        return "admin/notice_detail";
    }

    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id,
                       @RequestParam String title,
                       @RequestParam String content,
                       @RequestParam String noticeType,
                       @RequestParam(required = false) String startDate,
                       @RequestParam(required = false) String endDate,
                       RedirectAttributes redirectAttributes) {

        adminNoticeService.updateNotice(
                id, title, content, noticeType,
                startDate != null ? java.time.LocalDate.parse(startDate) : null,
                endDate != null ? java.time.LocalDate.parse(endDate) : null
        );

        redirectAttributes.addFlashAttribute("msg", "공지사항이 수정되었습니다.");
        return "redirect:/admin/notices/" + id;
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id,
                         RedirectAttributes redirectAttributes) {

        adminNoticeService.deleteNotice(id);

        redirectAttributes.addFlashAttribute("msg", "공지사항이 삭제되었습니다.");
        return "redirect:/admin/notices";
    }

    @GetMapping("/write")
    public String writeForm() {
        return "admin/notice_write";
    }


    @PostMapping("/create")
    public String createNotice(
            @RequestParam String title,
            @RequestParam String content,
            @RequestParam String noticeType,
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate,
            RedirectAttributes redirectAttributes) {

        ServiceNotice notice = adminNoticeService.createNotice(
                title,
                content,
                noticeType,
                startDate != null ? LocalDate.parse(startDate) : null,
                endDate != null ? LocalDate.parse(endDate) : null
        );

        // 🔥 공지 생성 후 전체 알림 전송
        notificationPublisher.sendToAll(
                "📢 새로운 공지사항이 등록되었습니다: " + title,
                "notice-alert"
        );

        redirectAttributes.addFlashAttribute("msg", "공지사항이 등록되었습니다.");
        return "redirect:/admin/notices";
    }
}
