package com.xiaolang.wiki.mapper;

import org.apache.ibatis.annotations.Param;

public interface DocMapperCust {

    public void increaseViewCount(@Param("id") Long id);

    public void increaseVoteCount(@Param("id") Long id);

    public void updateEbookInfo();
}
