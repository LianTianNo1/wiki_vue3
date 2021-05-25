<template>
    <a-layout-footer style="text-align: center">
        Wiki@wzy<span v-show="user.id">, 欢迎: {{user.name}}</span>
    </a-layout-footer>
</template>

<script lang="ts">
    import { defineComponent, computed, onMounted } from 'vue';
    import store from "@/store";
    import { Tool } from "@/util/tool";

    export default defineComponent({
        name: 'the-footer',
        setup() {
            const user = computed(() => store.state.user);

            let websocket: any;
            let token: any;
            const onOpen = () => {
                console.log('WebSocket连接成功,状态码:', websocket.readyState);
            };
            const onMessage = (event: any) => {
                console.log('WebSocket收到消息: ', event.data);
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
                user
            }
        }
    });
</script>