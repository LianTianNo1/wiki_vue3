-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: wiki3
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `parent` bigint(20) NOT NULL DEFAULT '0' COMMENT '父id',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (100,0,'前端开发',100),(101,100,'Vue',101),(102,100,'HTML & CSS',102),(200,0,'Java',200),(201,200,'基础应用',201),(202,200,'框架应用',202),(300,0,'Python',300),(301,300,'基础应用',301),(302,300,'进阶方向应用',302),(400,0,'数据库',400),(401,400,'MySQL',401),(500,0,'其它',500),(501,500,'服务器',501),(502,500,'开发工具',502),(503,500,'热门服务端语言',503),(491694010593280,100,'React',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content` (
  `id` bigint(20) NOT NULL COMMENT '文档id',
  `content` mediumtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文档内容';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (457704799236096,'<h1 id=\"kwsbb\">安装</h1>Vue.js 设计的初衷就包括可以被渐进式地采用。这意味着它可以根据需求以多种方式集成到一个项目中。<br><br>将 Vue.js 添加到项目中主要有四种方式：<br><br>在页面上以 CDN 包的形式导入。<br>下载 JavaScript 文件并自行托管。<br>使用 npm 安装它。<br>使用官方的 CLI 来构建一个项目，它为现代前端工作流程提供了功能齐备的构建设置 (例如，热重载、保存时的提示等等)。<br>#发布版本说明<br>最新版本：npm<br><br>每个版本的详细发布说明都可以在 GitHub 上找到。<br><br>#Vue Devtools<br>目前处于测试阶段 - Vuex 和 Router 的集成仍在进行中。<br><br>通过 Vue School 的免费课程学习如何安装和使用 Vue Devtools<br>在使用 Vue 时，我们推荐在你的浏览器上安装 Vue Devtools，它允许你在一个更友好的界面中审查和调试 Vue 应用。<br><br>获取 Chrome 扩展程序<br><br>获取 Firefox 附加组件<br><br>获取独立的 Electron 应用程序<br><br>#CDN<br>对于制作原型或学习，你可以这样使用最新版本：<br><br>&lt;script src=\"https://unpkg.com/vue@next\"&gt;&lt;/script&gt;<br>对于生产环境，我们推荐链接到一个明确的版本号和构建文件，以避免新版本造成的不可预期的破坏。<br><br>#下载并自托管<br>如果你想避免使用构建工具，但又无法在生产环境使用 CDN，那么你可以下载相关 .js 文件并自行托管在你的服务器上。然后你可以通过 &lt;script&gt; 标签引入，与使用 CDN 的方法类似。<br><br>这些文件可以在 unpkg 或者 jsDelivr 这些 CDN 上浏览和下载。各种不同文件将在以后解释，但你通常需要同时下载开发环境构建版本以及生产环境构建版本。<br><br>#npm<br>在用 Vue 构建大型应用时推荐使用 npm 安装[1] 。npm 能很好地和诸如 webpack 或 Rollup 模块打包器配合使用。<br><br># 最新稳定版<br>$ npm install vue@next<br>Vue 还提供了编写单文件组件的配套工具。如果你想使用单文件组件，那么你还需要安装 @vue/compiler-sfc：<br><br>$ npm install -D @vue/compiler-sfc<br>如果你是从 Vue 2 过渡而来的，请注意 @vue/compiler-sfc 替换掉了 vue-template-compiler<br><br>除了 @vue/compiler-sfc 之外，你还需要为已选择的打包工具选择一个配套的单文件组件 loader 或 plugin。更多信息请查阅单文件组件文档。<br><br>大多数情况下，我们更倾向于使用 Vue CLI 来创建一个配置最小化的 webpack 构建版本。<br><br>#命令行工具 (CLI)<br>Vue 提供了一个官方的 CLI，为单页面应用 (SPA) 快速搭建繁杂的脚手架。它为现代前端工作流提供了功能齐备的构建设置。只需要几分钟的时间就可以运行起来并带有热重载、保存时 lint 校验，以及生产环境可用的构建版本。更多详情可查阅 Vue CLI 的文档。<br><br>TIP<br><br>CLI 工具假定用户对 Node.js 和相关构建工具有一定程度的了解。如果你是新手，我们强烈建议先在不用构建工具的情况下通读指南，在熟悉 Vue 本身之后再使用 CLI。<br><br>对于 Vue 3，你应该使用 npm 上可用的 Vue CLI v4.5 作为 @vue/cli。要升级，你应该需要全局重新安装最新版本的 @vue/cli：<br><br>yarn global add @vue/cli<br># 或<br>npm install -g @vue/cli<br>然后在 Vue 项目中运行：<br><br>vue upgrade --next<br>#Vite<br>Vite 是一个 web 开发构建工具，由于其原生 ES 模块导入方式，可以实现闪电般的冷服务器启动。<br><br>通过在终端中运行以下命令，可以使用 Vite 快速构建 Vue 项目。<br><br>使用 npm：<br><br># npm 6.x<br>$ npm init vite@latest &lt;project-name&gt; --template vue<br><br># npm 7+，需要加上额外的双短横线<br>$ npm init vite@latest &lt;project-name&gt; -- --template vue<br><br>$ cd &lt;project-name&gt;<br>$ npm install<br>$ npm run dev<br>或者 yarn：<br><br>$ yarn create vite &lt;project-name&gt; --template vue<br>$ cd &lt;project-name&gt;<br>$ yarn<br>$ yarn dev<br>#对不同构建版本的解释<br>在 npm 包的 dist/ 目录你将会找到很多不同的 Vue.js 构建版本。下面是一个概述，根据不同的使用情况，应该使用哪个 dist 文件：<br><br>#使用 CDN 或没有构建工具<br>#vue(.runtime).global(.prod).js：<br>若要通过浏览器中的 &lt;script src=\"...\"&gt; 直接使用，则暴露 Vue 全局。<br>浏览器内模板编译：<br>vue.global.js 是包含编译器和运行时的“完整”构建版本，因此它支持动态编译模板。<br>vue.runtime.global.js 只包含运行时，并且需要在构建步骤期间预编译模板。<br>内联所有 Vue 核心内部包——即：它是一个单独的文件，不依赖于其他文件。这意味着你必须导入此文件和此文件中的所有内容，以确保获得相同的代码实例。<br>包含硬编码的 prod/dev 分支，并且 prod 构建版本是预先压缩过的。将 *.prod.js 文件用于生产环境。<br>提示<br><br>全局打包不是 UMD 构建的，它们被打包成 IIFEs，并且仅用于通过 &lt;script src=\"...\"&gt; 直接使用。<br><br>#vue(.runtime).esm-browser(.prod).js：<br>用于通过原生 ES 模块导入使用 (在浏览器中通过 &lt;script type=\"module\"&gt; 来使用)。<br>与全局构建版本共享相同的运行时编译、依赖内联和硬编码的 prod/dev 行为。<br>#使用构建工具<br>#vue(.runtime).esm-bundler.js：<br>用于 webpack，rollup 和 parcel 等构建工具。<br>留下 prod/dev 分支的 process.env.NODE_ENV 守卫语句 (必须由构建工具替换)。<br>不提供压缩版本 (打包后与其余代码一起压缩)。<br>import 依赖 (例如：@vue/runtime-core，@vue/runtime-compiler)<br>导入的依赖项也是 esm bundler 构建版本，并将依次导入其依赖项 (例如：@vue/runtime-core imports @vue/reactivity)。<br>这意味着你可以单独安装/导入这些依赖，而不会导致这些依赖项的不同实例，但你必须确保它们都为同一版本。<br>浏览器内模板编译：<br>vue.runtime.esm-bundler.js (默认) 仅运行时，并要求所有模板都要预先编译。这是构建工具的默认入口 (通过 package.json 中的 module 字段)，因为在使用构建工具时，模板通常是预先编译的 (例如：在 *.vue 文件中)。<br>vue.esm-bundler.js 包含运行时编译器。如果你使用了一个构建工具，但仍然想要运行时的模板编译 (例如，DOM 内 模板或通过内联 JavaScript 字符串的模板)，请使用这个文件。你需要配置你的构建工具，将 vue 设置为这个文件。<br>#对于服务端渲染<br>#vue.cjs(.prod).js：<br>通过 require() 在 Node.js 服务器端渲染使用。<br>如果你将应用程序与带有 target: \'node\' 的 webpack 打包在一起，并正确地将 vue 外部化，则将加载此文件。<br>dev/prod 文件是预构建的，但是会根据 process.env.NODE_ENV 自动加载相应的文件。<br>#运行时 + 编译器 vs. 仅运行时<br>如果需要在客户端上编译模板 (即：将字符串传递给 template 选项，或者使用元素的 DOM 内 HTML 作为模板挂载到元素)，你将需要编译器，因此需要完整的构建版本：<br><br>// 需要编译器<br>Vue.createApp({<br>  template: \'&lt;div&gt;{{ hi }}&lt;/div&gt;\'<br>})<br><br>// 不需要<br>Vue.createApp({<br>  render() {<br>    return Vue.h(\'div\', {}, this.hi)<br>  }<br>})<br>当使用 vue-loader 时，*.vue 文件中的模板会在构建时预编译为 JavaScript，在最终的捆绑包中并不需要编译器，因此可以只使用运行时构建版本。<br>'),(457740829388801,'<h1>介绍</h1><p>提示</p><p></p><p>已经了解 Vue 2，只想了解 Vue 3 的新功能可以参阅<a href=\"https://v3.cn.vuejs.org/guide/migration/introduction.html\">迁移指南</a>！</p>'),(457741436203009,'<h2>Vue.js 是什么</h2><p>Vue (读音 /vjuː/，类似于&nbsp;<strong>view</strong>) 是一套用于构建用户界面的<strong>渐进式框架</strong>。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与<a href=\"https://v3.cn.vuejs.org/guide/single-file-component.html\">现代化的工具链</a>以及各种<a href=\"https://github.com/vuejs/awesome-vue#components--libraries\" target=\"_blank\">支持类库<path></path><polygon></polygon></a>结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。</p><p>如果你想在深入学习 Vue 之前对它有更多了解，我们<a href=\"https://v3.cn.vuejs.org/guide/introduction.html#\">制作了一个视频</a>，带你了解其核心概念和一个示例工程。</p><section><a href=\"https://www.vuemastery.com/courses/intro-to-vue-3/intro-to-vue3\" target=\"_blank\">在 vue Mastery 上免费观看视频课程</a></section>'),(466505644945408,'<p>起步<br>安装<br><br>TIP<br><br>官方指南假设你已了解关于 HTML、CSS 和 JavaScript 的中级知识。如果你刚开始学习前端开发，将框架作为你的第一步可能不是最好的主意——掌握好基础知识再来吧！之前有其它框架的使用经验会有帮助，但这不是必需的<br><br>尝试 Vue.js 最简单的方法是使用 Hello World 例子，你可以在浏览器新标签页中打开它，跟着例子学习一些基础用法。<br><br>安装教程给出了更多安装 Vue 的方式。请注意我们不推荐新手直接使用 vue-cli，尤其是在你还不熟悉基于 Node.js 的构建工具时。<br><br>#声明式渲染<br>Vue.js 的核心是一个允许采用简洁的模板语法来声明式地将数据渲染进 DOM 的系统：<br><br>&lt;div id=\"counter\"&gt;<br>  Counter: {{ counter }}<br>&lt;/div&gt;<br>const Counter = {<br>  data() {<br>    return {<br>      counter: 0<br>    }<br>  }<br>}<br><br>Vue.createApp(Counter).mount(\'#counter\')<br>我们已经成功创建了第一个 Vue 应用！看起来这跟渲染一个字符串模板非常类似，但是 Vue 在背后做了大量工作。现在数据和 DOM 已经被建立了关联，所有东西都是响应式的。我们要怎么确认呢？请看下面的示例，其中 counter property 每秒递增，你将看到渲染的 DOM 是如何变化的：<br><br>const Counter = {<br>  data() {<br>    return {<br>      counter: 0<br>    }<br>  },<br>  mounted() {<br>    setInterval(() =&gt; {<br>      this.counter++<br>    }, 1000)<br>  }<br>}<br><br>除了文本插值，我们还可以像这样绑定元素的 attribute：<br><br>&lt;div id=\"bind-attribute\"&gt;<br>  &lt;span v-bind:title=\"message\"&gt;<br>    鼠标悬停几秒钟查看此处动态绑定的提示信息！<br>  &lt;/span&gt;<br>&lt;/div&gt;<br>const AttributeBinding = {<br>  data() {<br>    return {<br>      message: \'You loaded this page on \' + new Date().toLocaleString()<br>    }<br>  }<br>}<br><br>Vue.createApp(AttributeBinding).mount(\'#bind-attribute\')<br><br>这里我们遇到了一点新东西。你看到的 v-bind attribute 被称为指令。指令带有前缀 v-，以表示它们是 Vue 提供的特殊 attribute。可能你已经猜到了，它们会在渲染的 DOM 上应用特殊的响应式行为。在这里，该指令的意思是：“将这个元素节点的 title attribute 和当前活跃实例的 message property 保持一致”。<br><br>#处理用户输入<br>为了让用户和应用进行交互，我们可以用 v-on 指令添加一个事件监听器，通过它调用在实例中定义的方法：<br><br>&lt;div id=\"event-handling\"&gt;<br>  &lt;p&gt;{{ message }}&lt;/p&gt;<br>  &lt;button v-on:click=\"reverseMessage\"&gt;反转 Message&lt;/button&gt;<br>&lt;/div&gt;<br>const EventHandling = {<br>  data() {<br>    return {<br>      message: \'Hello Vue.js!\'<br>    }<br>  },<br>  methods: {<br>    reverseMessage() {<br>      this.message = this.message<br>        .split(\'\')<br>        .reverse()<br>        .join(\'\')<br>    }<br>  }<br>}<br><br>Vue.createApp(EventHandling).mount(\'#event-handling\')<br><br>注意在这个方法中，我们更新了应用的状态，但没有触碰 DOM——所有的 DOM 操作都由 Vue 来处理，你编写的代码只需要关注逻辑层面即可。<br><br>Vue 还提供了 v-model 指令，它能轻松实现表单输入和应用状态之间的双向绑定。<br><br>&lt;div id=\"two-way-binding\"&gt;<br>  &lt;p&gt;{{ message }}&lt;/p&gt;<br>  &lt;input v-model=\"message\" /&gt;<br>&lt;/div&gt;<br>const TwoWayBinding = {<br>  data() {<br>    return {<br>      message: \'Hello Vue!\'<br>    }<br>  }<br>}<br><br>Vue.createApp(TwoWayBinding).mount(\'#two-way-binding\')<br><br>#条件与循环<br>控制切换一个元素是否显示也相当简单：<br><br>&lt;div id=\"conditional-rendering\"&gt;<br>  &lt;span v-if=\"seen\"&gt;现在你看到我了&lt;/span&gt;<br>&lt;/div&gt;<br>const ConditionalRendering = {<br>  data() {<br>    return {<br>      seen: true<br>    }<br>  }<br>}<br><br>Vue.createApp(ConditionalRendering).mount(\'#conditional-rendering\')<br>这个例子演示了我们不仅可以把数据绑定到 DOM 文本或 attribute，还可以绑定到 DOM 的结构。此外，Vue 也提供一个强大的过渡效果系统，可以在 Vue 插入/更新/移除元素时自动应用过渡效果。<br><br>你可以在下面的沙盒中将 seen 从 true 更改为 false，以检查效果：<br><br><br>还有其它很多指令，每个都有特殊的功能。例如，v-for 指令可以绑定数组的数据来渲染一个项目列表：<br><br>&lt;div id=\"list-rendering\"&gt;<br>  &lt;ol&gt;<br>    &lt;li v-for=\"todo in todos\"&gt;<br>      {{ todo.text }}<br>    &lt;/li&gt;<br>  &lt;/ol&gt;<br>&lt;/div&gt;<br>const ListRendering = {<br>  data() {<br>    return {<br>      todos: [<br>        { text: \'Learn JavaScript\' },<br>        { text: \'Learn Vue\' },<br>        { text: \'Build something awesome\' }<br>      ]<br>    }<br>  }<br>}<br><br>Vue.createApp(ListRendering).mount(\'#list-rendering\')<br><br>#组件化应用构建<br>组件系统是 Vue 的另一个重要概念，因为它是一种抽象，允许我们使用小型、独立和通常可复用的组件构建大型应用。仔细想想，几乎任意类型的应用界面都可以抽象为一个组件树：<br><br>Component Tree<br><br>在 Vue 中，组件本质上是一个具有预定义选项的实例。在 Vue 中注册组件很简单：如对 App 对象所做的那样创建一个组件对象，并将其定义在父级组件的 components 选项中：<br><br>const TodoItem = {<br>  template: `&lt;li&gt;This is a todo&lt;/li&gt;`<br>}<br><br>// 创建 Vue 应用<br>const app = Vue.createApp({<br>  components: {<br>    TodoItem // 注册一个新组件<br>  },<br>  ... // 组件的其它 property<br>})<br><br>// 挂载 Vue 应用<br>app.mount(...)<br>现在，你可以将其放到另一个组件的模板中：<br><br>&lt;ol&gt;<br>  &lt;!-- 创建一个 todo-item 组件实例 --&gt;<br>  &lt;todo-item&gt;&lt;/todo-item&gt;<br>&lt;/ol&gt;<br>但是这样会为每个待办项渲染同样的文本，这看起来并不炫酷。我们应该能将数据从父组件传入子组件才对。让我们来修改一下组件的定义，使之能够接受一个 prop：<br><br>app.component(\'todo-item\', {<br>  props: [\'todo\'],<br>  template: `&lt;li&gt;{{ todo.text }}&lt;/li&gt;`<br>})<br>现在，我们可以使用 v-bind 指令将待办项传到循环输出的每个组件中：<br><br>&lt;div id=\"todo-list-app\"&gt;<br>  &lt;ol&gt;<br>     &lt;!--<br>      现在我们为每个 todo-item 提供 todo 对象<br>      todo 对象是变量，即其内容可以是动态的。<br>      我们也需要为每个组件提供一个“key”，稍后再<br>      作详细解释。<br>    --&gt;<br>    &lt;todo-item<br>      v-for=\"item in groceryList\"<br>      v-bind:todo=\"item\"<br>      v-bind:key=\"item.id\"<br>    &gt;&lt;/todo-item&gt;<br>  &lt;/ol&gt;<br>&lt;/div&gt;<br>const TodoList = {<br>  data() {<br>    return {<br>      groceryList: [<br>        { id: 0, text: \'Vegetables\' },<br>        { id: 1, text: \'Cheese\' },<br>        { id: 2, text: \'Whatever else humans are supposed to eat\' }<br>      ]<br>    }<br>  }<br>}<br><br>const app = Vue.createApp(TodoList)<br><br>app.component(\'todo-item\', {<br>  props: [\'todo\'],<br>  template: `&lt;li&gt;{{ todo.text }}&lt;/li&gt;`<br>})<br><br>app.mount(\'#todo-list-app\')<br><br>尽管这只是一个刻意设计的例子，但是我们已经设法将应用分割成了两个更小的单元。子单元通过 prop 接口与父单元进行了良好的解耦。我们现在可以进一步改进 &lt;todo-item&gt; 组件，提供更为复杂的模板和逻辑，而不会影响到父应用。<br><br>在一个大型应用中，有必要将整个应用程序划分为多个组件，以使开发更易管理。在后续教程中我们将详述组件，不过这里有一个 (假想的) 例子，以展示使用了组件的应用模板是什么样的：<br><br>&lt;div id=\"app\"&gt;<br>  &lt;app-nav&gt;&lt;/app-nav&gt;<br>  &lt;app-view&gt;<br>    &lt;app-sidebar&gt;&lt;/app-sidebar&gt;<br>    &lt;app-content&gt;&lt;/app-content&gt;<br>  &lt;/app-view&gt;<br>&lt;/div&gt;<br>#与自定义元素的关系<br>你可能已经注意到 Vue 组件与自定义元素非常类似——它是 Web Components 规范的一部分。确实，Vue 的组件设计 (如插槽 API) 在浏览器原生支持该规范前就部分受到了它的影响。<br><br>它们之间主要的不同在于，Vue 组件的数据模型是作为框架的一部分而设计的，而该框架为构建复杂应用提供了很多必要的附加功能。例如响应式模板和状态管理——这两者都没有被该规范所覆盖。<br><br>Vue 也为创建和使用自定义元素提供了很好的支持。关于其更多细节，请浏览 Vue 和 Web Components 章节。<br><br>#准备好了吗？<br>我们刚才简单介绍了 Vue 核心最基本的功能——本教程的其余部分将更加详细地涵盖这些功能以及其它高阶功能，所以请务必读完整个教程！<br></p>'),(487727374151680,'<p><h1><b id=\"901ec\">声明式渲染</b></h1>Vue.js 的核心是一个允许采用简洁的模板语法来声明式地将数据渲染进 DOM 的系统：<br><br>&lt;div id=\"counter\"&gt;<br>  Counter: {{ counter }}<br>&lt;/div&gt;<br>const Counter = {<br>  data() {<br>    return {<br>      counter: 0<br>    }<br>  }<br>}<br><br>Vue.createApp(Counter).mount(\'#counter\')<br>我们已经成功创建了第一个 Vue 应用！看起来这跟渲染一个字符串模板非常类似，但是 Vue 在背后做了大量工作。现在数据和 DOM 已经被建立了关联，所有东西都是响应式的。我们要怎么确认呢？请看下面的示例，其中 counter property 每秒递增，你将看到渲染的 DOM 是如何变化的：<br><br>const Counter = {<br>  data() {<br>    return {<br>      counter: 0<br>    }<br>  },<br>  mounted() {<br>    setInterval(() =&gt; {<br>      this.counter++<br>    }, 1000)<br>  }<br>}<br><br>除了文本插值，我们还可以像这样绑定元素的 attribute：<br><br>&lt;div id=\"bind-attribute\"&gt;<br>  &lt;span v-bind:title=\"message\"&gt;<br>    鼠标悬停几秒钟查看此处动态绑定的提示信息！<br>  &lt;/span&gt;<br>&lt;/div&gt;<br>const AttributeBinding = {<br>  data() {<br>    return {<br>      message: \'You loaded this page on \' + new Date().toLocaleString()<br>    }<br>  }<br>}<br><br>Vue.createApp(AttributeBinding).mount(\'#bind-attribute\')<br><br>这里我们遇到了一点新东西。你看到的 v-bind attribute 被称为指令。指令带有前缀 v-，以表示它们是 Vue 提供的特殊 attribute。可能你已经猜到了，它们会在渲染的 DOM 上应用特殊的响应式行为。在这里，该指令的意思是：“将这个元素节点的 title attribute 和当前活跃实例的 message property 保持一致”。<br><br>#处理用户输入<br>为了让用户和应用进行交互，我们可以用 v-on 指令添加一个事件监听器，通过它调用在实例中定义的方法：<br><br>&lt;div id=\"event-handling\"&gt;<br>  &lt;p&gt;{{ message }}&lt;/p&gt;<br>  &lt;button v-on:click=\"reverseMessage\"&gt;反转 Message&lt;/button&gt;<br>&lt;/div&gt;<br>const EventHandling = {<br>  data() {<br>    return {<br>      message: \'Hello Vue.js!\'<br>    }<br>  },<br>  methods: {<br>    reverseMessage() {<br>      this.message = this.message<br>        .split(\'\')<br>        .reverse()<br>        .join(\'\')<br>    }<br>  }<br>}<br><br>Vue.createApp(EventHandling).mount(\'#event-handling\')<br><br>注意在这个方法中，我们更新了应用的状态，但没有触碰 DOM——所有的 DOM 操作都由 Vue 来处理，你编写的代码只需要关注逻辑层面即可。<br><br>Vue 还提供了 v-model 指令，它能轻松实现表单输入和应用状态之间的双向绑定。<br><br>&lt;div id=\"two-way-binding\"&gt;<br>  &lt;p&gt;{{ message }}&lt;/p&gt;<br>  &lt;input v-model=\"message\" /&gt;<br>&lt;/div&gt;<br>const TwoWayBinding = {<br>  data() {<br>    return {<br>      message: \'Hello Vue!\'<br>    }<br>  }<br>}<br><br>Vue.createApp(TwoWayBinding).mount(\'#two-way-binding\')<br><br>#条件与循环<br>控制切换一个元素是否显示也相当简单：<br><br>&lt;div id=\"conditional-rendering\"&gt;<br>  &lt;span v-if=\"seen\"&gt;现在你看到我了&lt;/span&gt;<br>&lt;/div&gt;<br>const ConditionalRendering = {<br>  data() {<br>    return {<br>      seen: true<br>    }<br>  }<br>}<br><br>Vue.createApp(ConditionalRendering).mount(\'#conditional-rendering\')<br>这个例子演示了我们不仅可以把数据绑定到 DOM 文本或 attribute，还可以绑定到 DOM 的结构。此外，Vue 也提供一个强大的过渡效果系统，可以在 Vue 插入/更新/移除元素时自动应用过渡效果。<br><br>你可以在下面的沙盒中将 seen 从 true 更改为 false，以检查效果：<br><br><br>还有其它很多指令，每个都有特殊的功能。例如，v-for 指令可以绑定数组的数据来渲染一个项目列表：<br><br>&lt;div id=\"list-rendering\"&gt;<br>  &lt;ol&gt;<br>    &lt;li v-for=\"todo in todos\"&gt;<br>      {{ todo.text }}<br>    &lt;/li&gt;<br>  &lt;/ol&gt;<br>&lt;/div&gt;<br>const ListRendering = {<br>  data() {<br>    return {<br>      todos: [<br>        { text: \'Learn JavaScript\' },<br>        { text: \'Learn Vue\' },<br>        { text: \'Build something awesome\' }<br>      ]<br>    }<br>  }<br>}<br><br>Vue.createApp(ListRendering).mount(\'#list-rendering\')<br><br>#组件化应用构建<br>组件系统是 Vue 的另一个重要概念，因为它是一种抽象，允许我们使用小型、独立和通常可复用的组件构建大型应用。仔细想想，几乎任意类型的应用界面都可以抽象为一个组件树：<br><br>Component Tree<br><br>在 Vue 中，组件本质上是一个具有预定义选项的实例。在 Vue 中注册组件很简单：如对 App 对象所做的那样创建一个组件对象，并将其定义在父级组件的 components 选项中：<br><br>const TodoItem = {<br>  template: `&lt;li&gt;This is a todo&lt;/li&gt;`<br>}<br><br>// 创建 Vue 应用<br>const app = Vue.createApp({<br>  components: {<br>    TodoItem // 注册一个新组件<br>  },<br>  ... // 组件的其它 property<br>})<br><br>// 挂载 Vue 应用<br>app.mount(...)<br>现在，你可以将其放到另一个组件的模板中：<br><br>&lt;ol&gt;<br>  &lt;!-- 创建一个 todo-item 组件实例 --&gt;<br>  &lt;todo-item&gt;&lt;/todo-item&gt;<br>&lt;/ol&gt;<br>但是这样会为每个待办项渲染同样的文本，这看起来并不炫酷。我们应该能将数据从父组件传入子组件才对。让我们来修改一下组件的定义，使之能够接受一个 prop：<br><br>app.component(\'todo-item\', {<br>  props: [\'todo\'],<br>  template: `&lt;li&gt;{{ todo.text }}&lt;/li&gt;`<br>})<br>现在，我们可以使用 v-bind 指令将待办项传到循环输出的每个组件中：<br><br>&lt;div id=\"todo-list-app\"&gt;<br>  &lt;ol&gt;<br>     &lt;!--<br>      现在我们为每个 todo-item 提供 todo 对象<br>      todo 对象是变量，即其内容可以是动态的。<br>      我们也需要为每个组件提供一个“key”，稍后再<br>      作详细解释。<br>    --&gt;<br>    &lt;todo-item<br>      v-for=\"item in groceryList\"<br>      v-bind:todo=\"item\"<br>      v-bind:key=\"item.id\"<br>    &gt;&lt;/todo-item&gt;<br>  &lt;/ol&gt;<br>&lt;/div&gt;<br>const TodoList = {<br>  data() {<br>    return {<br>      groceryList: [<br>        { id: 0, text: \'Vegetables\' },<br>        { id: 1, text: \'Cheese\' },<br>        { id: 2, text: \'Whatever else humans are supposed to eat\' }<br>      ]<br>    }<br>  }<br>}<br><br>const app = Vue.createApp(TodoList)<br><br>app.component(\'todo-item\', {<br>  props: [\'todo\'],<br>  template: `&lt;li&gt;{{ todo.text }}&lt;/li&gt;`<br>})<br><br>app.mount(\'#todo-list-app\')<br><br>尽管这只是一个刻意设计的例子，但是我们已经设法将应用分割成了两个更小的单元。子单元通过 prop 接口与父单元进行了良好的解耦。我们现在可以进一步改进 &lt;todo-item&gt; 组件，提供更为复杂的模板和逻辑，而不会影响到父应用。<br><br>在一个大型应用中，有必要将整个应用程序划分为多个组件，以使开发更易管理。在后续教程中我们将详述组件，不过这里有一个 (假想的) 例子，以展示使用了组件的应用模板是什么样的：<br><br>&lt;div id=\"app\"&gt;<br>  &lt;app-nav&gt;&lt;/app-nav&gt;<br>  &lt;app-view&gt;<br>    &lt;app-sidebar&gt;&lt;/app-sidebar&gt;<br>    &lt;app-content&gt;&lt;/app-content&gt;<br>  &lt;/app-view&gt;<br>&lt;/div&gt;<br>#与自定义元素的关系<br>你可能已经注意到 Vue 组件与自定义元素非常类似——它是 Web Components 规范的一部分。确实，Vue 的组件设计 (如插槽 API) 在浏览器原生支持该规范前就部分受到了它的影响。<br><br>它们之间主要的不同在于，Vue 组件的数据模型是作为框架的一部分而设计的，而该框架为构建复杂应用提供了很多必要的附加功能。例如响应式模板和状态管理——这两者都没有被该规范所覆盖。<br><br>Vue 也为创建和使用自定义元素提供了很好的支持。关于其更多细节，请浏览 Vue 和 Web Components 章节。<br><br>#准备好了吗？<br>我们刚才简单介绍了 Vue 核心最基本的功能——本教程的其余部分将更加详细地涵盖这些功能以及其它高阶功能，所以请务必读完整个教程！<br></p>');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo`
--

DROP TABLE IF EXISTS `demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `demo` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='测试';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo`
--

LOCK TABLES `demo` WRITE;
/*!40000 ALTER TABLE `demo` DISABLE KEYS */;
INSERT INTO `demo` VALUES (1,'测试');
/*!40000 ALTER TABLE `demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc`
--

DROP TABLE IF EXISTS `doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doc` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `ebook_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '电子书id',
  `parent` bigint(20) NOT NULL DEFAULT '0' COMMENT '父id',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  `view_count` int(11) DEFAULT '0' COMMENT '阅读数',
  `vote_count` int(11) DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文档';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc`
--

LOCK TABLES `doc` WRITE;
/*!40000 ALTER TABLE `doc` DISABLE KEYS */;
INSERT INTO `doc` VALUES (1,1,0,'文档1',1,0,0),(2,1,1,'文档1.1',1,1,0),(3,1,0,'文档2',2,0,0),(4,1,3,'文档2.1',1,0,0),(5,1,3,'文档2.2',2,0,0),(6,1,5,'文档2.2.1',1,0,0),(457704799236096,453524338094080,0,'安装',1,194,12),(457740829388801,453524338094080,0,'介绍',2,24,1),(457741436203009,453524338094080,457740829388801,'vue.js是什么',1,41,3),(466505644945408,453524338094080,457740829388801,'起步',2,13,0),(487727374151680,453524338094080,457740829388801,'声明式渲染',3,9,2);
/*!40000 ALTER TABLE `doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebook`
--

DROP TABLE IF EXISTS `ebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ebook` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `category1_id` bigint(20) DEFAULT NULL COMMENT '分类1',
  `category2_id` bigint(20) DEFAULT NULL COMMENT '分类2',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `cover` varchar(200) DEFAULT NULL COMMENT '封面',
  `doc_count` int(11) NOT NULL DEFAULT '0' COMMENT '文档数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读数',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='电子书';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebook`
--

LOCK TABLES `ebook` WRITE;
/*!40000 ALTER TABLE `ebook` DISABLE KEYS */;
INSERT INTO `ebook` VALUES (1,'Spring Boot 入门教程',NULL,NULL,'零基础入门 Java 开发，企业级应用开发最佳首选框架',NULL,6,1,0),(2,'Vue 入门教程',NULL,NULL,'零基础入门 Vue 开发，企业级应用开发最佳首选框架',NULL,0,0,0),(3,'Python 入门教程',NULL,NULL,'零基础入门 Python 开发，企业级应用开发最佳首选框架',NULL,0,0,0),(4,'Mysql 入门教程',NULL,NULL,'零基础入门 Mysql 开发，企业级应用开发最佳首选框架',NULL,0,0,0),(5,'Oracle 入门教程',NULL,NULL,'零基础入门 Oracle 开发，企业级应用开发最佳首选框架',NULL,0,0,0),(453524338094080,'Vue入门教程',100,101,'零基础入门vue开发','https://cn.vuejs.org/images/logo.svg',5,281,18),(457729562062849,'JS高级教程',100,101,'0基础学习JavaScript','http://ku.90sjimg.com/element_origin_min_pic/00/85/77/1956e9e3afe5091.jpg',0,0,0),(462370778001408,'CSS奇技淫巧',100,102,NULL,'https://pic.onlinewebfonts.com/svg/img_573763.png',0,0,0),(462371697897472,'MySQL',400,401,'数据库MySQL','http://pngimg.com/uploads/mysql/mysql_PNG22.png',0,0,0),(462372096061440,'Python入门教程',300,301,NULL,'http://upload.mobiletrain.org/2018/1204/1543892567988.jpg',0,0,0);
/*!40000 ALTER TABLE `ebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebook_snapshot`
--

DROP TABLE IF EXISTS `ebook_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ebook_snapshot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ebook_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '电子书id',
  `date` date NOT NULL COMMENT '快照日期',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读数',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `view_increase` int(11) NOT NULL DEFAULT '0' COMMENT '阅读增长',
  `vote_increase` int(11) NOT NULL DEFAULT '0' COMMENT '点赞增长',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ebook_id_date_unique` (`ebook_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='电子书快照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebook_snapshot`
--

LOCK TABLES `ebook_snapshot` WRITE;
/*!40000 ALTER TABLE `ebook_snapshot` DISABLE KEYS */;
INSERT INTO `ebook_snapshot` VALUES (1,1,'2022-05-11',0,0,0,0),(2,2,'2022-05-11',0,0,0,0),(3,3,'2022-05-11',0,0,0,0),(4,4,'2022-05-11',0,0,0,0),(5,5,'2022-05-11',0,0,0,0),(8,1,'2022-05-12',1,0,1,0),(9,2,'2022-05-12',0,0,0,0),(10,3,'2022-05-12',0,0,0,0),(11,4,'2022-05-12',0,0,0,0),(12,5,'2022-05-12',0,0,0,0),(15,453524338094080,'2022-05-12',281,18,281,18),(16,457729562062849,'2022-05-12',0,0,0,0),(17,462370778001408,'2022-05-12',0,0,0,0),(18,462371697897472,'2022-05-12',0,0,0,0),(19,462372096061440,'2022-05-12',0,0,0,0);
/*!40000 ALTER TABLE `ebook_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='测试';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'测试','password');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `login_name` varchar(50) NOT NULL COMMENT '登陆名',
  `name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `password` char(32) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name_unique` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','测试','e70e2222a9d67c4f2eae107533359aa4'),(147010339005927424,'lang','浪亓','2bc0ef47182d889db7d96abf3503b518');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-12  0:16:40
