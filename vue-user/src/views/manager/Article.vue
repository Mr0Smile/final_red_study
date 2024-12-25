<template>
  <div class="article-container">
    <h1 class="article-title">{{ article.title }}</h1>
    <h1 class="submit_time">{{ article.submit_time }}</h1>

    <!-- 剔除这两行标题和时间 -->
    <!-- <h3>作者 ID: {{ article.author_id !== undefined ? article.author_id : 'N/A' }}</h3> -->
    <!-- <p>提交时间: {{ article.submit_time !== undefined ? article.submit_time : 'N/A' }}</p> -->
    <!-- 操作按钮 -->
    <div class="editor-preview">
      <v-md-preview :text="article.content"></v-md-preview>
    </div>

    <div class="button-container">
      <button @click="goBack" class="return-button">返回</button>
    </div>

  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router';
import router from "@/router";

// 获取路由参数
const route = useRoute();
const articleId = route.query.articleId;

const article = ref({
  title: '',
  content: '',
  author_id: '',
  submit_time: '',
});

// 获取文章方法
const fetchArticle = async () => {
  try {
    const response = await fetch(`http://localhost:9090/articles/selectById/${articleId}`);
    if (!response.ok) {
      throw new Error('无法获取文章内容');
    }
    const data = await response.json();
    console.log(data);
    article.value = data.data;
  } catch (error) {
    console.error("获取文章时出错:", error);
  }
};

const goBack = () => {
  router.push({ name: 'text' });
};

onMounted(() => {
  fetchArticle();
});
</script>

<style scoped>
.article-container {
  padding: 20px;
  max-width: 800px; /* 最大宽度，避免出界 */
  margin: 0 auto; /* 居中容器 */
}

.article-title {
  text-align: center; /* 标题居中 */
  font-size: 2.5em; /* 大一点的字体 */
  color: #2c3e50; /* 一种美观的颜色 */
  margin-bottom: 20px; /* 底部外边距 */
  font-weight: bold;
  border-bottom: 2px solid #eaeaea; /* 下方加一条横线 */
  padding-bottom: 10px; /* 给内容一些空间 */
}

.editor-preview {
  border: 1px solid #ccc; /* 边框 */
  border-radius: 8px; /* 圆角 */
  padding: 20px; /* 内边距 */
  margin-top: 20px; /* 上外边距 */
  background-color: #f9f9f9; /* 浅背景 */
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 阴影效果 */
}

.button-container {
  display: flex;
  justify-content: center;
  gap: 24px;
}

/* 返回按钮样式 */
.return-button {
  padding: 12px 30px;
  background-color: #f44336;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 18px;
  font-weight: 600;
  cursor: pointer;
  transition: background-color 0.3s, transform 0.2s ease-in-out, box-shadow 0.2s;
  box-shadow: 0 4px 8px rgba(244, 67, 54, 0.2);
}
</style>
