package com.smu.tkk.service;

import com.smu.tkk.entity.SearchLog;
import com.smu.tkk.entity.RecommendedSearch;

import java.time.LocalDate;
import java.util.List;

public interface SearchService {
    // ===== 기존 =====
    SearchLog registerOne(int memberId, String content); // 검색기록저장
    List<SearchLog> readByDesc();

    // ===== 추가 =====

    /** 기간 내 인기 키워드 Top-N (많이 검색된 순) */
    List<String> topKeywords(LocalDate from, LocalDate to, int limit);

    /** 활성화된 추천 검색어 (정렬 우선순위 순) */ //추후 ai검색으로 대체
    //List<RecommendedSearch> activeRecommendations(int limit);

    /** 회원의 검색 기록 전체 삭제 */
    boolean clearHistory(int memberId);
}
