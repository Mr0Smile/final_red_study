<template>
  <div class="article-container">
    <!-- 查询及新建按钮 -->
    <div class="card" style="margin-bottom: 20px; padding: 20px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); border-radius: 12px;">
      <div class="button-container">
        <el-button type="primary" @click="navigateToCreate" class="btn-new-article">新建文章</el-button>
        <el-input
            v-model="data.title"
            class="search-input"
            placeholder="请输入名称查询"
        />
        <el-button type="primary" @click="load" class="btn-search">查询</el-button>
        <el-button type="info" @click="reset" class="btn-reset">重置</el-button>
      </div>
    </div>

    <!-- 文章列表展示 -->
    <div class="card" style="margin-bottom: 20px; padding: 25px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); border-radius: 12px;">
      <el-table :data="data.tableData" stripe style="border-radius: 8px;" :cell-style="{ padding: '15px' }">
        <el-table-column label="名称" prop="title" width="250"></el-table-column>
        <el-table-column label="用户id" prop="author_id" width="150"></el-table-column>
        <el-table-column label="提交时间" prop="submit_time" width="200"></el-table-column>
        <el-table-column label="操作" header-align="center" width="220">
          <template #default="scope">
            <el-button
                @click="gotoArticle(scope.row.id)"
                class="btn-action btn-view"
            >
              浏览
            </el-button>
            <el-button
                @click="editArticle(scope.row.id)"
                class="btn-action btn-edit"
            >
              编辑
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <!-- 分页组件 -->
    <div class="card" v-if="data.total" style="padding: 20px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); border-radius: 12px;">
      <el-pagination
          background
          layout="prev, pager, next"
          v-model:page-size="data.pageSize"
          v-model:current-page="data.pageNum"
          :total="data.total"
          style="text-align: center;"
          @current-change="load()"
          @next-click="next_click()"
          @prev-click="pre_click()"
      />
    </div>
  </div>
</template>

<script setup>
import request from "@/utils/request";
import {reactive} from "vue";
import {useRouter} from "vue-router"; // 引入 Vue Router

const router = useRouter(); // 创建 router 实例

const data = reactive({
  pageNum: 1,
  pageSize: 10,
  total: 0,
  formVisible: false,
  form: {},
  tableData: [],
  title: null,
  categoryList: [],
});

// 分页查询
const load = () => {
  request
      .get("/articles/selectPage", {
        params: {
          pageNum: data.pageNum,
          pageSize: data.pageSize,
          title: data.title,
        },
      })
      .then((res) => {
        data.tableData = res.data?.list;
        data.total = res.data?.total;
      });
};

const pre_click = () => {
  console.log(data.pageNum);
  load();
};

const next_click = () => {
  console.log(data.pageNum);
  load();
};

// 跳转到创建文章页面
const navigateToCreate = () => {
  router.push({name: 'create-article'});
};

// 跳转到文章详情页面
const gotoArticle = (articleId) => {
  router.push({name: "article", query: {articleId: articleId}});
};
const editArticle = (articleId) => {
  router.push({name: "edit-article", query: {articleId: articleId}});
};

// 重置查询
const reset = () => {
  data.title = null;
  load();
};

load();
</script>

<style scoped>
.article-container {
  padding: 30px;
  max-width: 1200px;
  margin: 0 auto;
  background-color: #f4f7fc;
  border-radius: 12px;
}

.card {
  background-color: #fff;
  border-radius: 12px;
  padding: 20px;
}

.button-container {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 15px;
}

.el-button {
  font-size: 14px;
  padding: 10px 20px;
  border-radius: 6px;
  transition: all 0.3s ease;
}

.el-button:hover {
  transform: translateY(-2px);
}

.search-input {
  width: 300px;
  padding: 8px;
  border-radius: 6px;
}

.btn-new-article {
  background-color: #409EFF;
  color: white;
  border: none;
}

.btn-search {
  background-color: #67C23A;
  color: white;
  border: none;
}

.btn-reset {
  background-color: #909399;
  color: white;
  border: none;
}

.btn-action {
  padding: 6px 15px;
  border-radius: 4px;
}

.btn-view {
  background-color: #409EFF;
  color: white;
}

.btn-edit {
  background-color: #67C23A;
  color: white;
}

.el-table {
  border-radius: 8px;
}

.el-pagination {
  margin-top: 20px;
}
</style>
