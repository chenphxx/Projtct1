# README

## 项目简介

一款修仙题材游戏的前期原型项目: 先用 JS 搭建 Web 应用模拟各个游戏模块(门派,物品,角色,种族等), 后期迁移到游戏引擎 世界观与玩法设定见 `background/` 目录, 数据库结构已就绪(MySQL, 库名 `lhlord`)

## 当前进度

- [x] 数据库表结构: 物品分类 / 物品 / 角色 / 种族 / 亚种 / 门派 / 门派成员([database/schema/init.sql](database/schema/init.sql))
- [x] 种子数据: 种族,亚种,门派,物品已导入([database/seed/](database/seed/))
- [x] Web 管理后台: 数据库查看与编辑,建表,表结构修改,导入导出,深浅色模式(前后端分离, Vue 3 + Node.js)
- [x] 炼丹系统第一版: 丹方,丹炉,自动/自由配药,批量炼丹,丹药 buff,丹毒,灵田种植与收获
- [x] 炼丹系统支持不选丹方的自由炼丹,药架分类筛选,新增更多药材与丹方

## 技术架构

已选定方案 A: 前端 Vue 3 + Element Plus, 后端 Node.js + Express, 通过 RESTful API 读写 MySQL.整体项目为 JS 原型, 后期迁移游戏引擎时, 后端 API 可原样复用, 游戏部分以引擎替换前端即可

### 目录结构

