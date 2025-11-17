package com.smu.tkk.service;

import com.smu.tkk.entity.BoardCategory;
import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.BoardTag;

import java.util.List;

public interface BoardService {

    // 1. 게시글 작성
    BoardPost createPost(BoardPost post,
                         List<String> tagNames,
                         List<String> imageUrls);

    // 2. 게시글 수정
    BoardPost updatePost(Long postId,
                         BoardPost updateData,
                         List<String> tagNames,
                         List<String> imageUrls);

    // 3. 게시글 삭제 (소프트 삭제 가정: deletedYn = 'Y')
    void deletePost(Long postId, Long memberId);

    // 4. 게시글 상세 조회 (조회수 +1 포함)
    BoardPost getPostDetail(Long postId);

    // 5. 게시글 리스트 조회 (카테고리별)
    List<BoardPost> getPostListByCategoryCode(String categoryCode);

    // 6. 게시글 검색 (제목 + 내용 + 태그명)
    List<BoardPost> searchPosts(String keyword);

    // 7. 카테고리 전체 조회
    List<BoardCategory> getAllCategories();

    // 8. 게시글 태그 조회
    List<BoardTag> getTagsByPost(Long postId);
}