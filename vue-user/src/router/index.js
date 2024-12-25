import { createRouter, createWebHistory } from "vue-router";

const routes = [
	{
		path: "/",
		component: () => import("@/views/Manager.vue"),
		redirect: "/home",
		children: [
			// 首页
			{
				path: "home",
				name: "home",
				params: {
					showText: "首页",
					role: null,
					icon: "HomeFilled",
					show: true,
				},
				component: () => import("@/views/manager/Home.vue"),
			},
			// 研学基地
			{
				path: "studyBase",
				name: "studyBase",
				component: () => import("@/views/manager/StudyBase.vue"),
				params: {
					showText: "研学基地",
					icon: "Lock",
					show: true,
				},
			},
			// 购物页
			{
				path: "buy",
				name: "buy",
				params: {
					showText: "文创商城",
					role: "USER",
					icon: "Goods",
					show: true,
				},
				component: () => import("@/views/manager/Buy.vue"),
			},
			// 订单管理
			{
				path: "orders",
				name: "orders",
				params: { showText: "订单管理", icon: "Tickets", show: true },
				component: () => import("@/views/manager/Orders.vue"),
			},
			// 个人资料
			{
				path: "person",
				name: "person",
				params: { showText: "个人资料", icon: "User", show: true },
				component: () => import("@/views/manager/Person.vue"),
			},
			// 修改密码
			{
				path: "password",
				name: "password",
				params: { showText: "修改密码", icon: "Lock", show: true },
				component: () => import("@/views/manager/Password.vue"),
			},
			// 文章模版页
			{
				path: "article", // 使用动态参数 myData
				name: "article",
				component: () => import("@/views/manager/Article.vue"),
				params: { show: false }, // 导航栏不显示
			},
			{
				path: "text",
				name: "text",
				component: () => import("@/views/manager/Text.vue"),
				params: { showText: "文章", icon: "Tickets", show: true },
			},
			// 新建文章
			{
				path: "create-article", // 新增路由
				name: "create-article",
				component: () => import("@/views/manager/CreateArticle.vue"),
				params: { showText: "新建文章", icon: "Edit", show: false },
			},
			{
				path: "edit-article", // 新增路由
				name: "edit-article",
				component: () => import("@/views/manager/EditArticle.vue"),
				params: { show: false },
			},
			// 个人资料
			{
				path: "AI",
				name: "AI",
				params: { showText: "AI", icon: "User", show: true },
				component: () => import("@/views/manager/AI.vue"),
			},
		],
	},
	{ path: "/login", component: () => import("@/views/Login.vue") },
	{ path: "/register", component: () => import("@/views/Register.vue") },
];

const router = createRouter({
	history: createWebHistory(import.meta.env.BASE_URL),
	routes,
});

export default router;
