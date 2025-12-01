package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.PopupBookmark;
import com.smu.tkk.entity.PopupGood;
import com.smu.tkk.entity.PopupStore;
import com.smu.tkk.repository.PopupBookmarkRepository;
import com.smu.tkk.repository.PopupGoodRepository;
import com.smu.tkk.repository.PopupStoreRepository;
import com.smu.tkk.service.PopupService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class PopupServiceImp implements PopupService {

    private final PopupStoreRepository popupStoreRepository;
    private final PopupGoodRepository popupGoodRepository;
    private final PopupBookmarkRepository popupBookmarkRepository;

    /**
     * 1. 팝업 스토어 전체 조회
     */
    @Override
    public List<PopupStore> readAll(Pageable pageable) throws SQLException {
        return popupStoreRepository.findAll(pageable).getContent();
    }

    /**
     * 2. 팝업 상세 조회
     */
    @Override
    public PopupStore readOne(Long popupId) throws SQLException {
        return popupStoreRepository.findById(popupId)
                .orElseThrow(() ->
                        new IllegalArgumentException("팝업을 찾을 수 없습니다. id=" + popupId));
    }

    /**
     * 3. 진행 중인 팝업
     */
    @Override
    public List<PopupStore> active(LocalDate today) throws SQLException {
        return popupStoreRepository.findActive(today);
    }

    /**
     * 4. 팝업의 굿즈 목록
     */
    @Override
    public List<PopupGood> goods(Long popupId, Pageable pageable) throws SQLException {
        Page<PopupGood> page = popupGoodRepository.findByPopupId(popupId, pageable);
        return page.getContent();
        // 만약 레포지토리에 List<PopupGood> findAllByPopupId(Long popupId)만 있다면
        // return popupGoodRepository.findAllByPopupId(popupId); 로 바꿔서 쓰면 됨
    }

    /**
     * 6. 북마크 토글: true = 북마크됨, false = 해제됨
     */
    @Override
    @Transactional
    public boolean togglePopupBookmark(Long memberId, Long popupId) {
        return popupBookmarkRepository.findByMemberIdAndPopupId(memberId, popupId)
                .map(existing -> {
                    // 이미 북마크 되어 있으면 삭제
                    popupBookmarkRepository.delete(existing);
                    return false; // 해제됨
                })
                .orElseGet(() -> {
                    // 없으면 새로 생성
                    PopupBookmark bookmark = new PopupBookmark();
                    // 엔티티가 memberId, popupId 필드를 가진다고 가정
                    bookmark.setMemberId(memberId);
                    bookmark.setPopupId(popupId);

                    popupBookmarkRepository.save(bookmark);
                    return true; // 북마크됨
                });
    }

    /**
     * 7. 북마크 여부
     */
    @Override
    public boolean isPopupBookmarked(Long memberId, Long popupId) {
        return popupBookmarkRepository.existsByMemberIdAndPopupId(memberId, popupId);
    }


     // 8. 내 팝업 북마크 목록
    @Override
    public Page<PopupBookmark> myBookmarks(Long memberId, Pageable pageable) {

        return popupBookmarkRepository.findAllByMemberId(memberId, pageable);
    }
}
