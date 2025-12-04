package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.BoardBookmark;
import com.smu.tkk.repository.BoardBookmarkRepository;
import com.smu.tkk.service.BoardBookmarkService;
import com.smu.tkk.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardBookmarkServiceImp implements BoardBookmarkService {

    private final BoardBookmarkRepository boardBookmarkRepository;

    @Override
    public BoardBookmark register(Long postId, Long memberId) throws Exception {
        if (postId == null || memberId == null) {
            throw new IllegalArgumentException("postId 또는 memberId 가 없습니다.");
        }

        // 이미 북마크 했으면 예외
        if (boardBookmarkRepository.existsByPostIdAndMemberId(postId, memberId)) {
            throw new IllegalStateException("이미 북마크한 게시글입니다.");
        }

        BoardBookmark bookmark = new BoardBookmark();
        bookmark.setPostId(postId);
        bookmark.setMemberId(memberId);

        return boardBookmarkRepository.save(bookmark);
    }

    @Override
    public BoardBookmark remove(Long postId, Long memberId) throws Exception {
        if (postId == null || memberId == null) {
            throw new IllegalArgumentException("postId 또는 memberId 가 없습니다.");
        }

        BoardBookmark bookmark = boardBookmarkRepository
                .findByPostIdAndMemberId(postId, memberId)
                .orElseThrow(() -> new IllegalArgumentException("해당 북마크가 없습니다."));

        boardBookmarkRepository.delete(bookmark);
        return bookmark;
    }

    @Override
    @Transactional(readOnly = true)
    public Page<BoardBookmark> readAll(Long postId, Long memberId, Pageable pageable) throws Exception {
        if (memberId == null) {
            throw new IllegalArgumentException("memberId 가 없습니다.");
        }

        // 일단 해당 회원의 북마크 전체 조회
        List<BoardBookmark> fullList =
                boardBookmarkRepository.findByMemberId(memberId, Pageable.unpaged());

        // postId가 넘어오면 그 게시글만 필터링 (옵션)
        if (postId != null) {
            fullList = fullList.stream()
                    .filter(b -> postId.equals(b.getPostId()))
                    .collect(Collectors.toList());
        }

        int start = (int) pageable.getOffset();
        int end = Math.min(start + pageable.getPageSize(), fullList.size());

        List<BoardBookmark> content;
        if (start > fullList.size()) {
            content = Collections.emptyList();
        } else {
            content = fullList.subList(start, end);
        }

        return new PageImpl<>(content, pageable, fullList.size());
    }

    @Override
    public boolean toggle(Long postId, Long memberId) throws Exception {
        Optional<BoardBookmark> opt = boardBookmarkRepository.findByPostIdAndMemberId(postId,memberId);

        if (opt.isPresent()){
            boardBookmarkRepository.delete(opt.get());
            return false;//북마크 해제상태
        }else {
            register(postId,memberId);
            return true;//북마크 On
        }
    }
}
