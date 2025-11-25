package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.repository.BoardLikeRepository;
import com.smu.tkk.service.BoardLikeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardLikeServiceImp implements BoardLikeService {

    private final BoardLikeRepository boardLikeRepository;

    @Override
    public BoardLike registerOne(Long postId, Long userId) throws Exception {
        if (postId == null || userId == null) {
            throw new IllegalArgumentException("postId 또는 userId 가 없습니다.");
        }

        if (boardLikeRepository.existsByPostIdAndMemberId(postId, userId)) {
            throw new IllegalStateException("이미 좋아요한 게시글입니다.");
        }

        BoardLike like = new BoardLike();
        like.setPostId(postId);
        like.setMemberId(userId);

        return boardLikeRepository.save(like);
    }

    @Override
    public BoardLike removeOne(Long postId, Long userId) throws Exception {
        if (postId == null || userId == null) {
            throw new IllegalArgumentException("postId 또는 userId 가 없습니다.");
        }

        BoardLike like = boardLikeRepository.findByPostIdAndMemberId(postId, userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 좋아요가 존재하지 않습니다."));

        boardLikeRepository.delete(like);
        return like;
    }

    @Override
    @Transactional(readOnly = true)
    public BoardLike readlikecount(Long postId, Long userId) throws Exception {
        if (postId == null) {
            throw new IllegalArgumentException("postId 가 없습니다.");
        }

        int count = boardLikeRepository.countByPostId(postId);

        // 현재 로그인 유저의 좋아요 여부 + 개수 같이 내려주고 싶다고 가정
        // ⚠️ Repository에 Optional<BoardLike> findByPostIdAndMemberId(...) 가 있다고 가정
        BoardLike like = boardLikeRepository.findByPostIdAndMemberId(postId, userId)
                .orElseGet(() -> {
                    BoardLike tmp = new BoardLike();
                    tmp.setPostId(postId);
                    tmp.setMemberId(userId);
                    return tmp;
                });

        like.setLikeCount(count);

        return like;
    }
}
