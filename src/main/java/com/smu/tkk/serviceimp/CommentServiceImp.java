package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.BoardComment;
import com.smu.tkk.repository.BoardCommentRepository;
import com.smu.tkk.repository.BoardPostRepository;
import com.smu.tkk.service.CommentService;
import com.smu.tkk.service.NotificationService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentServiceImp implements CommentService {
    private final BoardPostRepository boardPostRepository;
    private final BoardCommentRepository boardCommentRepository;
    private final NotificationService notificationService;


    @Override
    @Transactional
    public boolean register(BoardComment comment) throws SQLException, IllegalArgumentException {
        if (comment == null) throw new IllegalArgumentException("comment is null");
        if (comment.getPostId() == null || comment.getMemberId() == null)
            throw new IllegalArgumentException("post/member is null");

        // 댓글 저장

        boardCommentRepository.save(comment);

        // 본인이 자기 게시글에 댓글 단 경우는 알람 제외

        Long writerId = comment.getMemberId();
        Long postId = comment.getPostId();
        Long postWriterId =boardPostRepository.findById(postId).get().getMemberId();

        if (!writerId.equals(postWriterId)) {

            String message = "회원이 내 게시글에 댓글을 달았습니다.";

            notificationService.create(
                    postWriterId,   // 알림 받을 사람 = (게시글 작성자)
                    "COMMENT",            // 알림 타입
                    message,              // 메시지
                    "BOARD",              // linkType
                    postId     // 이동 대상 게시글 ID
            );
        }

        return true;
    }

    @Transactional
    @Override
    public boolean remove(Long commentId) throws SQLException {
        if (commentId == null) return false;
        BoardComment comment = boardCommentRepository.findById(commentId)
                .orElseThrow(() -> new IllegalArgumentException("comment not found"));
        comment.setDeletedYn("Y");
        boardCommentRepository.save(comment);
        return true;
    }

    @Override
    public long countByPostId(Long postId) throws SQLException {
        return boardCommentRepository.countByPostId(postId);
    }
    @Override
    public List<BoardComment> readByPost(Long postId, Pageable pageable) throws SQLException {
        if (postId == null) return List.of();
        return boardCommentRepository.findByPostIdAndDeletedYn(postId, "N", pageable);
    }
}


