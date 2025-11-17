package com.smu.tkk.service;

import com.smu.tkk.entity.BoardBookmark;

import java.util.List;

public interface BoardBookmarkService {
    BoardBookmark add(long postId, long userId) throws Exception; //게시글 북마크 추가
    BoardBookmark remove(long postId, long userId) throws Exception; //취소
    List<BoardBookmark> readlist(long postId, long userId) throws Exception; //북마크 목록 조회

}