```
lhlord/
|-- frontend/        # Vue 3 + Vite + Element Plus 管理后台
|   `-- src/
|       |-- api/       # axios 封装
|       |-- utils/     # 公共工具(字段类型常量等)
|       `-- views/     # 页面组件(数据表浏览/增删改查)
|-- server/          # Node.js + Express 后端, 提供 RESTful API
|   `-- src/
|       |-- index.js   # 服务入口
|       |-- db.js      # MySQL 连接池(mysql2)
|       `-- routes/    # 数据表 API 路由
|-- database/        # SQL 建表与种子数据
|-- background/      # 游戏设定
|-- README.md
`-- CHANGELOG.md
```

### 管理后台功能

- 左侧列出 `lhlord` 库全部数据表(含表注释), 点击切换
- 表数据浏览: 分页,模糊搜索,表结构查看
- 记录编辑: 新增 / 修改 / 删除, 表单按字段类型自动生成(数字/日期/布尔/长文本)
- 表结构管理: 左侧"新增表"按钮创建数据表; 表结构抽屉支持新增/修改/删除字段, 修改字段名/类型/可空性或删除字段时弹窗确认
- 字段影响分析: 删除字段前自动列出其他表中的同名字段与逻辑外键引用
- 数据导入导出: 勾选记录后导出 CSV / JSON, 支持 CSV / JSON 文件批量导入
- 字段复制: 数据行悬停时每个字段旁显示复制按钮, 一键复制单元格内容
- SQL 调试: 左侧"数据库调试"打开 SQL 控制台, 支持 SELECT / SHOW / DESCRIBE / EXPLAIN 只读查询(禁止写语句), 可切换当前数据库(独立连接, 不影响管理后台主连接)
- 主题切换: 右上角按钮切换深色 / 浅色模式, 偏好保存在本地
- 炼丹系统: 默认进入炼丹工作台, 支持修士命牌快捷改属性,丹炉品质调整,药架自由选药,自动配药,试炼预览与开炉炼丹
- 炼丹系统内分丹房与背包两个 tab, 炼丹产出自动进入角色背包
- 炼丹系统 tab 隐藏左侧数据表与工具栏, 数据卷宗工具仅在管理后台展示
- 背包支持药材/丹药/炼丹炉分类筛选, 物品带图标, 药架药材数量输入不设上限
- 炼丹系统支持 1-12 级丹炉与丹方, 药架支持等级筛选, 炉中药材支持替换
- 炼丹模式固定顶部 tab 于右上角, 隐藏卷宗统计; 丹炉形象按等级变化, 背包筛选单行展示
- 开炉炼丹不校验库存数量, 试炼预览默认自动计算, 炉中药材展示主辅引属性
- 试炼预览展示预计成丹名称, 药架与背包支持模糊/精确搜索
- 管理后台 db-chip 位于 tab 左侧, 药架/背包筛选与搜索同排, 药材卡布局更紧凑
- 右侧药材与背包使用独立模拟背包, 不随左侧角色切换, 炼丹结果不写回背包
- 右侧药架默认提供全部药材, 背包分类按钮单行展示, 左侧命牌随页面滚动保持固定
- 修复试炼预览 inventoryCharacterId 错误, 自动配药与炼丹结果回写独立模拟背包
- 新增更多药材与丹方, 药架支持翻页, 背包改为卡片排列
- 修复修士命牌滚动定位, 移除父容器 overflow 对 sticky 的干扰
- 修士命牌改为 fixed 定位, 滚动测试保持固定
- 修士命牌容器 studio-left 与身份卡同时固定在左侧, identity-card 位于 studio-left 内
- 丹房页面仅右侧工作台滚动, 背包页面仅药架网格滚动, 主体不滚动
- 背包卡片描述文字超出修复, 炼丹炉卡片高度恢复正常
- 修复背包卡片上下重叠, 明确网格行高
- 修复炉中药材面板内容溢出, 搜索框与筛选框水平对齐
- 修复 selected-panel 子元素垂直溢出, 搜索筛选恢复上一版样式
- 删除 section-title 顶部空白, 标题贴近父容器顶部
- selected-panel 改为高度自适应, 随药材列表增长

### 后端 API

| 方法 | 路径 | 说明 |
| --- | --- | --- |
| GET | /api/tables | 数据表列表 |
| POST | /api/tables | 新建数据表 |
| GET | /api/tables/:table | 表结构(字段/类型/主键/注释) |
| POST | /api/tables/:table/columns | 新增字段 |
| PUT | /api/tables/:table/columns/:column | 修改字段(改名/类型/可空/默认值/注释) |
| DELETE | /api/tables/:table/columns/:column | 删除字段 |
| GET | /api/tables/:table/columns/:column/refs | 字段影响分析(同名字段/逻辑外键引用) |
| GET | /api/tables/:table/data | 表数据(分页 + 模糊搜索) |
| POST | /api/tables/:table | 新增记录 |
| POST | /api/tables/:table/import | 批量导入记录 |
| PUT | /api/tables/:table/:id | 按主键更新记录 |
| DELETE | /api/tables/:table/:id | 按主键删除记录 |
| GET | /api/debug/databases | 可用数据库列表 |
| POST | /api/debug/use | 切换调试数据库 |
| POST | /api/debug/query | SQL 调试(仅只读语句) |

表名与列名均经白名单校验并加反引号, 值全部使用参数化查询; 自增主键与 `create_time`/`update_time` 由数据库自动处理

### 本地启动

前置: MySQL 服务运行, `lhlord` 库已按 [database/schema/init.sql](database/schema/init.sql) 建表并导入种子数据

一键启动(Windows): 双击 [start.bat](start.bat), 脚本会自动检查依赖,启动前后端并打开浏览器

```bash
# 1. 后端(端口 7000)
cd server
npm install
copy .env.example .env   # 填入数据库账号密码
npm run dev

# 2. 前端(端口 7777, 开发代理 /api -> 127.0.0.1:7000)
cd frontend
npm install
npm run dev
```

浏览器打开 http://localhost:7777 即可使用管理后台 注意: 该后台直接读写数据库, 仅用于本地开发, `.env` 已加入 `.gitignore` 不会提交

浏览器默认进入炼丹系统, 炼丹系统内提供"进入管理后台"入口, 管理后台顶部提供"返回炼丹系统"入口

## 数据库设计

参见 [database/mysql.md](database/mysql.md), 建表脚本位于 [database/schema/init.sql](database/schema/init.sql), 种子数据位于 [database/seed/init_seed.sql](database/seed/init_seed.sql) 与 [database/seed/item_seed.sql](database/seed/item_seed.sql)
