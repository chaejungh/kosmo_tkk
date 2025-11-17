package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Getter
@Setter
@Entity
@Table(name = "FAQ")
public class Faq {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "FAQ_ID", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "FAQ_CATEGORY_ID", nullable = false)
    private FaqCategory faqCategory;

    @Column(name = "QUESTION", nullable = false)
    private String question;

    @Lob
    @Column(name = "ANSWER", nullable = false)
    private String answer;

    @ColumnDefault("1")
    @Column(name = "SORT_ORDER")
    private Long sortOrder;

}