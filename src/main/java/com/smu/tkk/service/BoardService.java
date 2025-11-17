package com.smu.tkk.service;

import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.BoardPostImage;
import com.smu.tkk.entity.BoardTag;
import com.smu.tkk.entity.BoardCategory;

import java.sql.SQLException;
import java.util.List;

/**
 * 덕질 게시판 서비스
 *
 * - 게시글 등록/수정/삭제
 * - 게시글 상세 / 목록 / 검색
 * - 이미지 처리
 * - 태그 / 카테고리 처리
 */
public interface BoardService {

    // 1. 게시글 등록
    boolean register(BoardPost post) throws SQLException, IllegalArgumentException;

    // 2. 게시글 수정
    boolean modify(BoardPost post) throws SQLException, IllegalArgumentException;

    // 3. 게시글 삭제
    boolean remove(Long postId) throws SQLException;

    // 4. 게시글 상세 조회
    BoardPost readOne(Long postId) throws SQLException;

    // 5. 게시글 전체 목록 조회
    List<BoardPost> readAll() throws SQLException;

    // 6. 게시글 검색 (제목·내용·태그 등은 구현할 때 team rule)
    List<BoardPost> readByKeyword(String keyword) throws SQLException;

    // 7. 카테고리별 게시글 조회 (옵션)
    List<BoardPost> readByCategory(Long categoryId) throws SQLException;

    // 8. 게시판 카테고리 전체 조회
    List<BoardCategory> readAllCategories() throws SQLException;

    // 9. 특정 게시글 이미지 전체 조회
    List<BoardPostImage> readImages(Long postId) throws SQLException;

    // 10. 게시글에 이미지 추가
    boolean addImage(Long postId, BoardPostImage image)
            throws SQLException, IllegalArgumentException;

    // 11. 이미지 삭제
    boolean removeImage(Long imageId) throws SQLException;

    // 12. 게시글의 태그 목록 조회
    List<BoardTag> readTagsByPost(Long postId) throws SQLException;

    // 13. 게시글에 태그 추가
    boolean addTagToPost(Long postId, Long tagId) throws SQLException;

    // 14. 게시글에서 태그 제거
    boolean removeTagFromPost(Long postId, Long tagId) throws SQLException;
}