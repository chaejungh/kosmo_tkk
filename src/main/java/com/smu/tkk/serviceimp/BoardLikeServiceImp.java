package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.repository.BoardLikeRepository;
import com.smu.tkk.repository.BoardPostRepository;
import com.smu.tkk.service.BoardLikeService;
import com.smu.tkk.service.NotificationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardLikeServiceImp implements BoardLikeService {

    private final BoardLikeRepository boardLikeRepository;
    private final BoardPostRepository boardPostRepository;
    private final NotificationService notificationService;


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

        BoardLike saved = boardLikeRepository.save(like);

        // 2) 좋아요 알림 보내기 (여기부터 추가)
        BoardPost post = boardPostRepository.findById(postId)
                .orElseThrow(() -> new IllegalArgumentException("게시글이 존재하지 않습니다."));

        Long writerId = post.getMember().getId();

        // 자기 글에 본인이 좋아요 누른 경우 알림 제외
        if (!writerId.equals(userId)) {

            String message = "회원이 내 게시글을 좋아했습니다.";

            notificationService.create(
                    writerId,     // 알림 받을 사람 = 게시글 작성자
                    "LIKE",       // 알림 타입
                    message,      // 메시지
                    "BOARD",      // linkType
                    postId        // 이동 대상 ID
            );
        }

        return saved;
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
