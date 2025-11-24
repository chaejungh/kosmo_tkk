package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardPostImage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.sql.SQLException;
import java.util.List;

public interface BoardPostImageRepository extends JpaRepository<BoardPostImage, Long> {
    //    // 9. 특정 게시글 이미지 전체 조회
//    List<BoardPostImage> readImages(Long postId) throws SQLException;
    List<BoardPostImage> findAllByPostId(Long postId) throws SQLException;
}