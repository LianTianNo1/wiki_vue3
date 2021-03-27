package com.wzy.wiki.controller;

import com.wzy.wiki.domain.Test;
import com.wzy.wiki.service.TestService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
public class TestController {

    @Resource
    private TestService testService;

    @GetMapping("/hello")
    public String hello(){
        return "HelloWorld!";
    }

    @GetMapping("/test/list")
    public List<Test> list(){
        return testService.list();
    }
}
