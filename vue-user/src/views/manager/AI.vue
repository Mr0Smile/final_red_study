<template>
  <div class="chat-container" style="display: flex; flex-direction: column; height: 100%; background-color: white;">
    <!-- 上半部分：视频和聊天 -->
    <div class="top-section" style="flex: 1; display: flex;">
      <!-- 视频播放区 -->
      <div class="video-container" style="flex: 1; display: flex; flex-direction: column;">
        <!-- 视频卡片，添加v-show控制显示与隐藏 -->
        <el-card v-show="showVideo" shadow="hover" class="video-card" style="background-color: white;">
          <video
              ref="videoPlayer"
              loop
              muted
              :src="videoSrc"
              style="max-width: 100%; height: auto; object-fit: cover; border-radius: 10px"
          />
          <p style="text-align: center; margin-top: 10px;">AI-小团</p>
        </el-card>
        <!-- 命令区 -->
        <div class="command-area" style="margin-top: 10px; text-align: center;">
          <el-button type="default" @click="clearMessages">
            清空聊天
          </el-button>
          <!-- 新增的切换视频按钮 -->
          <el-tooltip content="切换视频显示">
            <el-button type="text" @click="toggleVideo" style="margin-left: 10px;">
              <el-icon v-if="showVideo"><ArrowLeft /></el-icon>
              <el-icon v-else><ArrowRight /></el-icon>
            </el-button>
          </el-tooltip>
        </div>
      </div>

      <!-- 聊天界面 -->
      <div class="chat-box" :style="chatBoxStyle" style="flex: 2; display: flex; flex-direction: column;">
        <el-card shadow="hover" class="messages-container" style="flex: 1; background-color: white;">
          <el-table
              :data="messages"
              stripe
              style="width: 100%;"
              class="message-table"
              height="100%"
              v-if="messages.length > 0"
          >
            <el-table-column>
              <template #default="scope">
                <div :class="scope.row.from">
                  <div class="message-timestamp">{{ formatTimestamp(scope.row.timestamp) }}</div>
                  <div v-html="formatMessage(scope.row.text)" class="table-message-content"></div>
                  <div class="message-actions" :class="scope.row.from">
                    <el-button type="text" size="small" @click="copyMessage(scope.row.text)" class="icon-button">
                      <el-icon><CopyDocument /></el-icon>
                    </el-button>
                    <el-button type="text" size="small" @click="copyAndPasteMessage(scope.row.text)" class="icon-button">
                      <el-icon><DocumentCopy /></el-icon>
                    </el-button>
                    <el-button type="text" size="small" @click="deleteMessage(scope.$index)" class="icon-button">
                      <el-icon><Delete /></el-icon>
                    </el-button>
                  </div>
                </div>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </div>
    </div>

    <!-- 输入区 -->
    <div class="input-section" style="margin-top: 10px; display: flex;">
      <el-input
          v-model="inputMessage"
          type="textarea"
          placeholder="请输入您的消息"
          clearable
          :autosize="{ minRows: 3, maxRows: 6 }"
          @keydown="handleKeyDown"
          style="flex-grow: 1; height: 100px;"
      ></el-input>
      <el-button type="primary" @click="sendMessage" class="icon-button" style="margin-left: 10px;">
        <el-icon><ArrowRightBold /></el-icon> <!-- 使用箭头图标替代纸飞机 -->
      </el-button>
    </div>
  </div>
</template>

<style scoped>
/* 这里可以添加其他样式 */
.chat-container {
  background-color: white; /* 设置整体背景颜色为白色 */
}

/* 你可以在这里添加其他的样式 */
.icon-button {
  font-size: 14px;
}
.video-container {
  transition: all 0.3s ease; /* 添加过渡效果 */
}
.chat-box {
  transition: flex 0.3s ease; /* 添加过渡效果 */
}
</style>

<script setup>
import { ref, nextTick, onBeforeUnmount, computed } from "vue";
import { ElMessage } from "element-plus";
import { CopyDocument, Delete, DocumentCopy, ArrowRightBold, ArrowLeft, ArrowRight } from '@element-plus/icons-vue';
import axios from 'axios';
import { ElTooltip } from 'element-plus';

