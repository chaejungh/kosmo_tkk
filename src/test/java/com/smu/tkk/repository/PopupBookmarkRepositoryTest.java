package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardBookmark;
import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.PopupBookmark;
import com.smu.tkk.entity.PopupStore;
import jakarta.persistence.EntityManager;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;
@Rollback(false)
@SpringBootTest
class PopupBookmarkRepositoryTest {
@Autowired
private PopupBookmarkRepository bookmarkRepository;
    @Autowired
    private EntityManager em;

    @Test
    void existsByMemberIdAndPopupId() {
            System.out.println(bookmarkRepository.existsByMemberIdAndPopupId(1L,1L));
            System.out.println(bookmarkRepository.existsByMemberIdAndPopupId(1L,7L));
        }


        @Test
        @Transactional
        void toggle(){
        //boolean exist= bookmarkRepository.existsByMemberIdAndPopupId(1L,1L);
        Optional<PopupBookmark> bookmarkOpt= bookmarkRepository.findByMemberIdAndPopupId(1L,1L);
        //System.out.println(exist);
        if (bookmarkOpt.isPresent()) {
            bookmarkRepository.delete(bookmarkOpt.get());
            System.out.println("deleted");
        }else  {
            PopupBookmark bookmark = new PopupBookmark();
            PopupStore popupStore = new PopupStore();
            popupStore.setId(1L);
            bookmark.setPopup(popupStore);
            Member member = new Member();
            member.setId(1L);
            bookmark.setMember(member);
            em.persist(bookmark);//insert 쿼리만 실행

//            bookmarkRepository.save(bookmark); //  save : 있는지 조회하고 update 쿼리 , 없으면 insert
//            System.out.println("saved");

        }
    }
}