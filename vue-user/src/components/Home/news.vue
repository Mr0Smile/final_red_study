<template>
	<div class="news-card">
		<title_ Chinese="新闻" English="NEWS"></title_>

		<div v-for="newsItem in news" :key="newsItem.id">
			<div class="news-item">
				<div class="title" style="margin-bottom: 1.5%">
					{{ newsItem.title }}
				</div>
				<div
					class="content"
					style="
						color: #acaba5;
						overflow: hidden;
						display: -webkit-box;
						line-clamp: 3;
						-webkit-box-orient: vertical;
						-webkit-line-clamp: 3;
						margin-bottom: 4%;
					"
				>
					{{ newsItem.content }}
				</div>
			</div>
		</div>
	</div>
</template>

<script setup>
import { defineProps, ref } from "vue";

import title_ from "@/components/Home/title.vue";

defineProps({
	news: {
		type: Array,
		default: () => [
			{
				id: 1,
				title: "新闻1",
				content:
					"14 日，省委书记沈晓明在湘潭韶山市调研“我的韶山行”红色研学规划实施情况并主持召开座谈会，指出要切实增强做好“我的韶山行”红色研学工作的责任感使命感，群策群力把这项工作做得更好。",
			},
			{
				id: 2,
				title: "新闻2",
				content:
					"14 日，省委书记沈晓明在湘潭韶山市调研“我的韶山行”红色研学规划实施情况并主持召开座谈会，指出要切实增强做好“我的韶山行”红色研学工作的责任感使命感，群策群力把这项工作做得更好。",
			},
			{
				id: 3,
				title: "新闻3",
				content:
					"14 日，省委书记沈晓明在湘潭韶山市调研“我的韶山行”红色研学规划实施情况并主持召开座谈会，指出要切实增强做好“我的韶山行”红色研学工作的责任感使命感，群策群力把这项工作做得更好。",
			},
		],
	},
});

const activeName = ref(1);
</script>

<style scoped>
.news-card {
	height: 40vh;
}

.news-item {
	margin-bottom: 10px;
}

.content {
	color: #acaba5;
	overflow: hidden;
	display: -webkit-box;
	line-clamp: 3;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 3;
	margin-bottom: 5%;
}
</style>
