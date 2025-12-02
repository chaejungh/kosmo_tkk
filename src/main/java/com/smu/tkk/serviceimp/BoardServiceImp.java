package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.entity.BoardPostTag;
import com.smu.tkk.service.BoardService;
import jakarta.transaction.Transactional;

import java.sql.SQLException;
import java.util.List;
import com.smu.tkk.entity.BoardCategory;
import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.BoardPostImage;
import com.smu.tkk.entity.BoardPostTag;
import com.smu.tkk.entity.BoardReport;
import com.smu.tkk.entity.BoardTag;
import com.smu.tkk.repository.BoardCategoryRepository;
import com.smu.tkk.repository.BoardLikeRepository;
import com.smu.tkk.repository.BoardPostImageRepository;
import com.smu.tkk.repository.BoardPostRepository;
import com.smu.tkk.repository.BoardPostTagRepository;
import com.smu.tkk.repository.BoardReportRepository;
import com.smu.tkk.repository.BoardTagRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

    @Service
    @RequiredArgsConstructor
    public class BoardServiceImp implements BoardService {

        private final BoardPostRepository boardPostRepository;
        private final BoardPostImageRepository boardPostImageRepository;
        private final BoardTagRepository boardTagRepository;
        private final BoardPostTagRepository boardPostTagRepository;
        private final BoardCategoryRepository boardCategoryRepository;
        private final BoardLikeRepository boardLikeRepository;
        private final BoardReportRepository boardReportRepository;

        @Override
        @Transactional
        public boolean register(BoardPost post) throws SQLException, IllegalArgumentException {
            if (post == null) throw new IllegalArgumentException("post is null");
            boardPostRepository.save(post);
            return true;
        }

        @Override
        @Transactional
        public boolean modify(BoardPost post) throws SQLException, IllegalArgumentException {
            if (post == null || post.getId() == null) throw new IllegalArgumentException("post id is null");
            if (!boardPostRepository.existsById(post.getId())) return false;
            boardPostRepository.save(post);
            return true;
        }

        @Override
        @Transactional
        public boolean remove(Long postId) throws SQLException {
            if (postId == null) return false;
            if (!boardPostRepository.existsById(postId)) return false;
            boardPostRepository.deleteById(postId);
            return true;
        }

        @Override
        public BoardPost readOne(Long postId) throws SQLException {
            if (postId == null) return null;
            Optional<BoardPost> opt = boardPostRepository.findById(postId);
            return opt.orElse(null);
        }

        @Override
        public Page<BoardPost> readAll(Pageable pageable) throws SQLException {
            // 삭제되지 않은 게시글만 최신순
            return boardPostRepository.findAllByDeletedYn("N", pageable);
        }

        @Override
        public Page<BoardPost> readByKeyword(String keyword,Pageable pageable) throws SQLException {
            //if (keyword == null || keyword.isBlank()) return null; 컨트롤러 일
            // 제목 검색만 우선 구현
            return boardPostRepository.findAllByTitleContainingIgnoreCaseAndDeletedYn(keyword, "N", pageable);
        }

        @Override
        public Page<BoardPost> readByNickname(String nickname, Pageable pageable) throws SQLException {
            return boardPostRepository.findAllByMember_NicknameContainingIgnoreCaseAndDeletedYn(nickname,"N",pageable);
        }


        @Override
        public Page<BoardPost> readByCategory(Long categoryId,Pageable pageable) throws SQLException {

            return boardPostRepository.findAllByCategoryIdAndDeletedYn(categoryId, "N",pageable);
        }

        @Override
        public List<BoardCategory> readAllCategories() throws SQLException {
            return boardCategoryRepository.findAll();
        }

        @Override
        public List<BoardPostImage> readImages(Long postId) throws SQLException {
            if (postId == null) return List.of();
            return boardPostImageRepository.findAllByPostId(postId);
        }

        @Override
        @Transactional
        public boolean addImage(Long postId, BoardPostImage image) throws SQLException, IllegalArgumentException {
            if (postId == null || image == null) throw new IllegalArgumentException("invalid params");
            BoardPost post = boardPostRepository.findById(postId).orElse(null);
            if (post == null) return false;
            image.setPost(post);
            boardPostImageRepository.save(image);
            return true;
        }

        @Override
        @Transactional
        public boolean removeImage(Long imageId) throws SQLException {
            if (imageId == null) return false;
            if (!boardPostImageRepository.existsById(imageId)) return false;
            boardPostImageRepository.deleteById(imageId);
            return true;
        }

        @Override
        public List<BoardTag> readTagsByPost(Long postId) throws SQLException {
            if (postId == null) return List.of();
            // Post-Tag 조인 테이블 통해 태그 조회
            List<BoardPostTag> pts = boardPostTagRepository.findByPostId(postId);
            if (pts.isEmpty()) return List.of();
            return pts.stream().map(BoardPostTag::getTag).toList();
        }

        @Override
        @Transactional
        public boolean addTagToPost(Long postId, Long tagId) throws SQLException {
            if (postId == null || tagId == null) return false;
            BoardPost post = boardPostRepository.findById(postId).orElse(null);
            BoardTag tag = boardTagRepository.findById(tagId).orElse(null);
            if (post == null || tag == null) return false;
            if (boardPostTagRepository.existsByPostIdAndTagId(postId, tagId)) return true;
            BoardPostTag pt = new BoardPostTag();
            pt.setPost(post);
            pt.setTag(tag);
            boardPostTagRepository.save(pt);
            return true;
        }

        @Override
        @Transactional
        public boolean removeTagFromPost(Long postId, Long tagId) throws SQLException {
            if (postId == null || tagId == null) return false;
            BoardPostTag pt = (BoardPostTag) boardPostTagRepository.findByPostIdAndTagId(postId, tagId).orElse(null);
            if (pt == null) return false;
            boardPostTagRepository.delete(pt);
            return true;
        }

        @Override
        public Page<BoardLike> readByLike(Long memberId, Pageable pageable) throws SQLException {
            //if (memberId == null) return List.of(); 컨트롤러 일
            return boardLikeRepository.findByMemberId(memberId, pageable);
        }

        @Override
        @Transactional
        public boolean register(BoardReport report) throws SQLException, IllegalArgumentException {
            if (report == null) throw new IllegalArgumentException("report is null");
            boardReportRepository.save(report);
            return true;
        }

        @Override
        @Transactional
        public boolean remove(BoardReport report) throws SQLException, IllegalArgumentException {
            if (report == null || report.getId() == null) throw new IllegalArgumentException("report id is null");
            if (!boardReportRepository.existsById(report.getId())) return false;
            boardReportRepository.deleteById(report.getId());
            return true;
        }

        @Override
        public Page<BoardPost> readByUser(Long memberId, String yN, Pageable pageable) throws SQLException {
            return boardPostRepository.findAllByMemberIdAndDeletedYn(memberId,yN,pageable);
        }

        @Override
        @Transactional
        public List<BoardPost> getHotPostsInCategory(Long categoryId) {
            boardCategoryRepository.findById(categoryId)
                    .orElseThrow(() -> new IllegalArgumentException("카테고리 없음: " + categoryId));

            return boardPostRepository
                    .findTop5ByCategoryIdAndDeletedYnOrderByLikeCountDesc(categoryId, "N");
        }

        @Override
        @Transactional
        public List<BoardPost> getHotPostsAll() {
            return boardPostRepository
                    .findTop5ByDeletedYnOrderByLikeCountDesc("N");
        }
    }


