CREATE DATABASE IF NOT EXISTS `lhlord`
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE `lhlord`;

-- 物品分类 
CREATE TABLE IF NOT EXISTS `item_sort` (
  `item_sort_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '物品分类id',
  `item_sort_code` CHAR(64) DEFAULT NULL COMMENT '物品分类编码',
  `item_sort_name` CHAR(64) DEFAULT NULL COMMENT '物品分类名称',
  `item_sort_description` VARCHAR(255) DEFAULT NULL COMMENT '物品分类描述',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` BIGINT DEFAULT NULL COMMENT '创建人',
  `update_by` BIGINT DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`item_sort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='物品分类表';

-- 物品 
CREATE TABLE IF NOT EXISTS `item` (
  `item_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '物品id',
  `item_code` CHAR(64) DEFAULT NULL COMMENT '物品编码',
  `item_sort_id` CHAR(64) DEFAULT NULL COMMENT '物品分类id',
  `item_name` VARCHAR(255) DEFAULT NULL COMMENT '物品名称',
  `item_description` VARCHAR(255) DEFAULT NULL COMMENT '物品描述',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` BIGINT DEFAULT NULL COMMENT '创建人',
  `update_by` BIGINT DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='物品表';

-- 角色 
CREATE TABLE IF NOT EXISTS `character` (
  `character_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '角色_id',
  `character_name` CHAR(64) DEFAULT NULL COMMENT '角色名称',
  `gender` TINYINT(1) DEFAULT NULL COMMENT '角色性别',
  `age` INT DEFAULT NULL COMMENT '角色年龄',
  `race_id` SMALLINT DEFAULT NULL COMMENT '种族id',
  `race_subsp_id` SMALLINT DEFAULT NULL COMMENT '亚种id',
  `character_description` VARCHAR(255) DEFAULT NULL COMMENT '角色描述',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` BIGINT DEFAULT NULL COMMENT '创建人',
  `update_by` BIGINT DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色';

-- 种族分类 
CREATE TABLE IF NOT EXISTS `race_sort` (
  `race_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '种族id',
  `race_code` CHAR(64) DEFAULT NULL COMMENT '种族编码',
  `race_name` CHAR(64) DEFAULT NULL COMMENT '种族名称',
  `race_description` VARCHAR(255) DEFAULT NULL COMMENT '种族描述',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` BIGINT DEFAULT NULL COMMENT '创建人',
  `update_by` BIGINT DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`race_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='种族分类表';

-- 种族的亚种分类
CREATE TABLE IF NOT EXISTS `race_subspecies` (
  `race_subspecies_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '亚种id',
  `race_subspecies_code` CHAR(64) DEFAULT NULL COMMENT '亚种编码',
  `race_subspecies_name` VARCHAR(255) DEFAULT NULL COMMENT '亚种名称',
  `race_subspecies_description` VARCHAR(255) DEFAULT NULL COMMENT '亚种描述',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` BIGINT DEFAULT NULL COMMENT '创建人',
  `update_by` BIGINT DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`race_subspecies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='亚种分类表';

-- TODO: Excel 工作表 `error` 目前只有表名和注释“错误代码”，尚未提供字段定义。
