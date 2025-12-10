package com.smu.tkk.service;

import com.smu.tkk.entity.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.services.s3.model.ObjectPart;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

/**
 * 덕질 게시판 서비스
 *
 * - 게시글 등록/수정/삭제
 * - 게시글 상세 / 목록 / 검색
 * - 이미지 처리
 * - 태그 / 카테고리 처리
 */
public interface BoardService {

    // 1. 게시글 등록(레파지토리 완료)
    boolean register(BoardPost post) throws SQLException, IllegalArgumentException;
    void createPostWithImages(BoardPost post, List<MultipartFile> images);
    // 2. 게시글 수정(레파지토리 완료)
    boolean modify(BoardPost post) throws SQLException, IllegalArgumentException;

    // 3. 게시글 삭제
    boolean remove(Long postId) throws SQLException;

    // 4. 게시글 상세 조회(레파지토리 완료)
    BoardPost readOne(Long postId) throws SQLException;

    // 🔥 조회수 증가
    void increaseViewCount(Long postId) throws SQLException;

    // 5. 게시글 전체 목록 조회(레파지토리 완료)
    Page<BoardPost> readAll(Pageable pageable) throws SQLException;

    // 6. 게시글 검색 (제목 등은 구현할 때 team rule)(레파지토리 완료)
    Page<BoardPost> readByKeyword(String keyword,Pageable pageable) throws SQLException;

    /// 6-1. 게시글 검색 (제목·내용·태그 등은 구현할 때 team rule)(레파지토리 완료)
    Page<BoardPost> readByNickname(String nickname,Pageable pageable) throws SQLException;
    // 7. 카테고리별 게시글 조회 (옵션)(레파지토리 완료)
    Page<BoardPost> readByCategory(Long categoryId,Pageable pageable) throws SQLException;

    // 8. 게시판 카테고리 전체 조회(레파지토리 완료)
    List<BoardCategory> readAllCategories() throws SQLException;

    // 9. 특정 게시글 이미지 전체 조회(레파지토리 완료)
    List<BoardPostImage> readImages(Long postId) throws SQLException;

    Optional<BoardPostImage> readOneImg(Long postId) throws SQLException;
    // 10. 게시글에 이미지 추가(레파지토리 완료)
    boolean addImage(Long postId, BoardPostImage image)
            throws SQLException, IllegalArgumentException;

    // 11. 이미지 삭제(레파지토리 완료)
    boolean removeImage(Long imageId) throws SQLException;

    // 12. 게시글의 태그 목록 조회(레파지토리 완료)
    List<BoardTag> readTagsByPost(Long postId) throws SQLException;

    // 13. 게시글에 태그 추가(레파지토리 완료)
    boolean addTagToPost(Long postId, Long tagId) throws SQLException;

    // 14. 게시글에서 태그 제거(레파지토리 완료)
    boolean removeTagFromPost(Long postId, Long tagId) throws SQLException;

    // 15. 특정 아이디가 좋아요 한 글 전체 조회 (레파지토리 완료)
    Page<BoardLike> readByLike(Long memberId, Pageable pageable) throws SQLException;

    // 16. 신고목록에 추가(레파지토리 완료)
    boolean register(BoardReport report) throws SQLException, IllegalArgumentException;
    
    // 17. 신고목록 삭제(레파지토리 완료)
    boolean remove(BoardReport report) throws SQLException, IllegalArgumentException;

    //18. 유저로 삭제 유무 게시글 조회
    Page<BoardPost> readByUser(Long memberId,String yN, Pageable pageable) throws SQLException;


    List<BoardPost> getHotPostsInCategory(Long categoryId);

    List<BoardPost> getHotPostsAll();

    boolean isLiked(Long postId, Long memberId);

}