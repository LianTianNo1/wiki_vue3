<template>
  <a-layout>
    <a-layout-sider width="200" style="background: #fff">
      <a-menu
              mode="inline"
              :style="{ height: '100%', borderRight: 0 }"
              @click="handleClick"
      >
        <a-menu-item key="welcome">
            <HomeOutlined />
            <span>&nbsp;欢迎</span>
        </a-menu-item>
        <a-sub-menu v-for="item in level1" :key="item.id">
          <template v-slot:title>
                <span>
                  <BookOutlined />
                  {{item.name}}
                </span>
          </template>
          <a-menu-item v-for="child in item.children" :key="child.id">
            <ReadOutlined />
            <span>
              {{child.name}}
            </span>
          </a-menu-item>
        </a-sub-menu>
      </a-menu>
    </a-layout-sider>
    <a-layout-content
            :style="{ background: '#fff', padding: '24px', margin: 0, minHeight: '280px' }"
    >
      <div class="welcome" v-show="isShowWelcome">
        <the-welcome></the-welcome>
      </div>
      <a-list v-show="!isShowWelcome" item-layout="vertical" size="large" :grid="{ gutter: 20, column: 3 }"  :data-source="ebooks">
        <template #renderItem="{ item }">
          <a-list-item key="item.name">
            <template #actions>
              <span>
                <component v-bind:is="'FileTextOutlined'" style="margin-right: 8px" />
                {{ item.docCount }}
              </span>
              <span>
                <component v-bind:is="'UserOutlined'" style="margin-right: 8px" />
                {{ item.viewCount }}
              </span>
              <span>
                <component v-bind:is="'LikeOutlined'" style="margin-right: 8px" />
                {{ item.voteCount }}
              </span>
            </template>
            <a-list-item-meta :description="item.description">
              <template #title>
                <router-link :to="'/doc?ebookId=' + item.id">
                  {{ item.name }}
                </router-link>
              </template>
              <template #avatar><a-avatar :src="item.cover" /></template>
            </a-list-item-meta>
          </a-list-item>
        </template>
      </a-list>
    </a-layout-content>
  </a-layout>
</template>

<script lang="ts">
import { defineComponent,onMounted,ref,reactive,toRef } from 'vue';
import axios from 'axios';
import { message } from "ant-design-vue";
import { Tool } from "@/util/tool";
import TheWelcome from '@/components/the-welcome.vue';

/*const listData: any = [];
for (let i = 0; i < 23; i++) {
  listData.push({
    href: 'https://www.antdv.com/',
    title: `ant design vue part ${i}`,
    avatar: 'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png',
    description:
            'Ant Design, a design language for background applications, is refined by Ant UED Team.',
    content:
            'We supply a series of design principles, practical patterns and high quality design resources (Sketch and Axure), to help people create their product prototypes beautifully and efficiently.',
  });
}*/


export default defineComponent({
  name: 'Home',
  components: {
    TheWelcome
  },
  setup(){
    const ebooks = ref();
    // const ebook1 = reactive({books:[]})
    const level1 = ref();
    let categorys: any;
    /**
     * 查询所有分类
     */
    const handleQueryCategory = () => {
      axios.get("/category/all").then((response) => {
        const data = response.data;
        if (data.success) {
          categorys = data.content;
          console.log("原始数组: ",categorys);

          level1.value = [];
          level1.value = Tool.array2Tree(categorys,0);
          console.log("树形结构: ",level1.value);
        }else {
          message.error(data.message);
        }
      });
    };

    const isShowWelcome = ref(true);
    let categoryId2 = 0;
    const handleQueryEbook = () => {
      axios.get("/ebook/list",{
        params: {
          page: 1,
          size: 1000,
          categoryId2: categoryId2
        }
      }).then((response) => {
        const data = response.data;
        ebooks.value = data.content.list;
      });
    }


    const handleClick = (value: any) => {
      console.log("menu click",value);
      if (value.key === 'welcome'){
        isShowWelcome.value = true;
      }else {
        categoryId2 = value.key;
        isShowWelcome.value = false;
        handleQueryEbook();
      }
    }

    onMounted(() => {
      handleQueryCategory();
    });

    return{
      ebooks,
      // ebooks2:toRef(ebook1,"books"),
      // listData,
      pagination:{
        onChange: (page: any) => {
          console.log(page);
        },
        pageSize: 3,
      },

      handleClick,
      level1,
      isShowWelcome
    }
  }
});
</script>

<style scoped>
  .ant-avatar{
    width: 50px;
    height: 50px;
    line-height: 50px;
    border-radius: 8%;
    margin: 5px 0;
  }
</style>
