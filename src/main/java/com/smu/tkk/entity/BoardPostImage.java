package com.smu.tkk.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Getter
@Setter
@Entity
@ToString
@Table(name = "BOARD_POST_IMAGE")
public class BoardPostImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IMAGE_ID", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "POST_ID", nullable = false)
    @ToString.Exclude
    @JsonIgnore
    private BoardPost post;

    @Column(name = "IMAGE_URL", nullable = false)
    private String imageUrl;

    @ColumnDefault("1")
    @Column(name = "SORT_ORDER")
    private Long sortOrder;

}