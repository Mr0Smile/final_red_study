<template>
  <div class="container">
    <!-- 输入框 -->
    <div class="input-container">
      <input
          type="text"
          v-model="title"
          placeholder="请输入文章标题"
          class="title-input"
          required
      />
    </div>

    <!-- Markdown 编辑器 -->
    <div class="editor-container">
      <v-md-editor
          v-model="text"
          left-toolbar="undo redo | image"
          :disabled-menus="[]"
          @upload-image="handleUploadImage"
          height="500px"
          class="markdown-editor"
      />
    </div>

    <!-- 操作按钮 -->
    <div class="button-container">
      <button @click="goBack" class="return-button">返回</button>
      <button @click="saveArticle" class="save-button">保存文章</button>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRouter, useRoute } from 'vue-router';

// 路由管理
const router = useRouter();
const route = useRoute();
const title = ref('');    // 文章标题
const text = ref('');     // 文章内容
const author_id = ref(null); // 默认作者ID，初始化为 null
const articleId = ref(route.query.articleId); // 获取传入的 articleId

// 获取用户信息
onMounted(() => {
  const userInfo = JSON.parse(localStorage.getItem("system-user") || "{}");
  if (userInfo && userInfo.id) {
    author_id.value = userInfo.id;
  }

  //检查 articleId 是否有效
  if (articleId.value) {
    fetchArticle(); // 加载文章内容
  } else {
    console.error("没有提供有效的 articleId");
  }
});

// 获取文章方法
const fetchArticle = async () => {
  try {
    const response = await fetch(`http://localhost:9090/articles/selectById/${articleId.value}`);
    if (!response.ok) {
      throw new Error('无法获取文章内容');
    }
    const data = await response.json();
    if (data.data) {
      title.value = data.data.title;  // 设置标题
      text.value = data.data.content;  // 设置内容
    }
  } catch (error) {
    console.error("获取文章时出错:", error);
  }
};

// 返回操作
const goBack = () => {
  router.push({ name: 'text' }); // 跳转到文章列表页
};

// 处理图片上传
const handleUploadImage = async (event, insertImage, files) => {
  const file = files[0];
  if (!file) return;

  const formData = new FormData();
  formData.append('file', file);

  try {
    const response = await fetch('http://localhost:9090/files/upload', {
      method: 'POST',
      body: formData,
    });

    if (!response.ok) {
      throw new Error('网络响应不正常');
    }

    const result = await response.json();
    const imageUrl = result.data;

    if (imageUrl) {
      insertImage({ url: imageUrl, desc: file.name });
    }
  } catch (error) {
    console.error("上传失败:", error);
  }
};

// 保存文章
const saveArticle = async () => {
  // 格式化时间的函数
  const formatDate = (date) => {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');

    return `${year}/${month}/${day} ${hours}:${minutes}`;
  };

  const submit_time = formatDate(new Date());

  const articleData = {
    title: title.value,
    content: text.value,
    author_id: author_id.value,
    submit_time: submit_time,
    id: articleId.value,
  };

  try {
    const response = await fetch('http://localhost:9090/articles/update', {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ ...articleData }),
    });

    if (response.ok) {
      const result = await response.json();
      console.log("保存成功:", result);
      // 保存后清空表单
      text.value = '';
      title.value = '';
    } else {
      throw new Error('保存失败');
    }
  } catch (error) {
    console.error("保存文章时出错:", error);
  }
};
</script>

<style scoped>
/* 外层容器 */
.container {
  max-width: 800px;
  margin: 40px auto;
  padding: 30px;
  background: linear-gradient(135deg, #f0f4f8, #e8eaf6);
  border-radius: 16px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
}

/* 输入框区域 */
.input-container {
  margin-bottom: 20px;
}

/* 标题输入框样式 */
.title-input {
  width: 100%;
  padding: 18px 20px;
  margin: 0;
  border: 2px solid #d1d8e0;
  border-radius: 10px;
  font-size: 18px;
  font-weight: 500;
  background-color: #ffffff;
  color: #333;
  transition: border-color 0.3s, box-shadow 0.3s;
}

.title-input:focus {
  border-color: #6c63ff;
  outline: none;
  box-shadow: 0 0 8px rgba(108, 99, 255, 0.3);
}

/* 编辑器区域 */
.editor-container {
  margin-bottom: 30px;
  background-color: #f8f9fa;
  border-radius: 12px;
  padding: 15px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* 操作按钮容器 */
.button-container {
  display: flex;
  justify-content: space-between;
  gap: 20px;
}

/* 返回按钮样式 */
.return-button {
  padding: 14px 28px;
  background-color: #00d0e1;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s, transform 0.2s, box-shadow 0.2s;
  box-shadow: 0 4px 8px rgba(244, 67, 54, 0.3);
}

.return-button:hover {
  background-color: #d32f2f;
  box-shadow: 0 6px 12px rgba(244, 67, 54, 0.4);
}

.return-button:active {
  transform: scale(0.98);
}

/* 保存按钮样式 */
.save-button {
  padding: 14px 28px;
  background-color: #30d5c8;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s, transform 0.2s, box-shadow 0.2s;
  box-shadow: 0 4px 8px rgba(76, 175, 80, 0.3);
}

.save-button:hover {
  background-color: #388e3c;
  box-shadow: 0 6px 12px rgba(76, 175, 80, 0.4);
}

.save-button:active {
  transform: scale(0.98);
}

/* 整体布局调整 */
body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #f4f7fa;
  margin: 0;
  padding: 0;
}
</style>
