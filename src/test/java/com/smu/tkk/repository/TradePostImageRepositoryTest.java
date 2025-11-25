package com.smu.tkk.repository;

import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@Rollback(value = false)
@SpringBootTest
class TradePostImageRepositoryTest {
@Autowired
TradePostImageRepository tradePostImageRepository;
    @Test
    @Transactional
    void modifyImg() {
        tradePostImageRepository.modifyImg("trade1_img123.jpg",1L);
    }

    // 4. 이미지 추가 */
    //TradePostImage register(Long tradeId, String imageUrl);
    /// Long sortOrder 기능 필요하면 추가
    @Test
    @Transactional
    void insert(){
        TradePost tradePost = new TradePost();
        tradePost.setId(1L);
        TradePostImage tradePostImage = new TradePostImage();
        tradePostImage.setTrade(tradePost);
        tradePostImage.setImageUrl("trade1_img125.jpg");
        tradePostImageRepository.save(tradePostImage);
    }

    @Test
    void findAllByTradeId() {
        Sort sort= Sort.by("id").ascending();
        Pageable pageable = PageRequest.of(0,5,sort);
        System.out.println(tradePostImageRepository.findAllByTradeId(1L,pageable));
    }

    @Test
    void findFirstByTradeIdOrderByIdAsc() {
        System.out.println(tradePostImageRepository.findFirstByTradeIdOrderByIdAsc(1L));
    }
}