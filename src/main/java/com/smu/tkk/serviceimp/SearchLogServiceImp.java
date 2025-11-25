package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.SearchLog;
import com.smu.tkk.repository.SearchLogRepository;
import com.smu.tkk.service.SearchLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

    @Service
    @RequiredArgsConstructor
    @Transactional

    public class SearchLogServiceImp implements SearchLogService {

        private final SearchLogRepository searchLogRepository;

        /** -------------------------------------------------------
         *  1. 검색 기록 저장
         * ------------------------------------------------------- */
        @Override
        public SearchLog registerOne(Long memberId, String content) {

            SearchLog log = new SearchLog();
            log.setMemberId(memberId);
            log.setKeyword(content);

            return searchLogRepository.save(log);
        }

        /** -------------------------------------------------------
         *  2. 최근 검색 기록 조회 (내림차순)
         * ------------------------------------------------------- */
        @Override
        public List<SearchLog> readByDesc() {

            return searchLogRepository.findAll(
                            PageRequest.of(0, 20) // 최근 20개 예시 → 필요시 파라미터 변경 가능
                    ).stream()
                    .sorted((a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()))
                    .toList();
        }

        /** -------------------------------------------------------
         *  3. 인기 검색어 TOP-N (기간 내)
         * ------------------------------------------------------- */
        @Override
        public List<String> topKeywords(LocalDate from, LocalDate to, int limit) {

            DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            // 레포지토리가 하루 단위 검색만 제공하므로 from~to 루프 처리
            List<String> result = new java.util.ArrayList<>();

            LocalDate date = from;

            while (!date.isAfter(to)) {

                // yyyy-MM-dd 포맷으로 변환
                String dateStr = date.format(fmt);

                // limit 제한 적용 (Pageable)
                List<Map<String, Object>> list =
                        searchLogRepository.readTopByCreatedAtBefore(dateStr, PageRequest.of(0, limit));

                for (Map<String, Object> row : list) {

                    Object keywordObj = row.get("keyword");

                    if (keywordObj != null) {
                        result.add(keywordObj.toString());
                    }
                }

                date = date.plusDays(1);
            }

            // 중복된 키워드는 제거하고 가장 많이 등장한 순으로 다시 정렬
            return result.stream()
                    .distinct()
                    .limit(limit)
                    .toList();
        }

        /** -------------------------------------------------------
         *  4. 회원 검색 기록 전체 삭제
         * ------------------------------------------------------- */
        @Override
        public boolean clearHistory(Long memberId) {

            int deleted = searchLogRepository.deleteByMemberId(memberId);

            return deleted > 0;
        }
    }