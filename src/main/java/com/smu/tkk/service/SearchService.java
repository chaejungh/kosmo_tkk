package com.smu.tkk.service;

import com.smu.tkk.entity.SearchLog;

import java.util.List;

public interface SearchService {
    SearchLog registerOne(int memberId,String content);//검색기록저장
    List<SearchLog> readByDesc();

}
