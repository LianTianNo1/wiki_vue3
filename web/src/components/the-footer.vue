<template>
    <div>
        <a-layout-footer style="text-align: center;
                            position: absolute;
                            bottom: 0;
                            width: 100%;
                            height: 40px
                            ">
           <span style="width: 60px;
                           height: 20px;
                           position: absolute;
                           top: 0;
                           right: 0;
                           bottom: 0;
                           left: 0;
                           margin: auto;
                            ">
               王志颖&copy;
           </span>
        </a-layout-footer>

    </div>
</template>

<script lang="ts">
    import { defineComponent, computed, onMounted, h } from 'vue';
    import store from "@/store";
    import { Tool } from "@/util/tool";
    import { notification } from "ant-design-vue";
    import SmileOutlined from "@ant-design/icons-vue/SmileOutlined";

    export default defineComponent({
        name: 'the-footer',
        setup() {
            const user = computed(() => store.state.user);



            return {
                user
            }
        }
    });
</script>