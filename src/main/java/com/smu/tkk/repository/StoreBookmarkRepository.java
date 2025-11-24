package com.smu.tkk.repository;

import com.smu.tkk.entity.PopupBookmark;
import com.smu.tkk.entity.StoreBookmark;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface StoreBookmarkRepository extends JpaRepository<StoreBookmark,Integer> {
    Optional<StoreBookmark> findByMemberIdAndStoreId(Long memberId, Long StoreId);
    /** 스토어북마크 존재 여부 확인 */
    boolean existsByMemberIdAndStoreId(Long memberId, Long StoreId);
}
