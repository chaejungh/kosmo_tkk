package com.smu.tkk.service;

import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.Member;

import java.util.List;

public interface AdminDashboardService {

    long countMembers();

    long countStores();

    long countPopupStores();

    long countBoardPosts();

    List<Member> getLatestMembers(int limit);

    List<BoardPost> getLatestPosts(int limit);
}
