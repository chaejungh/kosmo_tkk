package com.smu.tkk.service;

import com.smu.tkk.entity.BoardBookmark;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BoardBookmarkService {
    BoardBookmark register(Long postId, Long userId) throws Exception; //게시글 북마크 추가
    BoardBookmark remove(Long postId, Long userId) throws Exception; //취소
    List<BoardBookmark> readlist(Long postId, Long userId, Pageable pageable) throws Exception; //북마크 목록 조회

}
