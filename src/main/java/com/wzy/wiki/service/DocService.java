package com.wzy.wiki.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzy.wiki.domain.Content;
import com.wzy.wiki.domain.Doc;
import com.wzy.wiki.domain.DocExample;
import com.wzy.wiki.exception.BusinessException;
import com.wzy.wiki.exception.BusinessExceptionCode;
import com.wzy.wiki.mapper.ContentMapper;
import com.wzy.wiki.mapper.DocMapper;
import com.wzy.wiki.mapper.DocMapperCust;
import com.wzy.wiki.req.DocQueryReq;
import com.wzy.wiki.req.DocSaveReq;
import com.wzy.wiki.resp.DocQueryResp;
import com.wzy.wiki.resp.PageResp;
import com.wzy.wiki.util.CopyUtil;
import com.wzy.wiki.util.RedisUtil;
import com.wzy.wiki.util.RequestContext;
import com.wzy.wiki.util.SnowFlake;
import com.wzy.wiki.websocket.WebSocketServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class DocService {

    private static final Logger LOG = LoggerFactory.getLogger(DocService.class);

    @Resource
    private DocMapper docMapper;

    @Resource
    private DocMapperCust docMapperCust;

    @Resource
    private ContentMapper contentMapper;

    @Resource
    private SnowFlake snowFlake;

    @Resource
    public RedisUtil redisUtil;

    @Resource
    public WebSocketServer webSocketServer;

    public List<DocQueryResp> all(Long ebookId){
        DocExample docExample = new DocExample();
        docExample.createCriteria().andEbookIdEqualTo(ebookId);
        docExample.setOrderByClause("sort asc");
        List<Doc> docList = docMapper.selectByExample(docExample);

        //列表复制
        List<DocQueryResp> list = CopyUtil.copyList(docList, DocQueryResp.class);

        return list;
    }

    public PageResp<DocQueryResp> list(DocQueryReq req){
        DocExample docExample = new DocExample();
        docExample.setOrderByClause("sort asc");
        DocExample.Criteria criteria = docExample.createCriteria();
        PageHelper.startPage(req.getPage(),req.getSize());
        List<Doc> docList = docMapper.selectByExample(docExample);

        PageInfo<Doc> pageInfo = new PageInfo<>(docList);
        LOG.info("总行数: {}",pageInfo.getTotal());
        LOG.info("总页数: {}",pageInfo.getPages());

        /*List<DocResp> respList = new ArrayList<>();
        for (Doc doc : docList) {
            // DocResp docResp = new DocResp();
            // BeanUtils.copyProperties(doc,docResp);

            DocResp docResp = CopyUtil.copy(doc, DocResp.class);
            respList.add(docResp);
        }*/

        //列表复制
        List<DocQueryResp> list = CopyUtil.copyList(docList, DocQueryResp.class);

        PageResp<DocQueryResp> pageResp = new PageResp<>();
        pageResp.setTotal(pageInfo.getTotal());
        pageResp.setList(list);

        return pageResp;
    }

    /**
     * 保存
     */
    public void save(DocSaveReq req){
        Doc doc = CopyUtil.copy(req,Doc.class);
        Content content = CopyUtil.copy(req,Content.class);
        if (ObjectUtils.isEmpty(req.getId())){
            //新增
            doc.setId(snowFlake.nextId());
            doc.setViewCount(0);
            doc.setVoteCount(0);
            docMapper.insert(doc);

            content.setId(doc.getId());
            contentMapper.insert(content);
        }else {
            //更新
            docMapper.updateByPrimaryKey(doc);
            int count = contentMapper.updateByPrimaryKeyWithBLOBs(content);
            if (count == 0){
                contentMapper.insert(content);
            }
        }
    }

    /**
     * 删除
     */
    public void delete(Long id){
        docMapper.deleteByPrimaryKey(id);
    }

    public void delete(List<String> ids){
        DocExample docExample = new DocExample();
        DocExample.Criteria criteria = docExample.createCriteria();
        List<Long> list = new ArrayList<>();
        for (int i = 0; i < ids.size(); i++){
            list.add(i,Long.parseLong(ids.get(i)));
        }
        criteria.andIdIn(list);
        docMapper.deleteByExample(docExample);
    }

    public String findContent(Long id){
        Content content = contentMapper.selectByPrimaryKey(id);
        // 文档阅读数 + 1
        docMapperCust.increaseViewCount(id);
        if (ObjectUtils.isEmpty(content)){
            return "";
        }else {
            return content.getContent();
        }
    }

    // 点赞
    public void vote(Long id) {
        // docMapperCust.increaseVoteCount(id);

        //远程IP+doc.id作为key, 24小时内不能重复
        String ip = RequestContext.getRemoteAddr();
        if (redisUtil.validateRepeat("DOC_VOTE_" + id + "_" + ip, 3600 * 24)) {
            docMapperCust.increaseVoteCount(id);
        } else {
            throw new BusinessException(BusinessExceptionCode.VOTE_REPEAT);
        }

        // 推送消息
        Doc docDb = docMapper.selectByPrimaryKey(id);
        webSocketServer.sendInfo("【" + docDb.getName() + "】此刻被赞了一下");
    }

    public void updateEbookInfo() {
        docMapperCust.updateEbookInfo();
    }

}
