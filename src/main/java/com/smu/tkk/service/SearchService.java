package com.smu.tkk.service;

import com.smu.tkk.entity.SearchLog;
import com.smu.tkk.entity.RecommendedSearch;

import java.time.LocalDate;
import java.util.List;

public interface SearchService {
    // 1. 검색 기록 저장
    SearchLog registerOne(Long memberId, String content); // 검색기록저장

    // 2. 검색 최근 기록 조회
    List<SearchLog> readByDesc();//최근 기록 조회

    // 3. 인기 검색어 랭킹 순
    /** 기간 내 인기 키워드 Top-N (많이 검색된 순) */
    List<String> topKeywords(LocalDate from, LocalDate to, int limit);

    // 4.* 활성화된 추천 검색어 (정렬 우선순위 순) */ //추후 ai검색으로 대체
    //List<RecommendedSearch> activeRecommendations(int limit);

    // 5.* 회원의 검색 기록 전체 삭제 */
    boolean clearHistory(Long memberId);
}
