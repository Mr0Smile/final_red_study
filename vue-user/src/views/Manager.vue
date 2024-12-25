<template>
	<div class="main-container">
		<stickyNavbar />

		<div class="view-container" style="width: 100%">
			<router-view @updateUser="updateUser" style="margin: 0 auto" />
		</div>
	</div>
</template>

<script setup>
import { reactive } from "vue";

import stickyNavbar from "../components/stickyNavbar.vue";

const data = reactive({
	user: JSON.parse(localStorage.getItem("system-user") || "{}"),
});

const updateUser = () => {
	data.user = JSON.parse(localStorage.getItem("system-user") || "{}");
};
</script>

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
	padding: 0vh 5vh;
}

.el-menu-item.is-active {
	background-color: #e0edfd !important;
}

:deep(th) {
	color: #333;
}
</style>
