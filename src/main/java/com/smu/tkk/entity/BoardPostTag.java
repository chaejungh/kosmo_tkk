package com.smu.tkk.entity;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "BOARD_POST_TAG")
public class BoardPostTag {
    @EmbeddedId
    private BoardPostTagId id;

    //TODO [리버스 엔지니어링] DB에서 열 생성
}