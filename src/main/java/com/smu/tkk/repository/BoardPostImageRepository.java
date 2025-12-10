package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardPostImage;
import com.smu.tkk.entity.TradePostImage;
import org.hibernate.query.Page;
import org.springframework.data.jpa.repository.JpaRepository;

import java.awt.print.Pageable;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface BoardPostImageRepository extends JpaRepository<BoardPostImage, Long> {
    // 9. 특정 게시글 이미지 전체 조회
    List<BoardPostImage> findAllByPostId(Long postId ) throws SQLException;

    Optional<BoardPostImage> findFirstByPostIdOrderBySortOrderAscIdAsc(Long postId);
//    // 10. 게시글에 이미지 추가
//    boolean addImage(Long postId, BoardPostImage image)
//            throws SQLException, IllegalArgumentException;

}