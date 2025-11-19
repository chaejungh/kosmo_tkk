package com.smu.tkk.repository;

<<<<<<< HEAD
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class BoardCategoryRepositoryTest {
    @Autowired
    BoardCategoryRepository boardCategoryRepository;
    @Test
    void findById(){
        System.out.println(boardCategoryRepository.findById((long)1));
    }

=======
import com.smu.tkk.entity.BoardCategory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BoardCategoryRepositoryTest {
    @Autowired
    private BoardCategoryRepository boardCategoryRepository;
    @Test
    void findById() throws Exception{
        System.out.println(boardCategoryRepository.findById(1L));




    }
>>>>>>> 3614324cccfe7980251f6bc28fffa7e30fe3ba3d
}