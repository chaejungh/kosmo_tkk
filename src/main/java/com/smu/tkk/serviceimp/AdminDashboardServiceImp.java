package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.Member;
import com.smu.tkk.repository.BoardPostRepository;
import com.smu.tkk.repository.MemberRepository;
import com.smu.tkk.repository.PopupStoreRepository;
import com.smu.tkk.repository.StoreRepository;
import com.smu.tkk.service.AdminDashboardService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AdminDashboardServiceImp implements AdminDashboardService {

    private final MemberRepository memberRepository;
    private final StoreRepository storeRepository;
    private final PopupStoreRepository popupStoreRepository;
    private final BoardPostRepository boardPostRepository;

    @Override
    public long countMembers() {
        return memberRepository.count();
    }

    @Override
    public long countStores() {
        return storeRepository.count();
    }

    @Override
    public long countPopupStores() {
        return popupStoreRepository.count();
    }

    @Override
    public long countBoardPosts() {
        return boardPostRepository.count();
    }

    @Override
    public List<Member> getLatestMembers(int limit) {
        Pageable pageable = PageRequest.of(
                0, limit, Sort.by(Sort.Direction.DESC, "createdAt")
        );
        return memberRepository.findAll(pageable).getContent();
    }

    @Override
    public List<BoardPost> getLatestPosts(int limit) {
        Pageable pageable = PageRequest.of(
                0, limit, Sort.by(Sort.Direction.DESC, "createdAt")
        );
        return boardPostRepository.findAll(pageable).getContent();
    }
}
