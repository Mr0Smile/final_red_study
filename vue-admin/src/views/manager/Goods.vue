<template>
	<div>
		<div class="card" style="margin-bottom: 5px">
			<el-input
				v-model="data.name"
				style="width: 300px; margin-right: 10px"
				placeholder="请输入名称查询"
			></el-input>
			<el-button type="primary" @click="load">查询</el-button>
			<el-button type="info" style="margin: 0 10px" @click="reset"
				>重置</el-button
			>
		</div>

		<div class="card" style="margin-bottom: 5px; min-height: 70vh">
			<div style="margin-bottom: 10px">
				<el-button type="primary" @click="handleAdd">新增</el-button>
			</div>
			<el-table :data="data.tableData" stripe>
				<el-table-column label="名称" prop="name"></el-table-column>
				<el-table-column label="图片" prop="img">
					<template #default="scope">
						<el-image
							style="border-radius: 5%; max-width: 50px"
							:src="scope.row.img"
							:preview-src-list="[scope.row.img]"
							:preview-teleported="true"
						></el-image>
					</template>
				</el-table-column>
				<el-table-column label="简介" prop="descr"></el-table-column>
				<el-table-column label="特色" prop="specials"></el-table-column>
				<el-table-column label="单价" prop="price"></el-table-column>
				<el-table-column label="折扣" prop="discount"></el-table-column>
				<el-table-column label="单位" prop="unit"></el-table-column>
				<el-table-column label="库存" prop="stock"></el-table-column>
				<el-table-column
					label="分类"
					prop="category_name"
				></el-table-column>
				<el-table-column label="操作" header-align="center" width="160">
					<template #default="scope">
						<el-button type="primary" @click="handleEdit(scope.row)"
							>编辑</el-button
						>
						<el-button
							type="danger"
							@click="handleDelete(scope.row.id)"
							>删除</el-button
						>
					</template>
				</el-table-column>
			</el-table>
		</div>

		<div class="card" v-if="data.total">
			<el-pagination
				background
				layout="prev, pager, next"
				v-model:page-size="data.pageSize"
				v-model:current-page="data.pageNum"
				:total="data.total"
			/>
		</div>

		<el-dialog
			title="书籍信息"
			width="40%"
			v-model="data.formVisible"
			:close-on-click-modal="false"
			destroy-on-close
		>
			<el-form
				:model="data.form"
				label-width="100px"
				style="padding-right: 50px"
			>
				<el-form-item label="名称" prop="name">
					<el-input v-model="data.form.name" autocomplete="off" />
				</el-form-item>
				<el-form-item label="图片" prop="img">
					<el-upload
						:action="uploadUrl"
						list-type="picture"
						:on-success="handleImgSuccess"
					>
						<el-button size="small" type="primary"
							>点击上传</el-button
						>
					</el-upload>
				</el-form-item>
				<el-form-item label="简介" prop="descr">
					<el-input
						v-model="data.form.descr"
						autocomplete="off"
						type="textarea"
					/>
				</el-form-item>
				<el-form-item label="特色" prop="specials">
					<el-input v-model="data.form.specials" autocomplete="off" />
				</el-form-item>
				<el-form-item label="单价" prop="price">
					<el-input v-model="data.form.price" autocomplete="off" />
				</el-form-item>
				<el-form-item label="折扣" prop="discount">
					<el-input v-model="data.form.discount" autocomplete="off" />
				</el-form-item>
				<el-form-item label="单位" prop="unit">
					<el-input v-model="data.form.unit" autocomplete="off" />
				</el-form-item>
				<el-form-item label="库存" prop="stock">
					<el-input v-model="data.form.stock" autocomplete="off" />
				</el-form-item>
				<el-form-item label="分类" prop="category_id">
					<el-select
						v-model="data.form.category_id"
						placeholder="请选择分类"
						style="width: 60%"
					>
						<el-option
							v-for="item in data.categoryList"
							:key="item.id"
							:label="item.category"
							:value="item.id"
						/>
					</el-select>
				</el-form-item>
			</el-form>
			<template #footer>
				<span class="dialog-footer">
					<el-button @click="data.formVisible = false"
						>取 消</el-button
					>
					<el-button type="primary" @click="save">保 存</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>

<script setup>
import request from "@/utils/request";
import { reactive } from "vue";
import { ElMessageBox, ElMessage } from "element-plus";

// 文件上传的接口地址
const uploadUrl = import.meta.env.VITE_BASE_URL + "/files/upload";

const data = reactive({
	pageNum: 1,
	pageSize: 10,
	total: 0,
	formVisible: false,
	form: {},
	tableData: [],
	name: null,
	categoryList: [],
});

request.get("/category/selectAll").then((res) => {
	data.categoryList = res.data;
});

// 分页查询
const load = () => {
	request
		.get("/goods/selectPage", {
			params: {
				pageNum: data.pageNum,
				pageSize: data.pageSize,
				name: data.name,
			},
		})
		.then((res) => {
			data.tableData = res.data?.list;
			data.total = res.data?.total;
		});
};

// 新增
const handleAdd = () => {
	data.form = { discount: 1 };
	data.formVisible = true;
};

// 编辑
const handleEdit = (row) => {
	data.form = JSON.parse(JSON.stringify(row));
	data.formVisible = true;
};

// 新增保存
const add = () => {
	request.post("/goods/add", data.form).then((res) => {
		if (res.code === "200") {
			load();
			ElMessage.success("操作成功");
			data.formVisible = false;
		} else {
			ElMessage.error(res.msg);
		}
	});
};

// 编辑保存
const update = () => {
	request.put("/goods/update", data.form).then((res) => {
		if (res.code === "200") {
			load();
			ElMessage.success("操作成功");
			data.formVisible = false;
		} else {
			ElMessage.error(res.msg);
		}
	});
};

// 弹窗保存
const save = () => {
	// data.form有id就是更新，没有就是新增
	console.log(data.form);
	data.form.id ? update() : add();
};

// 删除
const handleDelete = (id) => {
	ElMessageBox.confirm("删除后数据无法恢复，您确定删除吗?", "删除确认", {
		type: "warning",
	})
		.then((res) => {
			request.delete("/goods/delete/" + id).then((res) => {
				if (res.code === "200") {
					load();
					ElMessage.success("操作成功");
				} else {
					ElMessage.error(res.msg);
				}
			});
		})
		.catch((err) => {});
};

// 重置
const reset = () => {
	data.name = null;
	load();
};

// 处理文件上传的钩子
const handleImgSuccess = (res) => {
	data.form.img = res.data; // res.data就是文件上传返回的文件路径，获取到路径后赋值表单的属性
};

load();
</script>
