package com.wzy.wiki.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzy.wiki.domain.Ebook;
import com.wzy.wiki.domain.EbookExample;
import com.wzy.wiki.mapper.EbookMapper;
import com.wzy.wiki.req.EbookReq;
import com.wzy.wiki.resp.EbookResp;
import com.wzy.wiki.resp.PageResp;
import com.wzy.wiki.util.CopyUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EbookService {

    private static final Logger LOG = LoggerFactory.getLogger(EbookService.class);

    @Resource
    private EbookMapper ebookMapper;

    public PageResp<EbookResp> list(EbookReq req){
        EbookExample ebookExample = new EbookExample();
        EbookExample.Criteria criteria = ebookExample.createCriteria();
        if(!ObjectUtils.isEmpty(req.getName())){
            criteria.andNameLike("%" + req.getName() + "%");
        }
        PageHelper.startPage(req.getPage(),req.getSize());
        List<Ebook> ebookList = ebookMapper.selectByExample(ebookExample);

        PageInfo<Ebook> pageInfo = new PageInfo<>(ebookList);
        LOG.info("总行数: {}",pageInfo.getTotal());
        LOG.info("总页数: {}",pageInfo.getPages());

        /*List<EbookResp> respList = new ArrayList<>();
        for (Ebook ebook : ebookList) {
            // EbookResp ebookResp = new EbookResp();
            // BeanUtils.copyProperties(ebook,ebookResp);

            EbookResp ebookResp = CopyUtil.copy(ebook, EbookResp.class);
            respList.add(ebookResp);
        }*/

        //列表复制
        List<EbookResp> list = CopyUtil.copyList(ebookList, EbookResp.class);

        PageResp<EbookResp> pageResp = new PageResp<>();
        pageResp.setTotal(pageInfo.getTotal());
        pageResp.setList(list);

        return pageResp;
    }
}
