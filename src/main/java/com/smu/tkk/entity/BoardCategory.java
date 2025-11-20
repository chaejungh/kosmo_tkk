package com.smu.tkk.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@ToString
@Table(name = "BOARD_CATEGORY")
public class BoardCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CATEGORY_ID", nullable = false)
    private Long id;

    @Column(name = "CODE", nullable = false, length = 30)
    private String code;

    @Column(name = "NAME", nullable = false, length = 50)
    private String name;

    @OneToMany(mappedBy = "category")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardPost> boardPosts = new LinkedHashSet<>();

}