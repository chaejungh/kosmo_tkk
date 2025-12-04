package com.smu.tkk.service;

import com.smu.tkk.entity.BoardBookmark;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BoardBookmarkService {
    BoardBookmark register(Long postId, Long memberId) throws Exception; //게시글 북마크 추가
    BoardBookmark remove(Long postId, Long memberId) throws Exception; //취소
    Page<BoardBookmark> readAll(Long postId, Long memberId, Pageable pageable) throws Exception; //북마크 목록 조회
    boolean toggle(Long postId, Long memberId) throws Exception;
}
