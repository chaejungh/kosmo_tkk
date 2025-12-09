package com.smu.tkk.repository;

import com.smu.tkk.entity.PopupBookmark;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PopupBookmarkRepository extends JpaRepository<PopupBookmark,Integer> {
    Optional<PopupBookmark> findByMemberIdAndPopupId(Long memberId, Long popupId);

    Page<PopupBookmark> findAllByMemberId(Long memberId, Pageable pageable);

    /** 북마크 존재 여부 확인 */
    boolean existsByMemberIdAndPopupId(Long memberId, Long popupId);
    void deleteByMemberId(Long memberId);
}
