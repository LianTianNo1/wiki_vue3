### SpringBoot + Vue3 前后端分离wiki知识库系统

使用 SpringBoot +  Vue3 + AntDesignVue 进行开发的 wiki 知识库
跟着慕课课程进行学习



### 安装运行

后端需要工具：JDK1.8 IDEA Mysql Redis maven

> 首先需要克隆该项目

```bash
git clone https://gitee.com/lang-tian/wiki
# or
git clone https://github.com/LianTianNo1/wiki_vue3
```

前端需要Node.js环境

> 进入目录

```bash
cd wiki
# or 
cd wiki_vue3

# 安装依赖
npm install

# 启动项目
npm run serve-dev
```

> 完成的功能...

(1) 首页。 使用Ant Design在左侧边栏展示列表，这样就可以直接一一展示课程分类，点击全部查看主要内容中的课程分类。

(2) 用户查询。点击用户管理，跳转到页面，用户全部查询，并分页展示，在输入框中输入，点击查询，则实现模糊查询。

(3) 用户增加。增加一名用户，连接后端添加入数据库。

(4) 重置密码。用户可以修改自己的密码，通过MD5进行加密。

(5) 用户编辑。编辑用户基本信息。

(6) 用户删除。删除用户信息。

(7) 内容查询。点击内容管理，将全部查询一次，在输入框中输入，点击查询，进行模糊查询。

(8) 内容新增。使用拟态框展示内容基本信息，填入内容基本信息进行添加。

(9) 文档管理。编写课程文档。

(10) 内容编辑。编辑文档基本内容。

(11) 内容删除。删除这个文档。

(12)分类增加。新增一个课程。

(13) 分类编辑。修改课程名，其父分类，修改排序。

(14) 分类删除。删除一个课程。

(15) 课程文档。查看课程文档，学习课程。

(16) 关于我们。软件持有者的基本信息。

(17) 退出系统。清空token，返回登录界面。



### 项目运行截图

![image-20220512113143008](https://s2.loli.net/2022/05/12/xaXZq3KTpGAb6nf.png)

![image-20220512113447505](https://s2.loli.net/2022/05/12/QAtSEIoDp2mPlMv.png)

![image-20220512113524408](https://s2.loli.net/2022/05/12/8TLR3gcHW5azrU4.png)

![image-20220512113629406](https://s2.loli.net/2022/05/12/XthZGnORL9S6v3i.png)

![image-20220512113703751](https://s2.loli.net/2022/05/12/anxbqdOokYHl1CJ.png)

![image-20220512113745011](https://s2.loli.net/2022/05/12/neSY7oszHLvXWjr.png)