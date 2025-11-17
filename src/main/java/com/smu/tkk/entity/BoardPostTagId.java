package com.smu.tkk.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.Objects;

@Getter
@Setter
@Embeddable
public class BoardPostTagId implements Serializable {
    private static final long serialVersionUID = 4801707670208320062L;
    @Column(name = "POST_ID", nullable = false)
    private Long postId;

    @Column(name = "TAG_ID", nullable = false)
    private Long tagId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        BoardPostTagId entity = (BoardPostTagId) o;
        return Objects.equals(this.tagId, entity.tagId) &&
                Objects.equals(this.postId, entity.postId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(tagId, postId);
    }

}