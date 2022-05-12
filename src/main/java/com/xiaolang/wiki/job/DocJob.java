﻿package com.xiaolang.wiki.job;

 import com.xiaolang.wiki.service.DocService;
 import com.xiaolang.wiki.util.SnowFlake;
 import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 import org.slf4j.MDC;
 import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

 @Component
 public class DocJob {

    private static final Logger LOG = LoggerFactory.getLogger(DocJob.class);

    @Resource
    private SnowFlake snowFlake;

    @Resource
    private DocService docService;

    /**
     * 每过半分钟更新电子书信息
     */
    @Scheduled(cron = "3/9 * * * * ? ")
    public void cron() {
        // 增加日志流水号
        MDC.put("LOG_ID", String.valueOf(snowFlake.nextId()));

        LOG.info("开始更新电子书下的文档数据");
        long start = System.currentTimeMillis();
        docService.updateEbookInfo();
        LOG.info("文档数据更新结束, 耗时: {}毫秒",System.currentTimeMillis() - start);
    }

 }
