package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.BoardComment;
import com.smu.tkk.repository.BoardCommentRepository;
import com.smu.tkk.service.CommentService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentServiceImp implements CommentService {

    private final BoardCommentRepository boardCommentRepository;

    @Override
    @Transactional
    public boolean register(BoardComment comment) throws SQLException, IllegalArgumentException {
        if (comment == null) throw new IllegalArgumentException("comment is null");
        if (comment.getPost() == null || comment.getMember() == null)
            throw new IllegalArgumentException("post/member is null");
        boardCommentRepository.save(comment);
        return true;
    }

    @Override
    @Transactional
    public boolean remove(Long commentId) throws SQLException {
        if (commentId == null) return false;
        if (!boardCommentRepository.existsById(commentId)) return false;
        boardCommentRepository.deleteById(commentId);
        return true;
    }

    @Override
    public List<BoardComment> readByPost(Long postId, Pageable pageable) throws SQLException {
        if (postId == null) return List.of();
        return boardCommentRepository.findByPostId(postId, pageable);
    }
}


