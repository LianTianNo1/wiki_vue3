package com.wzy.wiki.mapper;


import com.wzy.wiki.resp.StatisticResp;

import java.util.List;

public interface EbookSnapshotMapperCust {

    public void genSnapshot();

    List<StatisticResp> getStatistic();

//    List<StatisticResp> get30Statistic();
}
