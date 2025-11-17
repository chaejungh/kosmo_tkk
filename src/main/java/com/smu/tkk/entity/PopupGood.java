package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "POPUP_GOODS")
public class PopupGood {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "POPUP_GOODS_ID", nullable = false)
    private Long id;

    @Column(name = "POPUP_ID", nullable = false)
    private Long popupId;

    @Column(name = "NAME", nullable = false, length = 150)
    private String name;

    @Column(name = "DESCRIPTION")
    private String description;

    @Column(name = "CATEGORY", length = 30)
    private String category;

    @Column(name = "PRICE")
    private Long price;

    @Column(name = "THUMBNAIL_URL")
    private String thumbnailUrl;

}