package com.wzy.wiki.service;

import com.wzy.wiki.domain.Ebook;
import com.wzy.wiki.domain.EbookExample;
import com.wzy.wiki.mapper.EbookMapper;
import com.wzy.wiki.req.EbookReq;
import com.wzy.wiki.resp.EbookResp;
import com.wzy.wiki.util.CopyUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EbookService {

    @Resource
    private EbookMapper ebookMapper;

    public List<EbookResp> list(EbookReq req){
        EbookExample ebookExample = new EbookExample();
        EbookExample.Criteria criteria = ebookExample.createCriteria();
        criteria.andNameLike("%" + req.getName() + "%");
        List<Ebook> ebookList = ebookMapper.selectByExample(ebookExample);

        /*List<EbookResp> respList = new ArrayList<>();
        for (Ebook ebook : ebookList) {
            // EbookResp ebookResp = new EbookResp();
            // BeanUtils.copyProperties(ebook,ebookResp);

            EbookResp ebookResp = CopyUtil.copy(ebook, EbookResp.class);
            respList.add(ebookResp);
        }*/

        //列表复制
        List<EbookResp> list = CopyUtil.copyList(ebookList, EbookResp.class);
        return list;
    }
}
