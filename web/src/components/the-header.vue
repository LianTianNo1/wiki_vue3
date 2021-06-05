<template>
    <a-layout-header class="header">
        <div class="logo" >
            <a href="/" style="color: white">
                <img class="re_img" src="@/assets/logo.png" style="width: 60px; height: 60px;">
                王志颖のwiki
            </a>
        </div>
        <a-menu
                theme="dark"
                mode="horizontal"
                :style="{ lineHeight: '64px'}"
                class="re_menu"
        >
            <a-menu-item key="Home">
                <router-link to="/">首页</router-link>
            </a-menu-item>
            <a-menu-item key="AdminUser" :style="user.id? {} : {display:'none'}">
                <router-link to="/admin/user">用户管理</router-link>
            </a-menu-item>
            <a-menu-item key="AdminEbook" :style="user.id? {} : {display:'none'}">
                <router-link to="/admin/ebook">电子书管理</router-link>
            </a-menu-item>
            <a-menu-item key="AdminCategory" :style="user.id? {} : {display:'none'}">
                <router-link to="/admin/category">分类管理</router-link>
            </a-menu-item>
            <a-menu-item key="About">
                <router-link to="/about">关于我</router-link>
            </a-menu-item>
            <a-popconfirm
                title="确认退出登录？"
                ok-text="是"
                cancel-text="否"
                @confirm="logout()"
            >
                <a class="login-menu" v-show="user.id">
                    <span>退出登录</span>
                </a>
            </a-popconfirm>
            <a class="login-menu" v-show="user.id">
                <span>你好: {{user.name}}</span>
            </a>
            <a class="login-menu" v-show="!user.id" @click="showLoginModal">
                <span>登录</span>
            </a>
        </a-menu>
        <a-modal
                title="登录"
                v-model:visible="loginModalVisible"
                :confirm-loading="loginModalLoading"
                @ok="login"
                okText="确定"
                cancelText="取消"
        >
            <a-form :model="loginUser" :label-col="{ span: 4 }" :wrapper-col="{ span: 19 }">
                <a-form-item label="用户名">
                    <a-input v-model:value="loginName" placeholder="请输入用户名" />
                </a-form-item>
                <a-form-item label="密码">
                    <a-input v-model:value="password" type="password" placeholder="请输入密码"/>
                </a-form-item>
            </a-form>
        </a-modal>
    </a-layout-header>
</template>

<script lang="ts">
    import {defineComponent, ref, computed, h, onMounted} from 'vue';
    import axios from 'axios';
    import {message, notification} from "ant-design-vue";
    import store from "@/store";
    import SmileOutlined from "@ant-design/icons-vue/SmileOutlined";
    import {Tool} from "@/util/tool";

    declare let hexMd5: any;
    declare let KEY: any;

    export default defineComponent({
        name: 'the-header',
        setup () {
            // 登录后保存
            const user = computed(() => store.state.user);

            // 从the-footer移植过来的WebSocket
            let websocket: any;
            let token: any;

            // 登录
            const loginUser = ref({
               loginName: "",
                password: ""
            });
            const loginName = ref("");
            const password = ref("");
            const loginModalVisible = ref(false);
            const loginModalLoading = ref(false);
            const showLoginModal = () => {
                loginModalVisible.value = true;
            }

            // 开始登录
            const login = () => {
                console.log("开始登录");
                loginModalLoading.value = true;
                loginUser.value.loginName = loginName.value;
                loginUser.value.password = hexMd5(password.value + KEY);
                axios.post('/user/login', loginUser.value).then((response) => {
                    loginModalLoading.value = false;
                    const data = response.data;
                    if (data.success) {
                        loginModalVisible.value = false;
                        message.success("登录成功!");
                        store.commit("setUser", data.content);
                    } else {
                        message.error(data.message);
                    }
                });
            };

            // 退出登录
            const logout = () => {
                console.log("退出登录");
                axios.get('/user/logout/' + user.value.token).then((response) => {
                    const data = response.data;
                    if (data.success) {
                        message.success("成功退出!");
                        store.commit("setUser", {});
                        loginName.value = "";
                        password.value = "";
                    } else {
                        message.error(data.message);
                    }
                });
            };

// ==========================================================
            // 从the-footer移植过来的WebSocket
            const onOpen = () => {
                console.log('WebSocket连接成功,状态码:', websocket.readyState);
            };
            const onMessage = (event: any) => {
                console.log('WebSocket收到消息: ', event.data);
                notification.open({
                    message: '收到消息',
                    description: event.data,
                    icon: h(SmileOutlined, { style: 'color: #108ee9' }),
                });
            };
            const onError = () => {
                console.log('WebSocket连接错误，状态码: ', websocket.readyState);
            };
            const onClose = () => {
                console.log('WebSocket连接关闭，状态码: ', websocket.readyState);
            };
            const initWebSocket = () => {
                // 连接成功
                websocket.onopen = onOpen;
                // 收到消息时的回调
                websocket.onmessage = onMessage;
                // 连接错误
                websocket.onerror = onError;
                // 连接关闭的回调
                websocket.onclose = onClose;
            };

            onMounted(() => {
                // WebSocket
                if ('WebSocket' in window) {
                    token = Tool.uuid(10);
                    // 连接地址:ws://127.0.0.1:8081/ws/xxx
                    websocket = new WebSocket(process.env.VUE_APP_WS_SERVER + '/ws/' + token);
                    initWebSocket();

                    // 关闭
                    // websocket.close();
                } else {
                    alert('当前浏览器不支持');
                }
            });


            return {
                loginModalVisible,
                loginModalLoading,
                showLoginModal,
                loginUser,
                login,
                user,
                logout,
                loginName,
                password
            }
        }
    });
</script>

<style>
    .re_img {
        /*border: #000 solid 2px;*/
        /*display: block;*/
        /*margin: 50px auto;*/
        /*border-radius: 50%;*/
        transition: all 2.0s;
    }
    .re_img:hover{
        transform: rotate(360deg);
    }
    .logo {
        width: 180px;
        height: 64px;
        float: left;
        color: white;
        font-size: 18px;
    }
    .login-menu{
        float: right;
        color: white;
        padding-left: 10px;
    }
</style>