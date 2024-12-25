import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";

import ElementPlus from "element-plus";
import zhCn from "element-plus/dist/locale/zh-cn.mjs";
import * as ElementPlusIconsVue from "@element-plus/icons-vue";


import VMdPreview from '@kangc/v-md-editor/lib/preview';
import '@kangc/v-md-editor/lib/style/preview.css';
import VueMarkdownEditor from "@kangc/v-md-editor";
import "@kangc/v-md-editor/lib/style/base-editor.css";
import vuepressTheme from "@kangc/v-md-editor/lib/theme/vuepress.js";
import "@kangc/v-md-editor/lib/theme/style/vuepress.css";

import Prism from "prismjs";
import 'prismjs/components/prism-json';


import createCopyCodePlugin from '@kangc/v-md-editor/lib/plugins/copy-code/index';
import '@kangc/v-md-editor/lib/plugins/copy-code/copy-code.css';

import "@/assets/css/global.css";

const app = createApp(App);

VMdPreview .use(vuepressTheme, {Prism,});
VMdPreview .use(createCopyCodePlugin());

VueMarkdownEditor.use(vuepressTheme, {Prism,});
VueMarkdownEditor.use(createCopyCodePlugin());

app.use(router);
app.use(ElementPlus, {
	locale: zhCn,
});
app.use(VMdPreview );
app.use(VueMarkdownEditor);

app.mount("#app");

for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
	app.component(key, component);
}
