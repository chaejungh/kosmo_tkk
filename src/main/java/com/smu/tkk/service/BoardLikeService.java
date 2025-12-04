package com.smu.tkk.service;

import com.smu.tkk.entity.BoardLike;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface BoardLikeService {
    BoardLike registerOne(Long postId, Long userId) throws Exception; //게시글 좋아요 레파지토리 완료
    BoardLike removeOne(Long postId, Long userId) throws Exception; //좋아요 취소
    BoardLike readlikecount(Long postId, Long userId) throws Exception; //좋아요 개수 관리

    Page<BoardLike> readLikesByMember(Long memberId, Pageable pageable);

}
