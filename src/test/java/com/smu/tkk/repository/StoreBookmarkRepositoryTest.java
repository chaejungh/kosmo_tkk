package com.smu.tkk.repository;

import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.Store;
import com.smu.tkk.entity.StoreBookmark;
import jakarta.persistence.EntityManager;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Rollback(false)

class StoreBookmarkRepositoryTest {
@Autowired
private StoreBookmarkRepository storeBookmarkRepository;
@Autowired
private EntityManager em;

    @Test
    @Transactional
    void toogle(){
        Optional<StoreBookmark> storeBookmarkOpt = storeBookmarkRepository.findByMemberIdAndStoreId(1L,1L);
        if (storeBookmarkOpt.isPresent()) {
            storeBookmarkRepository.delete(storeBookmarkOpt.get());
            System.out.println("deleted");
        }else{
            StoreBookmark storeBookmark = new StoreBookmark();
            Store store = new Store();
            store.setId(1L);
            storeBookmark.setStore(store);
            Member member = new Member();
            member.setId(1L);
            storeBookmark.setMember(member);
            em.persist(storeBookmark);
        }
    }

    @Test
    void existsByMemberIdAndStoreId() {
        System.out.println(storeBookmarkRepository.existsByMemberIdAndStoreId(1L,1L));
        System.out.println(storeBookmarkRepository.existsByMemberIdAndStoreId(1L,4L));
    }
}