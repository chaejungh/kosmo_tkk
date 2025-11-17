package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "BOARD_TAG")
public class BoardTag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TAG_ID", nullable = false)
    private Long id;

    @Column(name = "TAG_NAME", nullable = false, length = 50)
    private String tagName;

    @OneToMany(mappedBy = "tag")
    private Set<BoardPostTag> boardPostTags = new LinkedHashSet<>();

}