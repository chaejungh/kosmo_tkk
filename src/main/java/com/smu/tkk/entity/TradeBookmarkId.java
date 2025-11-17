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
public class TradeBookmarkId implements Serializable {
    private static final long serialVersionUID = -3946796718309737193L;
    @Column(name = "MEMBER_ID", nullable = false)
    private Long memberId;

    @Column(name = "TRADE_ID", nullable = false)
    private Long tradeId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        TradeBookmarkId entity = (TradeBookmarkId) o;
        return Objects.equals(this.tradeId, entity.tradeId) &&
                Objects.equals(this.memberId, entity.memberId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(tradeId, memberId);
    }

}