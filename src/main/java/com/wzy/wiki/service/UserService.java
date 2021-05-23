package com.wzy.wiki.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzy.wiki.domain.User;
import com.wzy.wiki.domain.UserExample;
import com.wzy.wiki.exception.BusinessException;
import com.wzy.wiki.exception.BusinessExceptionCode;
import com.wzy.wiki.mapper.UserMapper;
import com.wzy.wiki.req.UserLoginReq;
import com.wzy.wiki.req.UserQueryReq;
import com.wzy.wiki.req.UserResetPasswordReq;
import com.wzy.wiki.req.UserSaveReq;
import com.wzy.wiki.resp.PageResp;
import com.wzy.wiki.resp.UserLoginResp;
import com.wzy.wiki.resp.UserQueryResp;
import com.wzy.wiki.util.CopyUtil;
import com.wzy.wiki.util.SnowFlake;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {

    private static final Logger LOG = LoggerFactory.getLogger(UserService.class);

    @Resource
    private UserMapper userMapper;

    @Resource
    private SnowFlake snowFlake;

    public PageResp<UserQueryResp> list(UserQueryReq req){
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        if (!ObjectUtils.isEmpty(req.getLoginName())) {
            criteria.andLoginNameEqualTo(req.getLoginName());
        }
        PageHelper.startPage(req.getPage(),req.getSize());
        List<User> userList = userMapper.selectByExample(userExample);

        PageInfo<User> pageInfo = new PageInfo<>(userList);
        LOG.info("总行数: {}",pageInfo.getTotal());
        LOG.info("总页数: {}",pageInfo.getPages());

        /*List<UserResp> respList = new ArrayList<>();
        for (User user : userList) {
            // UserResp userResp = new UserResp();
            // BeanUtils.copyProperties(user,userResp);

            UserResp userResp = CopyUtil.copy(user, UserResp.class);
            respList.add(userResp);
        }*/

        //列表复制
        List<UserQueryResp> list = CopyUtil.copyList(userList, UserQueryResp.class);

        PageResp<UserQueryResp> pageResp = new PageResp<>();
        pageResp.setTotal(pageInfo.getTotal());
        pageResp.setList(list);

        return pageResp;
    }

    /**
     * 保存
     */
    public void save(UserSaveReq req){
        User user = CopyUtil.copy(req,User.class);
        if (ObjectUtils.isEmpty(req.getId())){

            User userDB = selectByLoginName(req.getLoginName());
            if (ObjectUtils.isEmpty(userDB)) {
                //新增
                user.setId(snowFlake.nextId());
                userMapper.insert(user);
            } else {
                // 用户名已存在
                throw new BusinessException(BusinessExceptionCode.USER_LOGIN_NAME_EXIST);
            }

        }else {
            //更新
            user.setLoginName(null);
            user.setPassword(null);
            userMapper.updateByPrimaryKeySelective(user);
        }
    }

    /**
     * 删除
     */
    public void delete(Long id){
        userMapper.deleteByPrimaryKey(id);
    }

    public User selectByLoginName(String loginName) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andLoginNameEqualTo(loginName);
        List<User> userList = userMapper.selectByExample(userExample);
        if (CollectionUtils.isEmpty(userList)) {
            return null;
        } else {
            return userList.get(0);
        }
    }

    /**
     * 修改用户密码
     */
    public void resetPassword(UserResetPasswordReq req){
        User user = CopyUtil.copy(req,User.class);
        userMapper.updateByPrimaryKeySelective(user);
    }

    /**
     * 用户登录
     */
    public UserLoginResp login(UserLoginReq req) {
        User userDb = selectByLoginName(req.getLoginName());
        if (ObjectUtils.isEmpty(userDb)) {
            // 用户名不存在
            LOG.info("用户名不存在, {}", req.getLoginName());
            throw new BusinessException(BusinessExceptionCode.LOGIN_USER_ERROR);
        } else {
            if (userDb.getPassword().equals(req.getPassword())) {
                // 登录成功
                UserLoginResp userLoginResp = CopyUtil.copy(userDb, UserLoginResp.class);
                return userLoginResp;
            } else {
                // 密码不正确
                LOG.info("密码不对, 输入密码: {}, 数据库密码: {}", req.getPassword(), userDb.getPassword());
                throw new BusinessException(BusinessExceptionCode.LOGIN_USER_ERROR);
            }
        }
    }
}