// 动态导入视频文件
import videoFile from "@/assets/video/AI1.mp4"; // 请确保视频文件在 `src/assets/video/` 下

// 状态变量
const inputMessage = ref(""); // 输入的消息
const messages = ref([
  { text: "你好！欢迎来到聊天界面。", from: "bot", timestamp: new Date() },
]); // 消息列表
const videoSrc = ref(videoFile); // 视频路径
const videoPlayer = ref(null); // 视频元素引用

// 新增状态变量
const showVideo = ref(true); // 控制视频是否显示

// 计算聊天区的样式，根据showVideo调整flex
const chatBoxStyle = computed(() => {
  return showVideo.value
      ? { flex: 2 }
      : { flex: 3 };
});

// 新增方法
const toggleVideo = () => {
  if (showVideo.value) {
    stopVideo(); // 停止视频播放
  }
  showVideo.value = !showVideo.value;
};

// 停止视频播放
const stopVideo = () => {
  if (videoPlayer.value) {
    videoPlayer.value.pause();
    videoPlayer.value.currentTime = 0; // 可选，重置视频到起始位置
  }
};

// 发送消息函数
const sendMessage = async () => {
  if (!inputMessage.value.trim()) {
    ElMessage.warning("消息不能为空！");
    return;
  }

  // 添加用户消息
  messages.value.push({
    text: inputMessage.value,
    from: "user",
    timestamp: new Date(),
  });

  // 清空输入框
  const currentMessage = inputMessage.value;
  inputMessage.value = "";
  scrollToBottom();

  try {
    // 发送POST请求到后端
    const response = await axios.post('http://localhost:8989/process', {
      content: currentMessage
    });

    const { message_content, user_id, status } = response.data;

    // 添加机器人初始消息
    messages.value.push({
      text: message_content || "处理中，请稍候...",
      from: "bot",
      timestamp: new Date(),
    });

    scrollToBottom();

    // ... (其他逻辑，如果有的话)

  } catch (error) {
    console.error("发送消息失败：", error);
    ElMessage.error("发送消息失败，请稍后再试！");
  }
};

// 清空消息函数
const clearMessages = () => {
  messages.value = [];
  stopVideo(); // 清空后暂停视频
};

// 处理键盘事件
const handleKeyDown = (event) => {
  if (event.key === "Enter" && !event.shiftKey) {
    event.preventDefault();
    sendMessage();
  }
};

// 格式化消息文本以支持换行
const formatMessage = (text) => {
  return text.replace(/\n/g, '<br>');
};

// 格式化时间戳
const formatTimestamp = (timestamp) => {
  const date = new Date(timestamp);
  return `${date.getFullYear()}/${(date.getMonth() + 1)
      .toString()
      .padStart(2, '0')}/${date.getDate().toString().padStart(2, '0')} ${date
      .getHours()
      .toString()
      .padStart(2, '0')}:${date.getMinutes().toString().padStart(2, '0')}:${date
      .getSeconds()
      .toString()
      .padStart(2, '0')}`;
};

// 删除消息
const deleteMessage = (index) => {
  messages.value.splice(index, 1);
};

// 复制消息
const copyMessage = (text) => {
  navigator.clipboard.writeText(text).then(() => {
    ElMessage.success("消息已复制！");
  }).catch(() => {
    ElMessage.error("复制失败，请重试！");
  });
};

// 复制并粘贴消息
const copyAndPasteMessage = (text) => {
  navigator.clipboard.writeText(text).then(() => {
    inputMessage.value = text;
    ElMessage.success("消息已复制并粘贴！");
  }).catch(() => {
    ElMessage.error("复制失败，请重试！");
  });
};

// 滚动到消息底部
const scrollToBottom = () => {
  nextTick(() => {
    const container = document.querySelector(".messages-container .el-table__body-wrapper");
    if (container) {
      container.scrollTop = container.scrollHeight;
    }
  });
};

// 在组件卸载时清理定时器
onBeforeUnmount(() => {
  // 清理定时器的逻辑（如果有）...
});
</script>
