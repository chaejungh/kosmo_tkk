package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardBookmark;
import com.smu.tkk.entity.PopupBookmark;
import com.smu.tkk.entity.PopupStore;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class PopupStoreRepositoryTest {
    @Autowired
    PopupStoreRepository popupStoreRepository;
    @Test
    void findNear() {

        System.out.println(popupStoreRepository.findNear(37.5665,126.9780,5.0));//홍대 위치 기준
    }


   /* @Test
    void findByMemberIdAndPopupId() {
        Optional<PopupBookmark> popupStoreOpt=PopupStoreRepository.findByMemberIdAndPopupId(1L,1L);
        popupStoreOpt.ifPresent((pb)->{
            System.out.println(pb);
        });
    }*/
}