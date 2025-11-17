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
public class PopupBookmarkId implements Serializable {
    private static final long serialVersionUID = 3385883673611116298L;
    @Column(name = "MEMBER_ID", nullable = false)
    private Long memberId;

    @Column(name = "POPUP_ID", nullable = false)
    private Long popupId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        PopupBookmarkId entity = (PopupBookmarkId) o;
        return Objects.equals(this.popupId, entity.popupId) &&
                Objects.equals(this.memberId, entity.memberId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(popupId, memberId);
    }

}