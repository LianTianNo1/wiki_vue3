package com.wzy.wiki.controller;

import com.wzy.wiki.req.EbookQueryReq;
import com.wzy.wiki.req.EbookSaveReq;
import com.wzy.wiki.resp.CommonResp;
import com.wzy.wiki.resp.EbookQueryResp;
import com.wzy.wiki.resp.PageResp;
import com.wzy.wiki.service.EbookService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/ebook")
public class EbookController {

    @Resource
    private EbookService ebookService;

    @GetMapping("/list")
    public CommonResp list(EbookQueryReq req){
        CommonResp<PageResp<EbookQueryResp>> resp = new CommonResp<>();
        PageResp<EbookQueryResp> list = ebookService.list(req);
        resp.setContent(list);
        return resp;
    }

    @PostMapping("/save")
    public CommonResp save(@RequestBody EbookSaveReq req){
        CommonResp resp = new CommonResp();
        ebookService.save(req);
        return resp;
    }
}
