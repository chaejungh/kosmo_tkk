package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.StoreGood;
import com.smu.tkk.repository.StoreGoodRepository;
import com.smu.tkk.service.StoreGoodsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class StoreGoodsServiceImpl implements StoreGoodsService {

    private final StoreGoodRepository storeGoodsRepository;

    @Override
    public List<StoreGood> getGoodsList(Long storeId, String keyword) {
        if (keyword == null || keyword.isBlank()) {
            return storeGoodsRepository
                    .findByStoreIdOrderByWorkNameAscCharacterNameAsc(storeId);
        }

        String value = "%" + keyword.trim().toLowerCase() + "%";
        return storeGoodsRepository.searchInStore(storeId, value);
    }
}
