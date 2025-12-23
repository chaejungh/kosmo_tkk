package com.smu.tkk.controller;

import com.smu.tkk.entity.*;
import com.smu.tkk.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.sql.SQLException;

@Controller
@RequestMapping("/mypage")
@AllArgsConstructor(onConstructor_ = @Autowired)
public class MypageController {

    private final BoardService boardService;
    private final StoreService storeService;
    private final MemberService memberService;
    private final BoardBookmarkService boardBookmarkService;

    /**
     * =========================
     * 마이페이지 메인
     * URL : /mypage/{memberId}/
     * View: templates/mypage/mypage_main.html
     * =========================
     */
    @GetMapping("/{memberId}/")
    public String mypageMainWithId(@PathVariable("memberId") Long memberId,
                                   Model model,
                                   HttpSession session) throws SQLException {

        Member member = memberService.readOne(memberId);

        // ✅ 세션 안정화 (다른 컨트롤러/페이지에서 @SessionAttribute(loginMember/memberId) 쓰면 터지니까)
        session.setAttribute("memberId", memberId);
        session.setAttribute("loginMember", member);

        model.addAttribute("member", member);
        model.addAttribute("memberId", memberId);
        return "mypage/mypage_main";
    }

    /**
     * 기존 /mypage 진입은 임시로 memberId=1로 리다이렉트
     * 나중에 로그인/세션 붙이면 현재 로그인한 회원 ID로 바꿔주면 됨.
     */
    @GetMapping()
    public String legacyMypageMain(HttpSession session) {
        Long memberId = (Long) session.getAttribute("memberId");
        return "redirect:/mypage/" + memberId + "/";
    }

    /* =========================
       내가 쓴 게시글
       ========================= */
    @GetMapping("/{memberId}/posts")
    public String myPosts(
            Model model,
            @PathVariable("memberId") Long memberId,
            @SessionAttribute(name = "memberId", required = false) Long sessionMemberId,
            @PageableDefault(size = 10, page = 0, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable,
            HttpSession session
    ) throws SQLException {

        // ✅ 세션 없으면 PathVariable로 fallback (400 방지)
        Long effectiveMemberId = (sessionMemberId != null) ? sessionMemberId : memberId;
        session.setAttribute("memberId", effectiveMemberId);

        String yN = "N";
        Page<BoardPost> boardsPage = boardService.readByUser(effectiveMemberId, yN, pageable);
        model.addAttribute("boardsPage", boardsPage);
        model.addAttribute("memberId", effectiveMemberId);

        return "mypage/board/my_board_posts";
    }

    @PostMapping("/profile/{memberId}")
    public String profileNickname(
            @PathVariable Long memberId,
            @RequestParam String nickname,
            Model model
    ) throws SQLException {
        Member member = memberService.readOne(memberId);
        member.setNickname(nickname);
        memberService.modify(member);
        model.addAttribute("member", member);
        return "redirect:/mypage/" + memberId;
    }

    @GetMapping("/{memberId}/likes")
    public String myPostLike(Model model, @PathVariable Long memberId, Pageable pageable) throws SQLException {
        Page<BoardLike> boardLikes = boardService.readByLike(memberId, pageable);
        model.addAttribute("boardLikes", boardLikes);
        model.addAttribute("memberId", memberId);
        return "mypage/board/likes";
    }

    @GetMapping("/{memberId}/bookmarks")
    public String myPostBookmarks(@PathVariable Long memberId,
                                  Pageable pageable,
                                  Model model) throws Exception {

        Page<BoardBookmark> postBookmarks = boardBookmarkService.readByMemberId(memberId, pageable);

        model.addAttribute("postBookmarks", postBookmarks);
        model.addAttribute("memberId", memberId);

        return "mypage/board/my_board_bookmarks";
    }

    @PostMapping("/{memberId}/profile")
    public String updateProfile(
            @PathVariable Long memberId,
            @RequestParam String nickname,
            @RequestParam String intro,
            @RequestParam(required = false) String profileImage,
            Model model,
            HttpSession session
    ) throws IOException, SQLException {
        Member member = memberService.readOne(memberId);
        member.setNickname(nickname);

        String newIntro = "안녕하세요, " + nickname + "입니다.";
        member.setIntro(newIntro);

        member.setProfileImageUrl(profileImage);
        memberService.modify(member);

        // ✅ 갱신된 멤버도 세션에 같이 갱신 (loginMember 필요 페이지 안정화)
        session.setAttribute("memberId", memberId);
        session.setAttribute("loginMember", member);

        model.addAttribute("member", member);
        return "redirect:/mypage/" + memberId + "/";
    }

    @GetMapping("/{memberId}/settings/alarm")
    public String alarmSettings(@PathVariable("memberId") Long memberId,
                                @SessionAttribute(name = "memberId", required = false) Long sessionMemberId,
                                Model model,
                                HttpSession session) throws SQLException {

        // ✅ 세션 없으면 PathVariable로 fallback (400 방지)
        Long effectiveMemberId = (sessionMemberId != null) ? sessionMemberId : memberId;
        session.setAttribute("memberId", effectiveMemberId);

        model.addAttribute("member", effectiveMemberId);
        return "mypage/service/setting_alarm";
    }

    @Controller
    @RequiredArgsConstructor
    @RequestMapping("/mypage/service")
    public class MyPageServiceController {

        private final MemberService memberService;

        @PostMapping("/updateEmail")
        public String updateEmail(@RequestParam Long memberId,
                                  @RequestParam String email,
                                  RedirectAttributes redirectAttributes) {

            try {
                memberService.updateEmail(memberId, email);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            redirectAttributes.addFlashAttribute("msg", "이메일이 변경되었습니다.");
            return "redirect:/mypage/service/setting";
        }
    }
}