<template>
	<div class="main-container">
		<div
			style="
				height: 60px;
				background-color: #fff;
				display: flex;
				align-items: center;
				border-bottom: 1px solid #ddd;
			"
		>
			<div style="flex: 1">
				<div
					style="
						padding-left: 20px;
						display: flex;
						align-items: center;
					"
				>
					<img
						src="@/assets/imgs/logo.png"
						alt=""
						style="width: 40px"
					/>
					<div
						style="
							font-weight: bold;
							font-size: 24px;
							margin-left: 5px;
						"
					>
						后台管理
					</div>
				</div>
			</div>

			<div
				style="
					width: fit-content;
					padding-right: 10px;
					display: flex;
					align-items: center;
				"
			>
				<img
					style="width: 40px; height: 40px; border-radius: 50%"
					:src="
						data.user.avatar ||
						'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
					"
					alt=""
				/>
				<span style="margin-left: 5px">
					<div v-if="data.user.id != undefined">
						{{ data.user.name }}
					</div>
					<div v-else @click="login" style="cursor: pointer">
						请登录
					</div>
				</span>
			</div>
		</div>

		<div style="display: flex">
			<div
				style="
					width: 200px;
					border-right: 1px solid #ddd;
					min-height: calc(100vh - 60px);
					background-color: #f8f8ff;
				"
			>
				<stickyNavbar />
			</div>

			<div style="flex: 1; width: 100%; padding: 10px">
				<router-view @updateUser="updateUser" style="margin: 0 auto" />
			</div>
		</div>
	</div>
</template>

<style scoped>
.main-container {
	min-height: 100vh;
	width: 100%;
	background-image: url("../assets/imgs/background.png");
	background-size: cover;
	background-repeat: repeat-y;
	overflow: hidden;
}

.view-container {
	padding: 5vh 5vh;
}
</style>

<script setup>
import { reactive, onMounted } from "vue";
import router from "@/router";
import { ElMessage } from "element-plus";

import stickyNavbar from "../components/stickyNavbar.vue";

const data = reactive({
	user: JSON.parse(localStorage.getItem("system-user") || "{}"),
});

const updateUser = () => {
	data.user = JSON.parse(localStorage.getItem("system-user") || "{}");
};

const checkLogin = () => {
	if (!data.user?.id) {
		ElMessage.error("请登录！");
		router.push("/login");
	}
};

const login = () => {
	router.push("/login");
};

onMounted(() => {
	checkLogin();
});
</script>
