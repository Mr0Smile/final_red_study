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
import { useRouter } from 'vue-router';

const router = useRouter();
const title = ref('');
const text = ref('');
const author_id = ref(null);

onMounted(() => {
  const userInfo = JSON.parse(localStorage.getItem("system-user") || "{}");
  if (userInfo && userInfo.id) {
    author_id.value = userInfo.id;
  }
});

const goBack = () => {
  router.push({ name: 'text' });
};

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

const saveArticle = async () => {
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
  };

  try {
    const response = await fetch('http://localhost:9090/articles/add', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(articleData),
    });

    if (response.ok) {
      const result = await response.json();
      console.log("保存成功:", result);
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
/* 全局布局 */
body {
  font-family: 'Arial', sans-serif; /* 更简洁的字体 */
  background-color: #f5f5f5; /* 背景色变为浅灰色 */
  margin: 0;
  padding: 0;
}

/* 外层容器 */
.container {
  max-width: 900px;
  margin: 40px auto;
  padding: 40px 30px;
  background-color: #ffffff;
  border-radius: 12px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
}

/* 输入框区域 */
.input-container {
  margin-bottom: 20px;
}

/* 标题输入框样式 */
.title-input {
  width: 100%;
  padding: 16px 20px;
  font-size: 18px;
  border: 1px solid #e0e0e0;
  border-radius: 10px;
  background-color: #fafafa;
  transition: border-color 0.3s, box-shadow 0.3s ease-in-out;
}

.title-input:focus {
  border-color: #007bff;
  outline: none;
  box-shadow: 0 0 8px rgba(0, 123, 255, 0.4);
}

/* 编辑器区域 */
.editor-container {
  margin-bottom: 30px;
  background-color: #f9f9f9;
  border-radius: 12px;
  padding: 20px;
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.05);
}

/* 操作按钮容器 */
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

.return-button:hover {
  background-color: #c62828;
  box-shadow: 0 6px 12px rgba(244, 67, 54, 0.4);
}

.return-button:active {
  transform: scale(0.98);
}

/* 保存按钮样式 */
.save-button {
  padding: 12px 30px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 18px;
  font-weight: 600;
  cursor: pointer;
  transition: background-color 0.3s, transform 0.2s ease-in-out, box-shadow 0.2s;
  box-shadow: 0 4px 8px rgba(0, 123, 255, 0.2);
}

.save-button:hover {
  background-color: #0056b3;
  box-shadow: 0 6px 12px rgba(0, 123, 255, 0.4);
}

.save-button:active {
  transform: scale(0.98);
}
</style>
