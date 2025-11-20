package com.smu.tkk.service;

import com.smu.tkk.entity.BoardLike;

public interface BoardLikeService {
    BoardLike registerOne(Long postId, Long userId) throws Exception; //게시글 좋아요
    BoardLike removeOne(Long postId, Long userId) throws Exception; //좋아요 취소
    BoardLike readlikecount(Long postId, Long userId) throws Exception; //좋아요 개수 관리
}
