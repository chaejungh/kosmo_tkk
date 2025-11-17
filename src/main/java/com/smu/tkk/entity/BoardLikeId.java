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
public class BoardLikeId implements Serializable {
    private static final long serialVersionUID = 1872046759556743855L;
    @Column(name = "MEMBER_ID", nullable = false)
    private Long memberId;

    @Column(name = "POST_ID", nullable = false)
    private Long postId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        BoardLikeId entity = (BoardLikeId) o;
        return Objects.equals(this.postId, entity.postId) &&
                Objects.equals(this.memberId, entity.memberId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(postId, memberId);
    }

}