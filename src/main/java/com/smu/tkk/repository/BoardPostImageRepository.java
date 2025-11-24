package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardPostImage;
import org.hibernate.query.Page;
import org.springframework.data.jpa.repository.JpaRepository;

import java.awt.print.Pageable;
import java.sql.SQLException;
import java.util.List;

public interface BoardPostImageRepository extends JpaRepository<BoardPostImage, Long> {
    // 9. 특정 게시글 이미지 전체 조회
    List<BoardPostImage> findAllByPostId(Long postId ) throws SQLException;
//    // 10. 게시글에 이미지 추가
//    boolean addImage(Long postId, BoardPostImage image)
//            throws SQLException, IllegalArgumentException;

}