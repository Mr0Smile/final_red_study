<template>
	<div>
		<el-menu
			router
			style="border: none"
			:default-active="router.currentRoute.value.path"
			:default-openeds="[]"
		>
			<div v-for="(item, index) in itemList" :key="index">
				<div v-if="item.params.show === true">
					<template v-if="item.children == null">
						<el-menu-item
							:index="item.path"
							v-if="
								data.user.role === item.params.role ||
								item.params.role == null
							"
						>
							<el-icon>
								<component :is="item.params.icon" />
							</el-icon>
							<span>{{ item.params.showText }}</span>
						</el-menu-item>
					</template>

					<template v-else>
						<el-sub-menu
							:index="item.params.index"
							v-if="
								data.user.role === item.params.role ||
								item.params.role == null
							"
						>
							<template #title>
								<el-icon><Menu /></el-icon>
								<span>{{ item.params.showText }}</span>
							</template>

							<div
								v-for="(subItem, subIndex) in item.children"
								:key="subIndex"
							>
								<el-menu-item :index="subItem.path">
									<el-icon>
										<component :is="subItem.params.icon" />
									</el-icon>
									<span>{{ subItem.params.showText }}</span>
								</el-menu-item>
							</div>
						</el-sub-menu>
					</template>
				</div>
			</div>

			<el-menu-item index="login" @click="logout">
				<el-icon><SwitchButton /></el-icon>
				<span>退出系统</span>
			</el-menu-item>
		</el-menu>
	</div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount, reactive } from "vue";
import router from "@/router";
import { ElMessage } from "element-plus";

const itemList = router.options.routes[0].children;

const data = reactive({
	user: JSON.parse(localStorage.getItem("system-user") || "{}"),
});

const logout = () => {
	ElMessage.success("退出成功");
	localStorage.removeItem("system-user");
};
</script>

<style scoped>
.navbar-container {
	display: flex;
	width: 100%;
	justify-content: space-between;
}

.el-menu-item a {
	text-decoration: none;
	margin-left: 20px; /* Adjust the spacing between menu items */
}

.el-main {
	padding-top: 60px; /* To make sure content is not hidden behind the navbar */
}

.el-menu-item.is-active {
	background-color: #f5f1ee;
}

.el-menu-item:hover {
	color: #a07359;
}

:deep(th) {
	color: #333;
}
</style>
