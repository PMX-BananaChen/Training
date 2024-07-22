/*
 Navicat Premium Data Transfer

 Source Server         : 123
 Source Server Type    : SQL Server
 Source Server Version : 13004001
 Source Host           : 10.40.1.172:1433
 Source Catalog        : PmxMiddleground
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 13004001
 File Encoding         : 65001

 Date: 20/10/2022 17:21:37
*/


-- ----------------------------
-- Table structure for picking_news
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[picking_news]') AND type IN ('U'))
	DROP TABLE [dbo].[picking_news]
GO

CREATE TABLE [dbo].[picking_news] (
  [news_id] int  IDENTITY(1,1) NOT NULL,
  [layout_no] int  NULL,
  [layout_title] nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [layout_date] int  NULL,
  [author] nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [update_time] datetime  NULL,
  [remark] nvarchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [layout_type] int  NULL,
  [layout_year] int  NULL,
  [content] nvarchar(max) COLLATE Chinese_Taiwan_Stroke_CI_AS DEFAULT NULL NULL,
  [content_date] datetime  NULL,
  [image_name] varchar(1000) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [create_by] nvarchar(64) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [create_time] datetime  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [source_type] varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[picking_news] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'新闻主键ID',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'news_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'版面编号',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'layout_no'
GO

EXEC sp_addextendedproperty
'MS_Description', N'版面标题',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'layout_title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'版面日期',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'layout_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'作者',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'author'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'版面类型(1、资讯；2、文章；3、员工天地；4、缤纷生活；)',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'layout_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'版面年份',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'layout_year'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容时间',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'content_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片名称(多张逗号隔开)',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'image_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建人',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建日期',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改人',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'来源',
'SCHEMA', N'dbo',
'TABLE', N'picking_news',
'COLUMN', N'source_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'东聚采风',
'SCHEMA', N'dbo',
'TABLE', N'picking_news'
GO


-- ----------------------------
-- Auto increment value for picking_news
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[picking_news]', RESEED, 84)
GO


-- ----------------------------
-- Primary Key structure for table picking_news
-- ----------------------------
ALTER TABLE [dbo].[picking_news] ADD CONSTRAINT [PK__Untitled__954EBDD3345A2EC0] PRIMARY KEY CLUSTERED ([news_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO

