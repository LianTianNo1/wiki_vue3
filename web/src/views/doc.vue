<template>
    <a-layout>
        <a-layout-content :style="{ background: '#fff', padding: '24px', margin: 0, minHeight: '280px' }">
            <a-row>
                <a-col :span="6">
                    <a-tree
                        v-if="level1.length > 0"
                        :tree-data="level1"
                        @select="onSelect"
                        :replaceFields="{title: 'name',key: 'id', value: 'id'}"
                        :defaultExpandAll="true"
                    >
                    </a-tree>
                </a-col>
                <a-col :span="18">

                </a-col>
            </a-row>
        </a-layout-content>
    </a-layout>
</template>

<script lang="ts">
    import { defineComponent, onMounted, ref, createVNode } from 'vue';
    import axios from 'axios';
    import {message, Modal} from 'ant-design-vue';
    import {Tool} from "@/util/tool";
    import {useRoute} from "vue-router";
    import ExclamationCircleOutlined from "@ant-design/icons-vue/ExclamationCircleOutlined";
    import E from 'wangeditor';

    export default defineComponent({
        name: 'AdminDoc',
        setup(){
            const route = useRoute();
            const docs = ref();

            /**
             *一级文档树，children属性就是二级文档
             * [{
             *     id: "",
             *     name: "",
             *     children: [{
             *         id: "",
             *         name: "",
             *     }]
             * }]
             */
                //一级文档树,children属性就是二级文档
            const level1 = ref();
            level1.value = [];


            /**
             * 数据查询
             */
            const handleQuery = () => {
                axios.get("/doc/all").then((response) => {
                    const data = response.data;
                    if (data.success){
                        docs.value = data.content;
                        console.log("原始数组: ",docs.value);

                        level1.value = [];
                        level1.value = Tool.array2Tree(docs.value,0);
                        console.log("树形结构: ",level1);
                    }else {
                        message.error(data.message);
                    }
                });
            };


            onMounted(() => {
                handleQuery();
            });

            return {
                level1,
            }
        }
    });
</script>

<style scoped>
    img {
        width: 50px;
        height: 50px;
    }
</style>