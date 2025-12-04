package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.BoardComment;
import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.repository.BoardCommentRepository;
import com.smu.tkk.repository.BoardPostRepository;
import com.smu.tkk.service.AdminBoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AdminBoardServiceImp implements AdminBoardService {

    private final BoardPostRepository boardPostRepository;
    private final BoardCommentRepository boardCommentRepository;

    /**
     * 관리자용 게시글 목록 조회
     *  - categoryId == null  & keyword X  -> 전체
     *  - categoryId != null & keyword X  -> 해당 카테고리
     *  - categoryId == null & keyword O  -> 제목 기준 검색
     *  - categoryId != null & keyword O  -> 일단 카테고리 기준으로만 (필요하면 나중에 확장)
     *
     *  ⚠️ 현재는 deletedYn = 'N' 인 글만 조회 (관리자 리스트를 "활성 글" 중심으로 본다는 가정)
     */
    @Override
    public Page<BoardPost> readPosts(Pageable pageable, Long categoryId, String keyword) {

        boolean hasKeyword = StringUtils.hasText(keyword);

        if (categoryId != null && hasKeyword) {
            // 우선 카테고리만 필터 – 필요하면 제목+카테고리 조합 검색으로 확장 가능
            return boardPostRepository.findAllByCategoryIdAndDeletedYn(categoryId, "N", pageable);
        }

        if (categoryId != null) {
            return boardPostRepository.findAllByCategoryIdAndDeletedYn(categoryId, "N", pageable);
        }

        if (hasKeyword) {
            // 제목 기준 검색
            return boardPostRepository
                    .findAllByTitleContainingIgnoreCaseAndDeletedYn(keyword, "N", pageable);
        }

        return boardPostRepository.findAllByDeletedYn("N", pageable);
    }

    @Override
    public BoardPost readPost(Long postId) {
        return boardPostRepository.findById(postId)
                .orElseThrow(() ->
                        new IllegalArgumentException("게시글이 존재하지 않습니다. id=" + postId));
    }

    @Override
    public Page<BoardComment> readComments(Long postId, Pageable pageable) {
        // ⚠️ BoardCommentRepository에 findAllByPostId(..) 가 있어야 함
        return boardCommentRepository.findAllByPostId(postId, pageable);
    }

    @Override
    @Transactional
    public void softDeletePost(Long postId) {
        changeDeletedYn(postId, "Y");
    }

    @Override
    @Transactional
    public void restorePost(Long postId) {
        changeDeletedYn(postId, "N");
    }

    @Override
    @Transactional
    public void softDeleteComment(Long commentId) {
        BoardComment comment = boardCommentRepository.findById(commentId)
                .orElseThrow(() ->
                        new IllegalArgumentException("댓글이 존재하지 않습니다. id=" + commentId));
        comment.setDeletedYn("Y");
    }

    @Override
    @Transactional
    public void changeDeletedYn(Long postId, String deletedYn) {
        BoardPost post = readPost(postId);
        post.setDeletedYn(deletedYn); // 엔티티에 deletedYn 필드 있다고 가정 (기존과 동일)
        // JPA 더티 체킹으로 update 반영
    }
}
