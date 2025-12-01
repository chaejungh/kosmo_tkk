package com.smu.tkk.controller;

import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.StoreBookmark;
import com.smu.tkk.service.BoardService;
import com.smu.tkk.service.MemberService;
import com.smu.tkk.service.NoticeService;
import com.smu.tkk.service.StoreService;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/mypage")
@AllArgsConstructor(onConstructor_ = @Autowired)
public class MypageController {

    /**
     * =========================
     * 마이페이지 메인
     * URL : /mypage/{memberId}/
     * View: templates/mypage/mypage_main.html
     * =========================
     */
    private final BoardService boardService;
    private final StoreService storeService;
    private final MemberService memberService;

//    @Autowired
//    public MypageController(BoardService boardService) {
//        this.boardService = boardService;
//    }

    @GetMapping("/{memberId}/")
    public String mypageMainWithId(@PathVariable("memberId") Long memberId, Model model) throws SQLException {
        // TODO: memberId로 내 정보/찜 리스트 등 나중에 로딩
        Member member = memberService.readOne(memberId);
        model.addAttribute("member", member);
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

    /* ======= 아래는 서비스/FAQ/문의 등 기존 URL 그대로 사용 ======= */
    @GetMapping("/{memberId}/posts")
    public String myPosts(
            Model model,
            @PathVariable Long memberId,
            @PageableDefault(size = 10, page = 0, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable
    ) throws SQLException {

        String yN = "N";
        Page<BoardPost> boardsPage = boardService.readByUser(memberId, yN, pageable);
        model.addAttribute("boardsPage", boardsPage);
        return "mypage/board/my_board_posts";
    }

    @GetMapping("/{memberId}/likes")
    public String myPostLike(Model model, @PathVariable Long memberId, Pageable pageable) throws SQLException {

        Page<BoardLike> boardLikes = boardService.readByLike(memberId, pageable);//좋아요한 게시글 목록
        model.addAttribute("boardLikes", boardLikes);
        model.addAttribute("memberId", memberId);
        return "mypage/board/likes";
    }

    @GetMapping("/{memberId}/bookmarks")
    public String myStoreBookmarks(@PathVariable("memberId") Long memberId,
                                   Pageable pageable,
                                   Model model) throws SQLException {
        Page<StoreBookmark> storeBookmarks = storeService.myBookmarks(memberId, pageable);

        model.addAttribute("storeBookmarks", storeBookmarks);
        model.addAttribute("memberId", memberId);

        return "mypage/board/my_board_bookmarks";
    }

    @PostMapping("/{memberId}/profile")
    public String updateProfile(
            @PathVariable Long memberId,
            @RequestParam String nickname,
            @RequestParam String intro,
            @RequestParam(required = false) String profileImage,
            Model model
    ) throws IOException, SQLException {
        Member member = memberService.readOne(memberId);
        member.setNickname(nickname);
        member.setProfileImageUrl(profileImage);
        member.setIntro(intro);
        memberService.modify(member);
        model.addAttribute("member", member);
        return "redirect:/mypage/" + memberId + "/";
    }

}