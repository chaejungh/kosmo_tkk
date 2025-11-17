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
public class StoreBookmarkId implements Serializable {
    private static final long serialVersionUID = -4882210772915677912L;
    @Column(name = "MEMBER_ID", nullable = false)
    private Long memberId;

    @Column(name = "STORE_ID", nullable = false)
    private Long storeId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        StoreBookmarkId entity = (StoreBookmarkId) o;
        return Objects.equals(this.storeId, entity.storeId) &&
                Objects.equals(this.memberId, entity.memberId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(storeId, memberId);
    }

}