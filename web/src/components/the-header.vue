<template>
    <a-layout-header class="header">
        <div class="logo" />
        <a-menu
                theme="dark"
                mode="horizontal"
                :style="{ lineHeight: '64px' }"
        >
            <a-menu-item key="Home">
                <router-link to="/">首页</router-link>
            </a-menu-item>
            <a-menu-item key="AdminUser">
                <router-link to="/admin/user">用户管理</router-link>
            </a-menu-item>
            <a-menu-item key="AdminEbook">
                <router-link to="/admin/ebook">电子书管理</router-link>
            </a-menu-item>
            <a-menu-item key="AdminCategory">
                <router-link to="/admin/category">分类管理</router-link>
            </a-menu-item>
            <a-menu-item key="About">
                <router-link to="/about">关于我们</router-link>
            </a-menu-item>
            <a class="login-menu" @click="showLoginModal">
                <span>登录</span>
            </a>
        </a-menu>
        <a-modal
                title="登录"
                v-model:visible="loginModalVisible"
                :confirm-loading="loginModalLoading"
                @ok="login"
        >
            <a-form :model="loginUser" :label-col="{ span: 6 }" :wrapper-col="{ span: 18 }">
                <a-form-item label="登录名">
                    <a-input v-model:value="loginUser.loginName" />
                </a-form-item>
                <a-form-item label="密码">
                    <a-input v-model:value="loginUser.password" type="password" />
                </a-form-item>
            </a-form>
        </a-modal>
    </a-layout-header>
</template>

<script lang="ts">
    import { defineComponent, ref } from 'vue';
    import axios from 'axios';
    import { message } from "ant-design-vue";

    declare let hexMd5: any;
    declare let KEY: any;

    export default defineComponent({
        name: 'the-header',
        setup () {
            const loginUser = ref({
               loginName: "test",
                password: "test"
            });
            const loginModalVisible = ref(false);
            const loginModalLoading = ref(false);
            const showLoginModal = () => {
                loginModalVisible.value = true;
            }

            // 开始登录
            const login = () => {
                console.log("开始登录");
                loginModalLoading.value = true;
                loginUser.value.password = hexMd5(loginUser.value.password + KEY);
                axios.post('/user/login', loginUser.value).then((response) => {
                    loginModalLoading.value = false;
                    const data = response.data;
                    if (data.success) {
                        loginModalVisible.value = false;
                        message.success("登录成功!")
                    } else {
                        message.error(data.message);
                    }
                });
            };

            return {
                loginModalVisible,
                loginModalLoading,
                showLoginModal,
                loginUser,
                login
            }
        }
    });
</script>

<style>
    .login-menu{
        float: right;
        color: white;
    }
</style>