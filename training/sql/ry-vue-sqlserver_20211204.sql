USE [training]
GO
/****** Object:  Table [dbo].[gen_table]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gen_table](
	[table_id] [bigint] IDENTITY(1,1) NOT NULL,
	[table_name] [nvarchar](200) NULL,
	[table_comment] [nvarchar](500) NULL,
	[sub_table_name] [nvarchar](64) NULL,
	[sub_table_fk_name] [nvarchar](64) NULL,
	[class_name] [nvarchar](100) NULL,
	[tpl_category] [nvarchar](200) NULL,
	[package_name] [nvarchar](100) NULL,
	[module_name] [nvarchar](30) NULL,
	[business_name] [nvarchar](30) NULL,
	[function_name] [nvarchar](50) NULL,
	[function_author] [nvarchar](50) NULL,
	[gen_type] [nchar](1) NULL,
	[gen_path] [nvarchar](200) NULL,
	[options] [nvarchar](1000) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
	[remark] [nvarchar](500) NULL,
 CONSTRAINT [PK__gen_tabl__B21E8F24FB39D57C] PRIMARY KEY CLUSTERED
(
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gen_table_column]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gen_table_column](
	[column_id] [bigint] IDENTITY(1,1) NOT NULL,
	[table_id] [nvarchar](64) NULL,
	[column_name] [nvarchar](200) NULL,
	[column_comment] [nvarchar](500) NULL,
	[column_type] [nvarchar](100) NULL,
	[java_type] [nvarchar](500) NULL,
	[java_field] [nvarchar](200) NULL,
	[is_pk] [nchar](1) NULL,
	[is_increment] [nchar](1) NULL,
	[is_required] [nchar](1) NULL,
	[is_insert] [nchar](1) NULL,
	[is_edit] [nchar](1) NULL,
	[is_list] [nchar](1) NULL,
	[is_query] [nchar](1) NULL,
	[query_type] [nvarchar](200) NULL,
	[html_type] [nvarchar](200) NULL,
	[dict_type] [nvarchar](200) NULL,
	[sort] [int] NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
 CONSTRAINT [PK__gen_tabl__E301851F923E442B] PRIMARY KEY CLUSTERED
(
	[column_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtz_blob_triggers]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtz_blob_triggers](
	[sched_name] [nvarchar](120) NOT NULL,
	[trigger_name] [nvarchar](200) NOT NULL,
	[trigger_group] [nvarchar](200) NOT NULL,
	[blob_data] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED
(
	[sched_name] ASC,
	[trigger_name] ASC,
	[trigger_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtz_calendars]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtz_calendars](
	[sched_name] [nvarchar](120) NOT NULL,
	[calendar_name] [nvarchar](200) NOT NULL,
	[calendar] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[sched_name] ASC,
	[calendar_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtz_cron_triggers]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtz_cron_triggers](
	[sched_name] [nvarchar](120) NOT NULL,
	[trigger_name] [nvarchar](200) NOT NULL,
	[trigger_group] [nvarchar](200) NOT NULL,
	[cron_expression] [nvarchar](200) NOT NULL,
	[time_zone_id] [nvarchar](80) NULL,
PRIMARY KEY CLUSTERED
(
	[sched_name] ASC,
	[trigger_name] ASC,
	[trigger_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtz_fired_triggers]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtz_fired_triggers](
	[sched_name] [nvarchar](120) NOT NULL,
	[entry_id] [nvarchar](95) NOT NULL,
	[trigger_name] [nvarchar](200) NOT NULL,
	[trigger_group] [nvarchar](200) NOT NULL,
	[instance_name] [nvarchar](200) NOT NULL,
	[fired_time] [bigint] NOT NULL,
	[sched_time] [bigint] NOT NULL,
	[priority] [int] NOT NULL,
	[state] [nvarchar](16) NOT NULL,
	[job_name] [nvarchar](200) NULL,
	[job_group] [nvarchar](200) NULL,
	[is_nonconcurrent] [nvarchar](1) NULL,
	[requests_recovery] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED
(
	[sched_name] ASC,
	[entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtz_job_details]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtz_job_details](
	[sched_name] [nvarchar](120) NOT NULL,
	[job_name] [nvarchar](200) NOT NULL,
	[job_group] [nvarchar](200) NOT NULL,
	[description] [nvarchar](250) NULL,
	[job_class_name] [nvarchar](250) NOT NULL,
	[is_durable] [nvarchar](1) NOT NULL,
	[is_nonconcurrent] [nvarchar](1) NOT NULL,
	[is_update_data] [nvarchar](1) NOT NULL,
	[requests_recovery] [nvarchar](1) NOT NULL,
	[job_data] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED
(
	[sched_name] ASC,
	[job_name] ASC,
	[job_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtz_locks]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtz_locks](
	[sched_name] [nvarchar](120) NOT NULL,
	[lock_name] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[sched_name] ASC,
	[lock_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtz_paused_trigger_grps]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtz_paused_trigger_grps](
	[sched_name] [nvarchar](120) NOT NULL,
	[trigger_group] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[sched_name] ASC,
	[trigger_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtz_scheduler_state]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtz_scheduler_state](
	[sched_name] [nvarchar](120) NOT NULL,
	[instance_name] [nvarchar](200) NOT NULL,
	[last_checkin_time] [bigint] NOT NULL,
	[checkin_interval] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[sched_name] ASC,
	[instance_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtz_simple_triggers]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtz_simple_triggers](
	[sched_name] [nvarchar](120) NOT NULL,
	[trigger_name] [nvarchar](200) NOT NULL,
	[trigger_group] [nvarchar](200) NOT NULL,
	[repeat_count] [bigint] NOT NULL,
	[repeat_interval] [bigint] NOT NULL,
	[times_triggered] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[sched_name] ASC,
	[trigger_name] ASC,
	[trigger_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtz_simprop_triggers]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtz_simprop_triggers](
	[sched_name] [nvarchar](120) NOT NULL,
	[trigger_name] [nvarchar](200) NOT NULL,
	[trigger_group] [nvarchar](200) NOT NULL,
	[str_prop_1] [nvarchar](512) NULL,
	[str_prop_2] [nvarchar](512) NULL,
	[str_prop_3] [nvarchar](512) NULL,
	[int_prop_1] [int] NULL,
	[int_prop_2] [int] NULL,
	[long_prop_1] [bigint] NULL,
	[long_prop_2] [bigint] NULL,
	[dec_prop_1] [decimal](13, 4) NULL,
	[dec_prop_2] [decimal](13, 4) NULL,
	[bool_prop_1] [nvarchar](1) NULL,
	[bool_prop_2] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED
(
	[sched_name] ASC,
	[trigger_name] ASC,
	[trigger_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtz_triggers]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtz_triggers](
	[sched_name] [nvarchar](120) NOT NULL,
	[trigger_name] [nvarchar](200) NOT NULL,
	[trigger_group] [nvarchar](200) NOT NULL,
	[job_name] [nvarchar](200) NOT NULL,
	[job_group] [nvarchar](200) NOT NULL,
	[description] [nvarchar](250) NULL,
	[next_fire_time] [bigint] NULL,
	[prev_fire_time] [bigint] NULL,
	[priority] [int] NULL,
	[trigger_state] [nvarchar](16) NOT NULL,
	[trigger_type] [nvarchar](8) NOT NULL,
	[start_time] [bigint] NOT NULL,
	[end_time] [bigint] NULL,
	[calendar_name] [nvarchar](200) NULL,
	[misfire_instr] [smallint] NULL,
	[job_data] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED
(
	[sched_name] ASC,
	[trigger_name] ASC,
	[trigger_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_config]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_config](
	[config_id] [int] IDENTITY(1,1) NOT NULL,
	[config_name] [nvarchar](100) NULL,
	[config_key] [nvarchar](100) NULL,
	[config_value] [nvarchar](500) NULL,
	[config_type] [nchar](1) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
	[remark] [nvarchar](500) NULL,
 CONSTRAINT [PK__sys_conf__4AD1BFF1728A732A] PRIMARY KEY CLUSTERED
(
	[config_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_dept]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_dept](
	[dept_id] [bigint] IDENTITY(100,1) NOT NULL,
	[parent_id] [bigint] NULL,
	[ancestors] [nvarchar](50) NULL,
	[dept_name] [nvarchar](30) NULL,
	[order_num] [int] NULL,
	[leader] [nvarchar](20) NULL,
	[phone] [nvarchar](11) NULL,
	[email] [nvarchar](50) NULL,
	[status] [nchar](1) NULL,
	[del_flag] [nchar](1) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
 CONSTRAINT [PK__sys_dept__DCA65974EF6572B7] PRIMARY KEY CLUSTERED
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_dict_data]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_dict_data](
	[dict_code] [bigint] IDENTITY(1,1) NOT NULL,
	[dict_sort] [int] NULL,
	[dict_label] [nvarchar](100) NULL,
	[dict_value] [nvarchar](100) NULL,
	[dict_type] [nvarchar](100) NULL,
	[css_class] [nvarchar](100) NULL,
	[list_class] [nvarchar](100) NULL,
	[is_default] [nchar](1) NULL,
	[status] [nchar](1) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
	[remark] [nvarchar](500) NULL,
 CONSTRAINT [PK__sys_dict__19CBC34BD00E62D2] PRIMARY KEY CLUSTERED
(
	[dict_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_dict_type]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_dict_type](
	[dict_id] [bigint] IDENTITY(1,1) NOT NULL,
	[dict_name] [nvarchar](100) NULL,
	[dict_type] [nvarchar](100) NULL,
	[status] [nchar](1) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
	[remark] [nvarchar](500) NULL,
 CONSTRAINT [PK__sys_dict__3BD4186C4343A29C] PRIMARY KEY CLUSTERED
(
	[dict_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_job]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_job](
	[job_id] [bigint] IDENTITY(1,1) NOT NULL,
	[job_name] [nvarchar](64) NOT NULL,
	[job_group] [nvarchar](64) NOT NULL,
	[invoke_target] [nvarchar](500) NOT NULL,
	[cron_expression] [nvarchar](255) NULL,
	[misfire_policy] [nvarchar](20) NULL,
	[concurrent] [nchar](1) NULL,
	[status] [nchar](1) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
	[remark] [nvarchar](500) NULL,
 CONSTRAINT [PK__sys_job__2E0E56DCE32A3DF1] PRIMARY KEY CLUSTERED
(
	[job_id] ASC,
	[job_name] ASC,
	[job_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_job_log]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_job_log](
	[job_log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[job_name] [nvarchar](64) NOT NULL,
	[job_group] [nvarchar](64) NOT NULL,
	[invoke_target] [nvarchar](500) NOT NULL,
	[job_message] [nvarchar](500) NULL,
	[status] [nchar](1) NULL,
	[exception_info] [nvarchar](2000) NULL,
	[create_time] [datetime2](0) NULL,
 CONSTRAINT [PK__sys_job___0CA0EBC98DC75E3C] PRIMARY KEY CLUSTERED
(
	[job_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_logininfor]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_logininfor](
	[info_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[ipaddr] [nvarchar](128) NULL,
	[login_location] [nvarchar](255) NULL,
	[browser] [nvarchar](50) NULL,
	[os] [nvarchar](50) NULL,
	[status] [nchar](1) NULL,
	[msg] [nvarchar](255) NULL,
	[login_time] [datetime2](0) NULL,
 CONSTRAINT [PK__sys_logi__3D8A9C1ABC0896EC] PRIMARY KEY CLUSTERED
(
	[info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_menu]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_menu](
	[menu_id] [bigint] IDENTITY(1,1) NOT NULL,
	[menu_name] [nvarchar](50) NOT NULL,
	[parent_id] [bigint] NULL,
	[order_num] [int] NULL,
	[path] [nvarchar](200) NULL,
	[component] [nvarchar](255) NULL,
	[query] [nvarchar](255) NULL,
	[is_frame] [int] NULL,
	[is_cache] [int] NULL,
	[menu_type] [nchar](1) NULL,
	[visible] [nchar](1) NULL,
	[status] [nchar](1) NULL,
	[perms] [nvarchar](100) NULL,
	[icon] [nvarchar](100) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
	[remark] [nvarchar](500) NULL,
 CONSTRAINT [PK__sys_menu__4CA0FADC0DA7F5A2] PRIMARY KEY CLUSTERED
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_notice]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_notice](
	[notice_id] [int] IDENTITY(1,1) NOT NULL,
	[notice_title] [nvarchar](50) NOT NULL,
	[notice_type] [nchar](1) NOT NULL,
	[notice_content] [nvarchar](max) NULL,
	[status] [nchar](1) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
	[remark] [nvarchar](255) NULL,
 CONSTRAINT [PK__sys_noti__3E82A5DB633D44A9] PRIMARY KEY CLUSTERED
(
	[notice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_oper_log]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_oper_log](
	[oper_id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[business_type] [int] NULL,
	[method] [nvarchar](100) NULL,
	[request_method] [nvarchar](10) NULL,
	[operator_type] [int] NULL,
	[oper_name] [nvarchar](50) NULL,
	[dept_name] [nvarchar](50) NULL,
	[oper_url] [nvarchar](255) NULL,
	[oper_ip] [nvarchar](128) NULL,
	[oper_location] [nvarchar](255) NULL,
	[oper_param] [nvarchar](2000) NULL,
	[json_result] [nvarchar](2000) NULL,
	[status] [int] NULL,
	[error_msg] [nvarchar](2000) NULL,
	[oper_time] [datetime2](0) NULL,
 CONSTRAINT [PK__sys_oper__34723BF99AD6B16E] PRIMARY KEY CLUSTERED
(
	[oper_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_post]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_post](
	[post_id] [bigint] IDENTITY(1,1) NOT NULL,
	[post_code] [nvarchar](64) NOT NULL,
	[post_name] [nvarchar](50) NOT NULL,
	[post_sort] [int] NOT NULL,
	[status] [nchar](1) NOT NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
	[remark] [nvarchar](500) NULL,
 CONSTRAINT [PK__sys_post__3ED787662432D3E0] PRIMARY KEY CLUSTERED
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_role]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role](
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](30) NOT NULL,
	[role_key] [nvarchar](100) NOT NULL,
	[role_sort] [int] NOT NULL,
	[data_scope] [nchar](1) NULL,
	[menu_check_strictly] [tinyint] NULL,
	[dept_check_strictly] [tinyint] NULL,
	[status] [nchar](1) NOT NULL,
	[del_flag] [nchar](1) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
	[remark] [nvarchar](500) NULL,
 CONSTRAINT [PK__sys_role__760965CCC3D91A0A] PRIMARY KEY CLUSTERED
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_role_dept]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role_dept](
	[role_id] [bigint] NOT NULL,
	[dept_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[role_id] ASC,
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_role_menu]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role_menu](
	[role_id] [bigint] NOT NULL,
	[menu_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[role_id] ASC,
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_user]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_user](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[dept_id] [bigint] NULL,
	[user_name] [nvarchar](30) NOT NULL,
	[nick_name] [nvarchar](30) NOT NULL,
	[user_type] [nvarchar](2) NULL,
	[email] [nvarchar](50) NULL,
	[phonenumber] [nvarchar](11) NULL,
	[sex] [nchar](1) NULL,
	[avatar] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[status] [nchar](1) NULL,
	[del_flag] [nchar](1) NULL,
	[login_ip] [nvarchar](128) NULL,
	[login_date] [datetime2](0) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_time] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_time] [datetime2](0) NULL,
	[remark] [nvarchar](500) NULL,
 CONSTRAINT [PK__sys_user__B9BE370F675B0A0E] PRIMARY KEY CLUSTERED
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_user_post]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_user_post](
	[user_id] [bigint] NOT NULL,
	[post_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[user_id] ASC,
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_user_role]    Script Date: 2021/12/14 21:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_user_role](
	[user_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[qrtz_cron_triggers] ([sched_name], [trigger_name], [trigger_group], [cron_expression], [time_zone_id]) VALUES (N'RuoyiScheduler', N'TASK_CLASS_NAME1', N'DEFAULT', N'0/10 * * * * ?', N'Asia/Shanghai')
GO
INSERT [dbo].[qrtz_cron_triggers] ([sched_name], [trigger_name], [trigger_group], [cron_expression], [time_zone_id]) VALUES (N'RuoyiScheduler', N'TASK_CLASS_NAME2', N'DEFAULT', N'0/15 * * * * ?', N'Asia/Shanghai')
GO
INSERT [dbo].[qrtz_cron_triggers] ([sched_name], [trigger_name], [trigger_group], [cron_expression], [time_zone_id]) VALUES (N'RuoyiScheduler', N'TASK_CLASS_NAME3', N'DEFAULT', N'0/20 * * * * ?', N'Asia/Shanghai')
GO
INSERT [dbo].[qrtz_job_details] ([sched_name], [job_name], [job_group], [description], [job_class_name], [is_durable], [is_nonconcurrent], [is_update_data], [requests_recovery], [job_data]) VALUES (N'RuoyiScheduler', N'TASK_CLASS_NAME1', N'DEFAULT', NULL, N'com.foreman.quartz.util.QuartzDisallowConcurrentExecution', N'0', N'1', N'0', N'0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D80ACCCA078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800)
GO
INSERT [dbo].[qrtz_job_details] ([sched_name], [job_name], [job_group], [description], [job_class_name], [is_durable], [is_nonconcurrent], [is_update_data], [requests_recovery], [job_data]) VALUES (N'RuoyiScheduler', N'TASK_CLASS_NAME2', N'DEFAULT', NULL, N'com.foreman.quartz.util.QuartzDisallowConcurrentExecution', N'0', N'1', N'0', N'0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D80ACCCA078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800)
GO
INSERT [dbo].[qrtz_job_details] ([sched_name], [job_name], [job_group], [description], [job_class_name], [is_durable], [is_nonconcurrent], [is_update_data], [requests_recovery], [job_data]) VALUES (N'RuoyiScheduler', N'TASK_CLASS_NAME3', N'DEFAULT', NULL, N'com.foreman.quartz.util.QuartzDisallowConcurrentExecution', N'0', N'1', N'0', N'0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D80ACCCA078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800)
GO
INSERT [dbo].[qrtz_locks] ([sched_name], [lock_name]) VALUES (N'RuoyiScheduler', N'STATE_ACCESS')
GO
INSERT [dbo].[qrtz_locks] ([sched_name], [lock_name]) VALUES (N'RuoyiScheduler', N'TRIGGER_ACCESS')
GO
INSERT [dbo].[qrtz_scheduler_state] ([sched_name], [instance_name], [last_checkin_time], [checkin_interval]) VALUES (N'RuoyiScheduler', N'G08CNXNBFS068501639488009914', 1639490010951, 15000)
GO
INSERT [dbo].[qrtz_triggers] ([sched_name], [trigger_name], [trigger_group], [job_name], [job_group], [description], [next_fire_time], [prev_fire_time], [priority], [trigger_state], [trigger_type], [start_time], [end_time], [calendar_name], [misfire_instr], [job_data]) VALUES (N'RuoyiScheduler', N'TASK_CLASS_NAME1', N'DEFAULT', N'TASK_CLASS_NAME1', N'DEFAULT', NULL, 1639488010000, -1, 5, N'PAUSED', N'CRON', 1639488010000, 0, NULL, 2, 0x)
GO
INSERT [dbo].[qrtz_triggers] ([sched_name], [trigger_name], [trigger_group], [job_name], [job_group], [description], [next_fire_time], [prev_fire_time], [priority], [trigger_state], [trigger_type], [start_time], [end_time], [calendar_name], [misfire_instr], [job_data]) VALUES (N'RuoyiScheduler', N'TASK_CLASS_NAME2', N'DEFAULT', N'TASK_CLASS_NAME2', N'DEFAULT', NULL, 1639488015000, -1, 5, N'PAUSED', N'CRON', 1639488010000, 0, NULL, 2, 0x)
GO
INSERT [dbo].[qrtz_triggers] ([sched_name], [trigger_name], [trigger_group], [job_name], [job_group], [description], [next_fire_time], [prev_fire_time], [priority], [trigger_state], [trigger_type], [start_time], [end_time], [calendar_name], [misfire_instr], [job_data]) VALUES (N'RuoyiScheduler', N'TASK_CLASS_NAME3', N'DEFAULT', N'TASK_CLASS_NAME3', N'DEFAULT', NULL, 1639488020000, -1, 5, N'PAUSED', N'CRON', 1639488010000, 0, NULL, 2, 0x)
GO
SET IDENTITY_INSERT [dbo].[sys_config] ON
GO
INSERT [dbo].[sys_config] ([config_id], [config_name], [config_key], [config_value], [config_type], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1, N'主框架页-默认皮肤样式名称', N'sys.index.skinName', N'skin-blue', N'Y', N'admin', CAST(N'2021-12-03T22:22:26.0000000' AS DateTime2), N'', NULL, N'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow')
GO
INSERT [dbo].[sys_config] ([config_id], [config_name], [config_key], [config_value], [config_type], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (2, N'用户管理-账号初始密码', N'sys.user.initPassword', N'123456', N'Y', N'admin', CAST(N'2021-12-03T22:22:26.0000000' AS DateTime2), N'', NULL, N'初始化密码 123456')
GO
INSERT [dbo].[sys_config] ([config_id], [config_name], [config_key], [config_value], [config_type], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (3, N'主框架页-侧边栏主题', N'sys.index.sideTheme', N'theme-dark', N'Y', N'admin', CAST(N'2021-12-03T22:22:26.0000000' AS DateTime2), N'', NULL, N'深色主题theme-dark，浅色主题theme-light')
GO
INSERT [dbo].[sys_config] ([config_id], [config_name], [config_key], [config_value], [config_type], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (4, N'账号自助-验证码开关', N'sys.account.captchaOnOff', N'true', N'Y', N'admin', CAST(N'2021-12-03T22:22:26.0000000' AS DateTime2), N'', NULL, N'是否开启验证码功能（true开启，false关闭）')
GO
INSERT [dbo].[sys_config] ([config_id], [config_name], [config_key], [config_value], [config_type], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (5, N'账号自助-是否开启用户注册功能', N'sys.account.registerUser', N'false', N'Y', N'admin', CAST(N'2021-12-03T22:22:27.0000000' AS DateTime2), N'', NULL, N'是否开启注册用户功能（true开启，false关闭）')
GO
SET IDENTITY_INSERT [dbo].[sys_config] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_dept] ON
GO
INSERT [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (100, 0, N'0', N'若依科技', 0, N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'', NULL)
GO
INSERT [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (101, 100, N'0,100', N'深圳总公司', 1, N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'', NULL)
GO
INSERT [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (102, 100, N'0,100', N'长沙分公司', 2, N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'', NULL)
GO
INSERT [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (103, 101, N'0,100,101', N'研发部门', 1, N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'', NULL)
GO
INSERT [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (104, 101, N'0,100,101', N'市场部门', 2, N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'', NULL)
GO
INSERT [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (105, 101, N'0,100,101', N'测试部门', 3, N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'', NULL)
GO
INSERT [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (106, 101, N'0,100,101', N'财务部门', 4, N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'', NULL)
GO
INSERT [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (107, 101, N'0,100,101', N'运维部门', 5, N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'', NULL)
GO
INSERT [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (108, 102, N'0,100,102', N'市场部门', 1, N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'', NULL)
GO
INSERT [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (109, 102, N'0,100,102', N'财务部门', 2, N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'', NULL)
GO
SET IDENTITY_INSERT [dbo].[sys_dept] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_dict_data] ON
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1, 1, N'男', N'0', N'sys_user_sex', N'', N'', N'Y', N'0', N'admin', CAST(N'2021-12-03T22:22:24.0000000' AS DateTime2), N'', NULL, N'性别男')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (2, 2, N'女', N'1', N'sys_user_sex', N'', N'', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:24.0000000' AS DateTime2), N'', NULL, N'性别女')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (3, 3, N'未知', N'2', N'sys_user_sex', N'', N'', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:24.0000000' AS DateTime2), N'', NULL, N'性别未知')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (4, 1, N'显示', N'0', N'sys_show_hide', N'', N'primary', N'Y', N'0', N'admin', CAST(N'2021-12-03T22:22:24.0000000' AS DateTime2), N'', NULL, N'显示菜单')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (5, 2, N'隐藏', N'1', N'sys_show_hide', N'', N'danger', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:24.0000000' AS DateTime2), N'', NULL, N'隐藏菜单')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (6, 1, N'正常', N'0', N'sys_normal_disable', N'', N'primary', N'Y', N'0', N'admin', CAST(N'2021-12-03T22:22:24.0000000' AS DateTime2), N'', NULL, N'正常状态')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (7, 2, N'停用', N'1', N'sys_normal_disable', N'', N'danger', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:24.0000000' AS DateTime2), N'', NULL, N'停用状态')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (8, 1, N'正常', N'0', N'sys_job_status', N'', N'primary', N'Y', N'0', N'admin', CAST(N'2021-12-03T22:22:24.0000000' AS DateTime2), N'', NULL, N'正常状态')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (9, 2, N'暂停', N'1', N'sys_job_status', N'', N'danger', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'停用状态')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (10, 1, N'默认', N'DEFAULT', N'sys_job_group', N'', N'', N'Y', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'默认分组')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (11, 2, N'系统', N'SYSTEM', N'sys_job_group', N'', N'', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'系统分组')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (12, 1, N'是', N'Y', N'sys_yes_no', N'', N'primary', N'Y', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'系统默认是')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (13, 2, N'否', N'N', N'sys_yes_no', N'', N'danger', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'系统默认否')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (14, 1, N'通知', N'1', N'sys_notice_type', N'', N'warning', N'Y', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'通知')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (15, 2, N'公告', N'2', N'sys_notice_type', N'', N'success', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'公告')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (16, 1, N'正常', N'0', N'sys_notice_status', N'', N'primary', N'Y', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'正常状态')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (17, 2, N'关闭', N'1', N'sys_notice_status', N'', N'danger', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'关闭状态')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (18, 1, N'新增', N'1', N'sys_oper_type', N'', N'info', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'新增操作')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (19, 2, N'修改', N'2', N'sys_oper_type', N'', N'info', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'修改操作')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (20, 3, N'删除', N'3', N'sys_oper_type', N'', N'danger', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'删除操作')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (21, 4, N'授权', N'4', N'sys_oper_type', N'', N'primary', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'授权操作')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (22, 5, N'导出', N'5', N'sys_oper_type', N'', N'warning', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'导出操作')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (23, 6, N'导入', N'6', N'sys_oper_type', N'', N'warning', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'导入操作')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (24, 7, N'强退', N'7', N'sys_oper_type', N'', N'danger', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'强退操作')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (25, 8, N'生成代码', N'8', N'sys_oper_type', N'', N'warning', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:25.0000000' AS DateTime2), N'', NULL, N'生成操作')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (26, 9, N'清空数据', N'9', N'sys_oper_type', N'', N'danger', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:26.0000000' AS DateTime2), N'', NULL, N'清空操作')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (27, 1, N'成功', N'0', N'sys_common_status', N'', N'primary', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:26.0000000' AS DateTime2), N'', NULL, N'正常状态')
GO
INSERT [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (28, 2, N'失败', N'1', N'sys_common_status', N'', N'danger', N'N', N'0', N'admin', CAST(N'2021-12-03T22:22:26.0000000' AS DateTime2), N'', NULL, N'停用状态')
GO
SET IDENTITY_INSERT [dbo].[sys_dict_data] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_dict_type] ON
GO
INSERT [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1, N'用户性别', N'sys_user_sex', N'0', N'admin', CAST(N'2021-12-03T22:22:23.0000000' AS DateTime2), N'', NULL, N'用户性别列表')
GO
INSERT [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (2, N'菜单状态', N'sys_show_hide', N'0', N'admin', CAST(N'2021-12-03T22:22:23.0000000' AS DateTime2), N'', NULL, N'菜单状态列表')
GO
INSERT [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (3, N'系统开关', N'sys_normal_disable', N'0', N'admin', CAST(N'2021-12-03T22:22:23.0000000' AS DateTime2), N'', NULL, N'系统开关列表')
GO
INSERT [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (4, N'任务状态', N'sys_job_status', N'0', N'admin', CAST(N'2021-12-03T22:22:23.0000000' AS DateTime2), N'', NULL, N'任务状态列表')
GO
INSERT [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (5, N'任务分组', N'sys_job_group', N'0', N'admin', CAST(N'2021-12-03T22:22:23.0000000' AS DateTime2), N'', NULL, N'任务分组列表')
GO
INSERT [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (6, N'系统是否', N'sys_yes_no', N'0', N'admin', CAST(N'2021-12-03T22:22:23.0000000' AS DateTime2), N'', NULL, N'系统是否列表')
GO
INSERT [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (7, N'通知类型', N'sys_notice_type', N'0', N'admin', CAST(N'2021-12-03T22:22:23.0000000' AS DateTime2), N'', NULL, N'通知类型列表')
GO
INSERT [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (8, N'通知状态', N'sys_notice_status', N'0', N'admin', CAST(N'2021-12-03T22:22:23.0000000' AS DateTime2), N'', NULL, N'通知状态列表')
GO
INSERT [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (9, N'操作类型', N'sys_oper_type', N'0', N'admin', CAST(N'2021-12-03T22:22:23.0000000' AS DateTime2), N'', NULL, N'操作类型列表')
GO
INSERT [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (10, N'系统状态', N'sys_common_status', N'0', N'admin', CAST(N'2021-12-03T22:22:23.0000000' AS DateTime2), N'', NULL, N'登录状态列表')
GO
SET IDENTITY_INSERT [dbo].[sys_dict_type] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_job] ON
GO
INSERT [dbo].[sys_job] ([job_id], [job_name], [job_group], [invoke_target], [cron_expression], [misfire_policy], [concurrent], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1, N'系统默认（无参）', N'DEFAULT', N'ryTask.ryNoParams', N'0/10 * * * * ?', N'3', N'1', N'1', N'admin', CAST(N'2021-12-03T22:22:28.0000000' AS DateTime2), N'admin', CAST(N'2021-12-04T13:16:24.0000000' AS DateTime2), N'')
GO
INSERT [dbo].[sys_job] ([job_id], [job_name], [job_group], [invoke_target], [cron_expression], [misfire_policy], [concurrent], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (2, N'系统默认（有参）', N'DEFAULT', N'ryTask.ryParams(''ry'')', N'0/15 * * * * ?', N'3', N'1', N'1', N'admin', CAST(N'2021-12-03T22:22:28.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_job] ([job_id], [job_name], [job_group], [invoke_target], [cron_expression], [misfire_policy], [concurrent], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (3, N'系统默认（多参）', N'DEFAULT', N'ryTask.ryMultipleParams(''ry'', true, 2000L, 316.50D, 100)', N'0/20 * * * * ?', N'3', N'1', N'1', N'admin', CAST(N'2021-12-03T22:22:28.0000000' AS DateTime2), N'', NULL, N'')
GO
SET IDENTITY_INSERT [dbo].[sys_job] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_job_log] ON
GO
INSERT [dbo].[sys_job_log] ([job_log_id], [job_name], [job_group], [invoke_target], [job_message], [status], [exception_info], [create_time]) VALUES (1, N'系统默认（无参）', N'DEFAULT', N'ryTask.ryNoParams', N'系统默认（无参） 总共耗时：3毫秒', N'0', NULL, CAST(N'2021-12-04T13:16:20.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[sys_job_log] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_logininfor] ON
GO
INSERT [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (1, N'admin', N'127.0.0.1', N'内网IP', N'Chrome 9', N'Windows 10', N'0', N'退出成功', CAST(N'2021-12-04T13:03:28.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (2, N'admin', N'127.0.0.1', N'内网IP', N'Chrome 9', N'Windows 10', N'0', N'登录成功', CAST(N'2021-12-04T13:03:35.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (3, N'admin', N'127.0.0.1', N'内网IP', N'Chrome 9', N'Windows 10', N'0', N'登录成功', CAST(N'2021-12-04T14:56:12.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[sys_logininfor] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_menu] ON
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1, N'系统管理', 0, 1, N'system', NULL, N'', 1, 0, N'M', N'0', N'0', N'', N'system', N'admin', CAST(N'2021-12-03T22:22:13.0000000' AS DateTime2), N'', NULL, N'系统管理目录')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (2, N'系统监控', 0, 2, N'monitor', NULL, N'', 1, 0, N'M', N'0', N'0', N'', N'monitor', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'系统监控目录')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (3, N'系统工具', 0, 3, N'tool', NULL, N'', 1, 0, N'M', N'0', N'0', N'', N'tool', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'系统工具目录')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (100, N'用户管理', 1, 1, N'user', N'system/user/index', N'', 1, 0, N'C', N'0', N'0', N'system:user:list', N'user', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'用户管理菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (101, N'角色管理', 1, 2, N'role', N'system/role/index', N'', 1, 0, N'C', N'0', N'0', N'system:role:list', N'peoples', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'角色管理菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (102, N'菜单管理', 1, 3, N'menu', N'system/menu/index', N'', 1, 0, N'C', N'0', N'0', N'system:menu:list', N'tree-table', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'菜单管理菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (103, N'部门管理', 1, 4, N'dept', N'system/dept/index', N'', 1, 0, N'C', N'0', N'0', N'system:dept:list', N'tree', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'部门管理菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (104, N'岗位管理', 1, 5, N'post', N'system/post/index', N'', 1, 0, N'C', N'0', N'0', N'system:post:list', N'post', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'岗位管理菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (105, N'字典管理', 1, 6, N'dict', N'system/dict/index', N'', 1, 0, N'C', N'0', N'0', N'system:dict:list', N'dict', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'字典管理菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (106, N'参数设置', 1, 7, N'config', N'system/config/index', N'', 1, 0, N'C', N'0', N'0', N'system:config:list', N'edit', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'参数设置菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (107, N'通知公告', 1, 8, N'notice', N'system/notice/index', N'', 1, 0, N'C', N'0', N'0', N'system:notice:list', N'message', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'通知公告菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (108, N'日志管理', 1, 9, N'log', N'', N'', 1, 0, N'M', N'0', N'0', N'', N'log', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'日志管理菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (109, N'在线用户', 2, 1, N'online', N'monitor/online/index', N'', 1, 0, N'C', N'0', N'0', N'monitor:online:list', N'online', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'在线用户菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (110, N'定时任务', 2, 2, N'job', N'monitor/job/index', N'', 1, 0, N'C', N'0', N'0', N'monitor:job:list', N'job', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'定时任务菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (111, N'数据监控', 2, 3, N'druid', N'monitor/druid/index', N'', 1, 0, N'C', N'0', N'0', N'monitor:druid:list', N'druid', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'数据监控菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (112, N'服务监控', 2, 4, N'server', N'monitor/server/index', N'', 1, 0, N'C', N'0', N'0', N'monitor:server:list', N'server', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'服务监控菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (113, N'缓存监控', 2, 5, N'cache', N'monitor/cache/index', N'', 1, 0, N'C', N'0', N'0', N'monitor:cache:list', N'redis', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'缓存监控菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (114, N'表单构建', 3, 1, N'build', N'tool/build/index', N'', 1, 0, N'C', N'0', N'0', N'tool:build:list', N'build', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'表单构建菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (115, N'代码生成', 3, 2, N'gen', N'tool/gen/index', N'', 1, 0, N'C', N'0', N'0', N'tool:gen:list', N'code', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'代码生成菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (116, N'系统接口', 3, 3, N'swagger', N'tool/swagger/index', N'', 1, 0, N'C', N'0', N'0', N'tool:swagger:list', N'swagger', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'系统接口菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (500, N'操作日志', 108, 1, N'operlog', N'monitor/operlog/index', N'', 1, 0, N'C', N'0', N'0', N'monitor:operlog:list', N'form', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'操作日志菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (501, N'登录日志', 108, 2, N'logininfor', N'monitor/logininfor/index', N'', 1, 0, N'C', N'0', N'0', N'monitor:logininfor:list', N'logininfor', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'登录日志菜单')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1001, N'用户查询', 100, 1, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:user:query', N'#', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1002, N'用户新增', 100, 2, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:user:add', N'#', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1003, N'用户修改', 100, 3, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:user:edit', N'#', N'admin', CAST(N'2021-12-03T22:22:14.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1004, N'用户删除', 100, 4, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:user:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1005, N'用户导出', 100, 5, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:user:export', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1006, N'用户导入', 100, 6, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:user:import', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1007, N'重置密码', 100, 7, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:user:resetPwd', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1008, N'角色查询', 101, 1, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:role:query', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1009, N'角色新增', 101, 2, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:role:add', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1010, N'角色修改', 101, 3, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:role:edit', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1011, N'角色删除', 101, 4, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:role:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1012, N'角色导出', 101, 5, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:role:export', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1013, N'菜单查询', 102, 1, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:menu:query', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1014, N'菜单新增', 102, 2, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:menu:add', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1015, N'菜单修改', 102, 3, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:menu:edit', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1016, N'菜单删除', 102, 4, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:menu:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1017, N'部门查询', 103, 1, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:dept:query', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1018, N'部门新增', 103, 2, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:dept:add', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1019, N'部门修改', 103, 3, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:dept:edit', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1020, N'部门删除', 103, 4, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:dept:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1021, N'岗位查询', 104, 1, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:post:query', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1022, N'岗位新增', 104, 2, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:post:add', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1023, N'岗位修改', 104, 3, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:post:edit', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1024, N'岗位删除', 104, 4, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:post:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1025, N'岗位导出', 104, 5, N'', N'', N'', 1, 0, N'F', N'0', N'0', N'system:post:export', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1026, N'字典查询', 105, 1, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:dict:query', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1027, N'字典新增', 105, 2, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:dict:add', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1028, N'字典修改', 105, 3, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:dict:edit', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1029, N'字典删除', 105, 4, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:dict:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1030, N'字典导出', 105, 5, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:dict:export', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1031, N'参数查询', 106, 1, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:config:query', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1032, N'参数新增', 106, 2, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:config:add', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1033, N'参数修改', 106, 3, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:config:edit', N'#', N'admin', CAST(N'2021-12-03T22:22:15.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1034, N'参数删除', 106, 4, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:config:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1035, N'参数导出', 106, 5, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:config:export', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1036, N'公告查询', 107, 1, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:notice:query', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1037, N'公告新增', 107, 2, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:notice:add', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1038, N'公告修改', 107, 3, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:notice:edit', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1039, N'公告删除', 107, 4, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'system:notice:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1040, N'操作查询', 500, 1, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:operlog:query', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1041, N'操作删除', 500, 2, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:operlog:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1042, N'日志导出', 500, 4, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:operlog:export', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1043, N'登录查询', 501, 1, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:logininfor:query', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1044, N'登录删除', 501, 2, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:logininfor:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1045, N'日志导出', 501, 3, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:logininfor:export', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1046, N'在线查询', 109, 1, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:online:query', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1047, N'批量强退', 109, 2, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:online:batchLogout', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1048, N'单条强退', 109, 3, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:online:forceLogout', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1049, N'任务查询', 110, 1, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:job:query', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1050, N'任务新增', 110, 2, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:job:add', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1051, N'任务修改', 110, 3, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:job:edit', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1052, N'任务删除', 110, 4, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:job:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1053, N'状态修改', 110, 5, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:job:changeStatus', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1054, N'任务导出', 110, 7, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'monitor:job:export', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1055, N'生成查询', 115, 1, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'tool:gen:query', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1056, N'生成修改', 115, 2, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'tool:gen:edit', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1057, N'生成删除', 115, 3, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'tool:gen:remove', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1058, N'导入代码', 115, 2, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'tool:gen:import', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1059, N'预览代码', 115, 4, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'tool:gen:preview', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1060, N'生成代码', 115, 5, N'#', N'', N'', 1, 0, N'F', N'0', N'0', N'tool:gen:code', N'#', N'admin', CAST(N'2021-12-03T22:22:16.0000000' AS DateTime2), N'', NULL, N'')
GO
SET IDENTITY_INSERT [dbo].[sys_menu] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_notice] ON
GO
INSERT [dbo].[sys_notice] ([notice_id], [notice_title], [notice_type], [notice_content], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1, N'温馨提醒：2018-07-01 若依新版本发布啦', N'2', N'<p>1111111111</p>', N'0', N'admin', CAST(N'2021-12-03T22:22:29.0000000' AS DateTime2), N'admin', CAST(N'2021-12-04T15:19:59.0000000' AS DateTime2), N'管理员')
GO
INSERT [dbo].[sys_notice] ([notice_id], [notice_title], [notice_type], [notice_content], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (2, N'维护通知：2018-07-01 若依系统凌晨维护', N'1', N'<p><img src="/dev-api/profile/upload/2021/12/04/f1e00aba-0182-46b0-9c65-7804dfd0ea4e.png"></p>', N'0', N'admin', CAST(N'2021-12-03T22:22:29.0000000' AS DateTime2), N'admin', CAST(N'2021-12-04T15:21:12.0000000' AS DateTime2), N'管理员')
GO
SET IDENTITY_INSERT [dbo].[sys_notice] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_oper_log] ON
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (1, N'定时任务', 2, N'com.foreman.quartz.controller.SysJobController.edit()', N'PUT', 1, N'admin', NULL, N'/monitor/job', N'127.0.0.1', N'内网IP', N'{"jobName":"系统默认（无参）","concurrent":"1","remark":"","jobGroup":"DEFAULT","params":{},"cronExpression":"0/10 * * * * ?","jobId":1,"createBy":"admin","nextValidTime":1638594990000,"createTime":1638541348000,"updateBy":"admin","invokeTarget":"ryTask.ryNoParams","misfirePolicy":"3","status":"0"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T13:16:20.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (2, N'定时任务', 2, N'com.foreman.quartz.controller.SysJobController.changeStatus()', N'PUT', 1, N'admin', NULL, N'/monitor/job/changeStatus', N'127.0.0.1', N'内网IP', N'{"params":{},"jobId":1,"misfirePolicy":"0","status":"1"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T13:16:24.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (3, N'代码生成', 6, N'com.foreman.generator.controller.GenController.importTableSave()', N'POST', 1, N'admin', NULL, N'/tool/gen/importTable', N'127.0.0.1', N'内网IP', N'sys_dept', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T14:56:33.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (4, N'代码生成', 2, N'com.foreman.generator.controller.GenController.editSave()', N'PUT', 1, N'admin', NULL, N'/tool/gen', N'127.0.0.1', N'内网IP', N'{"sub":false,"subTableName":"","functionAuthor":"foreman","columns":[{"capJavaField":"DeptId","usableColumn":false,"columnId":1,"increment":false,"insert":true,"required":false,"superColumn":false,"isInsert":"1","javaField":"deptId","htmlType":"input","edit":false,"query":false,"columnComment":"部门id","sort":1,"list":false,"params":{},"javaType":"Long","columnType":"bigint","createBy":"admin","isPk":"1","createTime":1638600993000,"tableId":1,"pk":true,"columnName":"dept_id"},{"capJavaField":"ParentId","usableColumn":true,"columnId":2,"increment":false,"insert":true,"isList":"1","required":false,"superColumn":true,"isInsert":"1","javaField":"parentId","htmlType":"input","edit":true,"query":true,"columnComment":"父部门id","isQuery":"1","sort":2,"list":true,"params":{},"javaType":"Long","columnType":"bigint","createBy":"admin","createTime":1638600993000,"isEdit":"1","tableId":1,"pk":false,"columnName":"parent_id"},{"capJavaField":"Ancestors","usableColumn":false,"columnId":3,"increment":false,"insert":true,"isList":"1","required":false,"superColumn":true,"isInsert":"1","javaField":"ancestors","htmlType":"input","edit":true,"query":true,"columnComment":"祖级列表","isQuery":"1","sort":3,"list":true,"params":{},"javaType":"String","columnType":"nvarchar","createBy":"admin","createTime":1638600993000,"isEdit":"1","tableId":1,"pk":false,"columnName":"ancestors"},{"capJavaField":"DeptName","usableColumn":false,"columnId":4,"increment":false,"insert":true,"isList":"1","required":false,"superColumn":false,"isInsert":"1","javaField":"deptName","htmlType":"input","edit":true,"query":true,"columnComment":"部门名称","isQuery":"1","sort":4,"list":true,"params":{},"javaType":"String","queryType":"LIKE","columnType":"nvarchar","createBy":"admin","createTime":1638600993000,"isEdit":"1","tableId":1,"pk":false,"columnName":"dept_name"},{"capJavaField":"OrderNum","usableColumn":true,"columnId":5,"increment":false,"insert":true,"isList":"1","required":false,"superColumn":true,"isInsert":"1","javaField"', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T14:57:19.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (5, N'代码生成', 8, N'com.foreman.generator.controller.GenController.batchGenCode()', N'GET', 1, N'admin', NULL, N'/tool/gen/batchGenCode', N'127.0.0.1', N'内网IP', N'{}', NULL, 0, NULL, CAST(N'2021-12-04T14:57:26.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (6, N'代码生成', 3, N'com.foreman.generator.controller.GenController.remove()', N'DELETE', 1, N'admin', NULL, N'/tool/gen/1', N'127.0.0.1', N'内网IP', N'{tableIds=1}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T14:57:42.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (7, N'通知公告', 2, N'com.foreman.web.controller.system.SysNoticeController.edit()', N'PUT', 1, N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"noticeContent":"<p>乱码？           </p>","createBy":"admin","createTime":1638541349000,"updateBy":"admin","noticeType":"1","remark":"管理员","params":{},"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","status":"0"}', NULL, 1, N'
### Error updating database.  Cause: com.microsoft.sqlserver.jdbc.SQLServerException: 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。
### The error may exist in file [F:\JAVA\RuoYi\RuoYi-Vue\foreman-system\target\classes\mapper\system\SysNoticeMapper.xml]
### The error may involve com.foreman.system.mapper.SysNoticeMapper.updateNotice-Inline
### The error occurred while setting parameters
### SQL: update sys_notice          SET notice_title = ?,              notice_type = ?,              notice_content = ?,              status = ?,              update_by = ?,     update_time = getdate()          where notice_id = ?
### Cause: com.microsoft.sqlserver.jdbc.SQLServerException: 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。
; uncategorized SQLException; SQL state [S0003]; error code [257]; 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。; nested exception is com.microsoft.sqlserver.jdbc.SQLServerException: 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。', CAST(N'2021-12-04T15:01:11.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (8, N'通知公告', 2, N'com.foreman.web.controller.system.SysNoticeController.edit()', N'PUT', 1, N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"noticeContent":"<p>1111111111</p>","createBy":"admin","createTime":1638541349000,"updateBy":"admin","noticeType":"2","remark":"管理员","params":{},"noticeId":1,"noticeTitle":"温馨提醒：2018-07-01 若依新版本发布啦","status":"0"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T15:19:59.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (9, N'通知公告', 2, N'com.foreman.web.controller.system.SysNoticeController.edit()', N'PUT', 1, N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"noticeContent":"<p>乱码？？  </p>","createBy":"admin","createTime":1638541349000,"updateBy":"admin","noticeType":"1","remark":"管理员","params":{},"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","status":"0"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T15:20:12.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (10, N'通知公告', 2, N'com.foreman.web.controller.system.SysNoticeController.edit()', N'PUT', 1, N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"noticeContent":"<p><img src=\"/dev-api/profile/upload/2021/12/04/98ff572f-d8ba-4294-ba17-a741576465ff.png\">乱码？？  </p>","createBy":"admin","createTime":1638541349000,"updateBy":"admin","noticeType":"1","remark":"管理员","updateTime":1638602412000,"params":{},"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","status":"0"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T15:20:27.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (11, N'通知公告', 2, N'com.foreman.web.controller.system.SysNoticeController.edit()', N'PUT', 1, N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"noticeContent":"<p><img src=\"/dev-api/profile/upload/2021/12/04/f1e00aba-0182-46b0-9c65-7804dfd0ea4e.png\"></p>","createBy":"admin","createTime":1638541349000,"updateBy":"admin","noticeType":"1","remark":"管理员","updateTime":1638602427000,"params":{},"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","status":"0"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T15:21:12.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (12, N'菜单管理', 3, N'com.foreman.web.controller.system.SysMenuController.remove()', N'DELETE', 1, N'admin', NULL, N'/system/menu/4', N'127.0.0.1', N'内网IP', N'{menuId=4}', N'{"msg":"菜单已分配,不允许删除","code":500}', 0, NULL, CAST(N'2021-12-04T15:22:07.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (13, N'角色管理', 2, N'com.foreman.web.controller.system.SysRoleController.edit()', N'PUT', 1, N'admin', NULL, N'/system/role', N'127.0.0.1', N'内网IP', N'{"flag":false,"roleId":2,"admin":false,"remark":"普通角色","dataScope":"2","delFlag":"0","params":{},"roleSort":"2","deptCheckStrictly":true,"createTime":1638541333000,"menuCheckStrictly":true,"roleKey":"common","roleName":"普通角色","menuIds":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],"status":"0"}', NULL, 1, N'
### Error querying database.  Cause: com.microsoft.sqlserver.jdbc.SQLServerException: “limit”附近有语法错误。
### The error may exist in file [F:\JAVA\RuoYi\RuoYi-Vue\foreman-system\target\classes\mapper\system\SysRoleMapper.xml]
### The error may involve com.foreman.system.mapper.SysRoleMapper.checkRoleNameUnique-Inline
### The error occurred while setting parameters
### SQL: select distinct r.role_id, r.role_name, r.role_key, r.role_sort, r.data_scope, r.menu_check_strictly, r.dept_check_strictly,             r.status, r.del_flag, r.create_time, r.remark         from sys_role r          left join sys_user_role ur on ur.role_id = r.role_id          left join sys_user u on u.user_id = ur.user_id          left join sys_dept d on u.dept_id = d.dept_id          where r.role_name=? limit 1
### Cause: com.microsoft.sqlserver.jdbc.SQLServerException: “limit”附近有语法错误。
; uncategorized SQLException; SQL state [S0001]; error code [102]; “limit”附近有语法错误。; nested exception is com.microsoft.sqlserver.jdbc.SQLServerException: “limit”附近有语法错误。', CAST(N'2021-12-04T15:22:16.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (14, N'角色管理', 2, N'com.foreman.web.controller.system.SysRoleController.edit()', N'PUT', 1, N'admin', NULL, N'/system/role', N'127.0.0.1', N'内网IP', N'{"flag":false,"roleId":2,"admin":false,"remark":"普通角色","dataScope":"2","delFlag":"0","params":{},"roleSort":"2","deptCheckStrictly":true,"createTime":1638541333000,"updateBy":"admin","menuCheckStrictly":true,"roleKey":"common","roleName":"普通角色","menuIds":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],"status":"0"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T15:44:20.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (15, N'菜单管理', 3, N'com.foreman.web.controller.system.SysMenuController.remove()', N'DELETE', 1, N'admin', NULL, N'/system/menu/4', N'127.0.0.1', N'内网IP', N'{menuId=4}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T15:44:29.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (16, N'用户管理', 2, N'com.foreman.web.controller.system.SysUserController.edit()', N'PUT', 1, N'admin', NULL, N'/system/user', N'127.0.0.1', N'内网IP', N'{"roles":[{"flag":false,"roleId":2,"admin":false,"dataScope":"2","params":{},"roleSort":"2","deptCheckStrictly":false,"menuCheckStrictly":false,"roleKey":"common","roleName":"普通角色","status":"0"}],"phonenumber":"15666666666","admin":false,"loginDate":1638541332000,"remark":"测试员","delFlag":"0","password":"","updateBy":"admin","postIds":[2],"loginIp":"127.0.0.1","email":"ry@qq.com","nickName":"若依","sex":"1","deptId":105,"avatar":"","dept":{"deptName":"测试部门","leader":"若依","deptId":105,"orderNum":"3","params":{},"parentId":101,"children":[],"status":"0"},"params":{},"userName":"ry","userId":2,"createBy":"admin","roleIds":[2],"createTime":1638541332000,"status":"1"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T15:59:05.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (17, N'用户管理', 2, N'com.foreman.web.controller.system.SysUserController.changeStatus()', N'PUT', 1, N'admin', NULL, N'/system/user/changeStatus', N'127.0.0.1', N'内网IP', N'{"admin":false,"updateBy":"admin","params":{},"userId":2,"status":"0"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-04T15:59:09.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (18, N'用户管理', 1, N'com.foreman.web.controller.system.SysUserController.add()', N'POST', 1, N'admin', NULL, N'/system/user', N'127.0.0.1', N'内网IP', N'{"phonenumber":"18845678900","admin":false,"password":"$2a$10$5wgjaf3wHruu67axJAmd8uWSG/yK24hKKVH8CaQuQh2OYyOU6e.Bm","postIds":[],"email":"12345@qq.com","nickName":"test","sex":"0","params":{},"userName":"test","userId":3,"createBy":"admin","roleIds":[],"status":"0"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-14T21:51:57.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (19, N'用户管理', 2, N'com.foreman.web.controller.system.SysUserController.edit()', N'PUT', 1, N'admin', NULL, N'/system/user', N'127.0.0.1', N'内网IP', N'{"roles":[],"phonenumber":"18845678900","admin":false,"delFlag":"0","password":"","updateBy":"admin","postIds":[],"loginIp":"","email":"12345@qq.com","nickName":"test","sex":"0","avatar":"","params":{},"userName":"test","userId":3,"createBy":"admin","roleIds":[],"createTime":1639489917000,"status":"0"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-14T21:52:10.0000000' AS DateTime2))
GO
INSERT [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (20, N'用户管理', 2, N'com.foreman.web.controller.system.SysUserController.edit()', N'PUT', 1, N'admin', NULL, N'/system/user', N'127.0.0.1', N'内网IP', N'{"roles":[],"phonenumber":"18845678900","admin":false,"delFlag":"0","password":"","updateBy":"admin","postIds":[],"loginIp":"","email":"12345@qq.com","nickName":"test","sex":"0","deptId":100,"avatar":"","params":{},"userName":"test","userId":3,"createBy":"admin","roleIds":[],"createTime":1639489917000,"status":"0"}', N'{"msg":"操作成功","code":200}', 0, NULL, CAST(N'2021-12-14T21:52:41.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[sys_oper_log] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_post] ON
GO
INSERT [dbo].[sys_post] ([post_id], [post_code], [post_name], [post_sort], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1, N'ceo', N'董事长', 1, N'0', N'admin', CAST(N'2021-12-03T22:22:13.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_post] ([post_id], [post_code], [post_name], [post_sort], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (2, N'se', N'项目经理', 2, N'0', N'admin', CAST(N'2021-12-03T22:22:13.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_post] ([post_id], [post_code], [post_name], [post_sort], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (3, N'hr', N'人力资源', 3, N'0', N'admin', CAST(N'2021-12-03T22:22:13.0000000' AS DateTime2), N'', NULL, N'')
GO
INSERT [dbo].[sys_post] ([post_id], [post_code], [post_name], [post_sort], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (4, N'user', N'普通员工', 4, N'0', N'admin', CAST(N'2021-12-03T22:22:13.0000000' AS DateTime2), N'', NULL, N'')
GO
SET IDENTITY_INSERT [dbo].[sys_post] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_role] ON
GO
INSERT [dbo].[sys_role] ([role_id], [role_name], [role_key], [role_sort], [data_scope], [menu_check_strictly], [dept_check_strictly], [status], [del_flag], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1, N'超级管理员', N'admin', 1, N'1', 1, 1, N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:13.0000000' AS DateTime2), N'', NULL, N'超级管理员')
GO
INSERT [dbo].[sys_role] ([role_id], [role_name], [role_key], [role_sort], [data_scope], [menu_check_strictly], [dept_check_strictly], [status], [del_flag], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (2, N'普通角色', N'common', 2, N'2', 1, 1, N'0', N'0', N'admin', CAST(N'2021-12-03T22:22:13.0000000' AS DateTime2), N'admin', CAST(N'2021-12-04T15:44:20.0000000' AS DateTime2), N'普通角色')
GO
SET IDENTITY_INSERT [dbo].[sys_role] OFF
GO
INSERT [dbo].[sys_role_dept] ([role_id], [dept_id]) VALUES (2, 100)
GO
INSERT [dbo].[sys_role_dept] ([role_id], [dept_id]) VALUES (2, 101)
GO
INSERT [dbo].[sys_role_dept] ([role_id], [dept_id]) VALUES (2, 105)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 2)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 3)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 100)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 101)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 102)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 103)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 104)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 105)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 106)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 107)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 108)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 109)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 110)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 111)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 112)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 113)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 114)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 115)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 116)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 500)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 501)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1001)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1002)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1003)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1004)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1005)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1006)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1007)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1008)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1009)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1010)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1011)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1012)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1013)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1014)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1015)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1016)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1017)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1018)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1019)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1020)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1021)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1022)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1023)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1024)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1025)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1026)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1027)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1028)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1029)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1030)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1031)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1032)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1033)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1034)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1035)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1036)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1037)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1038)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1039)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1040)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1041)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1042)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1043)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1044)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1045)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1046)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1047)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1048)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1049)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1050)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1051)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1052)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1053)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1054)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1055)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1056)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1057)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1058)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1059)
GO
INSERT [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (2, 1060)
GO
SET IDENTITY_INSERT [dbo].[sys_user] ON
GO
INSERT [dbo].[sys_user] ([user_id], [dept_id], [user_name], [nick_name], [user_type], [email], [phonenumber], [sex], [avatar], [password], [status], [del_flag], [login_ip], [login_date], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (1, 103, N'admin', N'若依', N'00', N'ry@163.com', N'15888888888', N'1', N'', N'$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', N'0', N'0', N'127.0.0.1', CAST(N'2021-12-14T21:25:37.0000000' AS DateTime2), N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'', CAST(N'2021-12-14T21:25:37.0000000' AS DateTime2), N'管理员')
GO
INSERT [dbo].[sys_user] ([user_id], [dept_id], [user_name], [nick_name], [user_type], [email], [phonenumber], [sex], [avatar], [password], [status], [del_flag], [login_ip], [login_date], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (2, 105, N'ry', N'若依', N'00', N'ry@qq.com', N'15666666666', N'1', N'', N'$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', N'0', N'0', N'127.0.0.1', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'admin', CAST(N'2021-12-03T22:22:12.0000000' AS DateTime2), N'admin', CAST(N'2021-12-04T15:59:09.0000000' AS DateTime2), N'测试员')
GO
INSERT [dbo].[sys_user] ([user_id], [dept_id], [user_name], [nick_name], [user_type], [email], [phonenumber], [sex], [avatar], [password], [status], [del_flag], [login_ip], [login_date], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (3, 100, N'test', N'test', N'00', N'12345@qq.com', N'18845678900', N'0', N'', N'$2a$10$5wgjaf3wHruu67axJAmd8uWSG/yK24hKKVH8CaQuQh2OYyOU6e.Bm', N'0', N'0', N'', NULL, N'admin', CAST(N'2021-12-14T21:51:57.0000000' AS DateTime2), N'admin', CAST(N'2021-12-14T21:52:41.0000000' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[sys_user] OFF
GO
INSERT [dbo].[sys_user_post] ([user_id], [post_id]) VALUES (1, 1)
GO
INSERT [dbo].[sys_user_post] ([user_id], [post_id]) VALUES (2, 2)
GO
INSERT [dbo].[sys_user_role] ([user_id], [role_id]) VALUES (1, 1)
GO
INSERT [dbo].[sys_user_role] ([user_id], [role_id]) VALUES (2, 2)
GO
ALTER TABLE [dbo].[gen_table] ADD  CONSTRAINT [DF_gen_table_table_name]  DEFAULT ('') FOR [table_name]
GO
ALTER TABLE [dbo].[gen_table] ADD  CONSTRAINT [DF_gen_table_table_comment]  DEFAULT ('') FOR [table_comment]
GO
ALTER TABLE [dbo].[gen_table] ADD  CONSTRAINT [DF_gen_table_class_name]  DEFAULT ('') FOR [class_name]
GO
ALTER TABLE [dbo].[gen_table] ADD  CONSTRAINT [DF_gen_table_tpl_category]  DEFAULT ('crud') FOR [tpl_category]
GO
ALTER TABLE [dbo].[gen_table] ADD  CONSTRAINT [DF_gen_table_gen_type]  DEFAULT ('0') FOR [gen_type]
GO
ALTER TABLE [dbo].[gen_table] ADD  CONSTRAINT [DF_gen_table_gen_path]  DEFAULT ('/') FOR [gen_path]
GO
ALTER TABLE [dbo].[gen_table] ADD  CONSTRAINT [DF_gen_table_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[gen_table] ADD  CONSTRAINT [DF_gen_table_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[gen_table_column] ADD  CONSTRAINT [DF_gen_table_column_query_type]  DEFAULT ('EQ') FOR [query_type]
GO
ALTER TABLE [dbo].[gen_table_column] ADD  CONSTRAINT [DF_gen_table_column_dict_type]  DEFAULT ('') FOR [dict_type]
GO
ALTER TABLE [dbo].[gen_table_column] ADD  CONSTRAINT [DF_gen_table_column_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[gen_table_column] ADD  CONSTRAINT [DF_gen_table_column_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[sys_config] ADD  CONSTRAINT [DF_sys_config_config_name]  DEFAULT ('') FOR [config_name]
GO
ALTER TABLE [dbo].[sys_config] ADD  CONSTRAINT [DF_sys_config_config_key]  DEFAULT ('') FOR [config_key]
GO
ALTER TABLE [dbo].[sys_config] ADD  CONSTRAINT [DF_sys_config_config_value]  DEFAULT ('') FOR [config_value]
GO
ALTER TABLE [dbo].[sys_config] ADD  CONSTRAINT [DF_sys_config_config_type]  DEFAULT ('N') FOR [config_type]
GO
ALTER TABLE [dbo].[sys_config] ADD  CONSTRAINT [DF_sys_config_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[sys_config] ADD  CONSTRAINT [DF_sys_config_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[sys_dept] ADD  CONSTRAINT [DF_sys_dept_parent_id]  DEFAULT ((0)) FOR [parent_id]
GO
ALTER TABLE [dbo].[sys_dept] ADD  CONSTRAINT [DF_sys_dept_ancestors]  DEFAULT ('') FOR [ancestors]
GO
ALTER TABLE [dbo].[sys_dept] ADD  CONSTRAINT [DF_sys_dept_dept_name]  DEFAULT ('') FOR [dept_name]
GO
ALTER TABLE [dbo].[sys_dept] ADD  CONSTRAINT [DF_sys_dept_order_num]  DEFAULT ((0)) FOR [order_num]
GO
ALTER TABLE [dbo].[sys_dept] ADD  CONSTRAINT [DF_sys_dept_status]  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[sys_dept] ADD  CONSTRAINT [DF_sys_dept_del_flag]  DEFAULT ('0') FOR [del_flag]
GO
ALTER TABLE [dbo].[sys_dept] ADD  CONSTRAINT [DF_sys_dept_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[sys_dept] ADD  CONSTRAINT [DF_sys_dept_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[sys_dict_data] ADD  CONSTRAINT [DF_sys_dict_data_dict_sort]  DEFAULT ((0)) FOR [dict_sort]
GO
ALTER TABLE [dbo].[sys_dict_data] ADD  CONSTRAINT [DF_sys_dict_data_dict_label]  DEFAULT ('') FOR [dict_label]
GO
ALTER TABLE [dbo].[sys_dict_data] ADD  CONSTRAINT [DF_sys_dict_data_dict_value]  DEFAULT ('') FOR [dict_value]
GO
ALTER TABLE [dbo].[sys_dict_data] ADD  CONSTRAINT [DF_sys_dict_data_dict_type]  DEFAULT ('') FOR [dict_type]
GO
ALTER TABLE [dbo].[sys_dict_data] ADD  CONSTRAINT [DF_sys_dict_data_is_default]  DEFAULT ('N') FOR [is_default]
GO
ALTER TABLE [dbo].[sys_dict_data] ADD  CONSTRAINT [DF_sys_dict_data_status]  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[sys_dict_data] ADD  CONSTRAINT [DF_sys_dict_data_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[sys_dict_data] ADD  CONSTRAINT [DF_sys_dict_data_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[sys_dict_type] ADD  CONSTRAINT [DF_sys_dict_type_dict_name]  DEFAULT ('') FOR [dict_name]
GO
ALTER TABLE [dbo].[sys_dict_type] ADD  CONSTRAINT [DF_sys_dict_type_dict_type]  DEFAULT ('') FOR [dict_type]
GO
ALTER TABLE [dbo].[sys_dict_type] ADD  CONSTRAINT [DF_sys_dict_type_status]  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[sys_dict_type] ADD  CONSTRAINT [DF_sys_dict_type_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[sys_dict_type] ADD  CONSTRAINT [DF_sys_dict_type_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[sys_job] ADD  CONSTRAINT [DF_sys_job_job_name]  DEFAULT ('') FOR [job_name]
GO
ALTER TABLE [dbo].[sys_job] ADD  CONSTRAINT [DF_sys_job_job_group]  DEFAULT ('DEFAULT') FOR [job_group]
GO
ALTER TABLE [dbo].[sys_job] ADD  CONSTRAINT [DF_sys_job_cron_expression]  DEFAULT ('') FOR [cron_expression]
GO
ALTER TABLE [dbo].[sys_job] ADD  CONSTRAINT [DF_sys_job_misfire_policy]  DEFAULT ('3') FOR [misfire_policy]
GO
ALTER TABLE [dbo].[sys_job] ADD  CONSTRAINT [DF_sys_job_concurrent]  DEFAULT ('1') FOR [concurrent]
GO
ALTER TABLE [dbo].[sys_job] ADD  CONSTRAINT [DF_sys_job_status]  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[sys_job] ADD  CONSTRAINT [DF_sys_job_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[sys_job] ADD  CONSTRAINT [DF_sys_job_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[sys_job] ADD  CONSTRAINT [DF_sys_job_remark]  DEFAULT ('') FOR [remark]
GO
ALTER TABLE [dbo].[sys_job_log] ADD  CONSTRAINT [DF_sys_job_log_status]  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[sys_job_log] ADD  CONSTRAINT [DF_sys_job_log_exception_info]  DEFAULT ('') FOR [exception_info]
GO
ALTER TABLE [dbo].[sys_logininfor] ADD  CONSTRAINT [DF_sys_logininfor_user_name]  DEFAULT ('') FOR [user_name]
GO
ALTER TABLE [dbo].[sys_logininfor] ADD  CONSTRAINT [DF_sys_logininfor_ipaddr]  DEFAULT ('') FOR [ipaddr]
GO
ALTER TABLE [dbo].[sys_logininfor] ADD  CONSTRAINT [DF_sys_logininfor_login_location]  DEFAULT ('') FOR [login_location]
GO
ALTER TABLE [dbo].[sys_logininfor] ADD  CONSTRAINT [DF_sys_logininfor_browser]  DEFAULT ('') FOR [browser]
GO
ALTER TABLE [dbo].[sys_logininfor] ADD  CONSTRAINT [DF_sys_logininfor_os]  DEFAULT ('') FOR [os]
GO
ALTER TABLE [dbo].[sys_logininfor] ADD  CONSTRAINT [DF_sys_logininfor_status]  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[sys_logininfor] ADD  CONSTRAINT [DF_sys_logininfor_msg]  DEFAULT ('') FOR [msg]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_parent_id]  DEFAULT ((0)) FOR [parent_id]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_order_num]  DEFAULT ((0)) FOR [order_num]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_path]  DEFAULT ('') FOR [path]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_is_frame]  DEFAULT ((1)) FOR [is_frame]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_is_cache]  DEFAULT ((0)) FOR [is_cache]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_menu_type]  DEFAULT ('') FOR [menu_type]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_visible]  DEFAULT ((0)) FOR [visible]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_icon]  DEFAULT ('#') FOR [icon]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_remark]  DEFAULT ('') FOR [remark]
GO
ALTER TABLE [dbo].[sys_notice] ADD  CONSTRAINT [DF_sys_notice_status]  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[sys_notice] ADD  CONSTRAINT [DF_sys_notice_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[sys_notice] ADD  CONSTRAINT [DF_sys_notice_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_title]  DEFAULT ('') FOR [title]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_business_type]  DEFAULT ((0)) FOR [business_type]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_method]  DEFAULT ('') FOR [method]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_request_method]  DEFAULT ('') FOR [request_method]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_operator_type]  DEFAULT ((0)) FOR [operator_type]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_oper_name]  DEFAULT ('') FOR [oper_name]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_dept_name]  DEFAULT ('') FOR [dept_name]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_oper_url]  DEFAULT ('') FOR [oper_url]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_oper_ip]  DEFAULT ('') FOR [oper_ip]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_oper_location]  DEFAULT ('') FOR [oper_location]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_oper_param]  DEFAULT ('') FOR [oper_param]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_json_result]  DEFAULT ('') FOR [json_result]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[sys_oper_log] ADD  CONSTRAINT [DF_sys_oper_log_error_msg]  DEFAULT ('') FOR [error_msg]
GO
ALTER TABLE [dbo].[sys_post] ADD  CONSTRAINT [DF_sys_post_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[sys_post] ADD  CONSTRAINT [DF_sys_post_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[sys_role] ADD  CONSTRAINT [DF_sys_role_data_scope]  DEFAULT ('1') FOR [data_scope]
GO
ALTER TABLE [dbo].[sys_role] ADD  CONSTRAINT [DF_sys_role_menu_check_strictly]  DEFAULT ((1)) FOR [menu_check_strictly]
GO
ALTER TABLE [dbo].[sys_role] ADD  CONSTRAINT [DF_sys_role_dept_check_strictly]  DEFAULT ((1)) FOR [dept_check_strictly]
GO
ALTER TABLE [dbo].[sys_role] ADD  CONSTRAINT [DF_sys_role_del_flag]  DEFAULT ('0') FOR [del_flag]
GO
ALTER TABLE [dbo].[sys_role] ADD  CONSTRAINT [DF_sys_role_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[sys_role] ADD  CONSTRAINT [DF_sys_role_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_user_type]  DEFAULT ('00') FOR [user_type]
GO
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_email]  DEFAULT ('') FOR [email]
GO
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_phonenumber]  DEFAULT ('') FOR [phonenumber]
GO
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_sex]  DEFAULT ('0') FOR [sex]
GO
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_avatar]  DEFAULT ('') FOR [avatar]
GO
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_password]  DEFAULT ('') FOR [password]
GO
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_status]  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_del_flag]  DEFAULT ('0') FOR [del_flag]
GO
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_login_ip]  DEFAULT ('') FOR [login_ip]
GO
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_create_by]  DEFAULT ('') FOR [create_by]
GO
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_update_by]  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[qrtz_blob_triggers]  WITH CHECK ADD  CONSTRAINT [qrtz_blob_triggers_ibfk_1] FOREIGN KEY([sched_name], [trigger_name], [trigger_group])
REFERENCES [dbo].[qrtz_triggers] ([sched_name], [trigger_name], [trigger_group])
GO
ALTER TABLE [dbo].[qrtz_blob_triggers] CHECK CONSTRAINT [qrtz_blob_triggers_ibfk_1]
GO
ALTER TABLE [dbo].[qrtz_cron_triggers]  WITH CHECK ADD  CONSTRAINT [qrtz_cron_triggers_ibfk_1] FOREIGN KEY([sched_name], [trigger_name], [trigger_group])
REFERENCES [dbo].[qrtz_triggers] ([sched_name], [trigger_name], [trigger_group])
GO
ALTER TABLE [dbo].[qrtz_cron_triggers] CHECK CONSTRAINT [qrtz_cron_triggers_ibfk_1]
GO
ALTER TABLE [dbo].[qrtz_simple_triggers]  WITH CHECK ADD  CONSTRAINT [qrtz_simple_triggers_ibfk_1] FOREIGN KEY([sched_name], [trigger_name], [trigger_group])
REFERENCES [dbo].[qrtz_triggers] ([sched_name], [trigger_name], [trigger_group])
GO
ALTER TABLE [dbo].[qrtz_simple_triggers] CHECK CONSTRAINT [qrtz_simple_triggers_ibfk_1]
GO
ALTER TABLE [dbo].[qrtz_simprop_triggers]  WITH CHECK ADD  CONSTRAINT [qrtz_simprop_triggers_ibfk_1] FOREIGN KEY([sched_name], [trigger_name], [trigger_group])
REFERENCES [dbo].[qrtz_triggers] ([sched_name], [trigger_name], [trigger_group])
GO
ALTER TABLE [dbo].[qrtz_simprop_triggers] CHECK CONSTRAINT [qrtz_simprop_triggers_ibfk_1]
GO
ALTER TABLE [dbo].[qrtz_triggers]  WITH CHECK ADD  CONSTRAINT [qrtz_triggers_ibfk_1] FOREIGN KEY([sched_name], [job_name], [job_group])
REFERENCES [dbo].[qrtz_job_details] ([sched_name], [job_name], [job_group])
GO
ALTER TABLE [dbo].[qrtz_triggers] CHECK CONSTRAINT [qrtz_triggers_ibfk_1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'table_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'table_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'table_comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联子表的表名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'sub_table_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子表关联的外键名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'sub_table_fk_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实体类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'class_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用的模板（crud单表操作 tree树表操作）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'tpl_category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成包路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'package_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成模块名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'module_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成业务名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'business_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成功能名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'function_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成功能作者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'function_author'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成代码方式（0zip压缩包 1自定义路径）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'gen_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成路径（不填默认项目路径）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'gen_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其它生成选项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'options'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代码生成业务表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'column_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'归属表编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'table_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'列名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'column_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'列描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'column_comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'列类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'column_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'JAVA类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'java_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'JAVA字段名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'java_field'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否主键（1是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'is_pk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自增（1是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'is_increment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否必填（1是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'is_required'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为插入字段（1是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'is_insert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否编辑字段（1是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'is_edit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否列表字段（1是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'is_list'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否查询字段（1是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'is_query'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'查询方式（等于、不等于、大于、小于、范围）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'query_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'html_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'dict_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代码生成业务表字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gen_table_column'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_blob_triggers', @level2type=N'COLUMN',@level2name=N'sched_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_triggers表trigger_name的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_blob_triggers', @level2type=N'COLUMN',@level2name=N'trigger_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_triggers表trigger_group的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_blob_triggers', @level2type=N'COLUMN',@level2name=N'trigger_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存放持久化Trigger对象' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_blob_triggers', @level2type=N'COLUMN',@level2name=N'blob_data'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Blob类型的触发器表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_blob_triggers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_calendars', @level2type=N'COLUMN',@level2name=N'sched_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日历名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_calendars', @level2type=N'COLUMN',@level2name=N'calendar_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存放持久化calendar对象' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_calendars', @level2type=N'COLUMN',@level2name=N'calendar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日历信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_calendars'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_cron_triggers', @level2type=N'COLUMN',@level2name=N'sched_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_triggers表trigger_name的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_cron_triggers', @level2type=N'COLUMN',@level2name=N'trigger_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_triggers表trigger_group的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_cron_triggers', @level2type=N'COLUMN',@level2name=N'trigger_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'cron表达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_cron_triggers', @level2type=N'COLUMN',@level2name=N'cron_expression'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_cron_triggers', @level2type=N'COLUMN',@level2name=N'time_zone_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cron类型的触发器表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_cron_triggers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'sched_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度器实例id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'entry_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_triggers表trigger_name的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'trigger_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_triggers表trigger_group的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'trigger_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度器实例名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'instance_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'触发的时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'fired_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'定时器制定的时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'sched_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优先级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'priority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'job_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务组名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'job_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否并发' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'is_nonconcurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否接受恢复执行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers', @level2type=N'COLUMN',@level2name=N'requests_recovery'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已触发的触发器表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_fired_triggers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_job_details', @level2type=N'COLUMN',@level2name=N'sched_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_job_details', @level2type=N'COLUMN',@level2name=N'job_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务组名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_job_details', @level2type=N'COLUMN',@level2name=N'job_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相关介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_job_details', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行任务类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_job_details', @level2type=N'COLUMN',@level2name=N'job_class_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否持久化' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_job_details', @level2type=N'COLUMN',@level2name=N'is_durable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否并发' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_job_details', @level2type=N'COLUMN',@level2name=N'is_nonconcurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否更新数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_job_details', @level2type=N'COLUMN',@level2name=N'is_update_data'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否接受恢复执行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_job_details', @level2type=N'COLUMN',@level2name=N'requests_recovery'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存放持久化job对象' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_job_details', @level2type=N'COLUMN',@level2name=N'job_data'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务详细信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_job_details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_locks', @level2type=N'COLUMN',@level2name=N'sched_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'悲观锁名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_locks', @level2type=N'COLUMN',@level2name=N'lock_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存储的悲观锁信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_locks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_paused_trigger_grps', @level2type=N'COLUMN',@level2name=N'sched_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_triggers表trigger_group的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_paused_trigger_grps', @level2type=N'COLUMN',@level2name=N'trigger_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'暂停的触发器表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_paused_trigger_grps'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_scheduler_state', @level2type=N'COLUMN',@level2name=N'sched_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实例名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_scheduler_state', @level2type=N'COLUMN',@level2name=N'instance_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上次检查时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_scheduler_state', @level2type=N'COLUMN',@level2name=N'last_checkin_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查间隔时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_scheduler_state', @level2type=N'COLUMN',@level2name=N'checkin_interval'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度器状态表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_scheduler_state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simple_triggers', @level2type=N'COLUMN',@level2name=N'sched_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_triggers表trigger_name的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simple_triggers', @level2type=N'COLUMN',@level2name=N'trigger_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_triggers表trigger_group的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simple_triggers', @level2type=N'COLUMN',@level2name=N'trigger_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重复的次数统计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simple_triggers', @level2type=N'COLUMN',@level2name=N'repeat_count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重复的间隔时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simple_triggers', @level2type=N'COLUMN',@level2name=N'repeat_interval'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已经触发的次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simple_triggers', @level2type=N'COLUMN',@level2name=N'times_triggered'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'简单触发器的信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simple_triggers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'sched_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_triggers表trigger_name的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'trigger_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_triggers表trigger_group的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'trigger_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'String类型的trigger的第一个参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'str_prop_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'String类型的trigger的第二个参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'str_prop_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'String类型的trigger的第三个参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'str_prop_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'int类型的trigger的第一个参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'int_prop_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'int类型的trigger的第二个参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'int_prop_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'long类型的trigger的第一个参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'long_prop_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'long类型的trigger的第二个参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'long_prop_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'decimal类型的trigger的第一个参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'dec_prop_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'decimal类型的trigger的第二个参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'dec_prop_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Boolean类型的trigger的第一个参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'bool_prop_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Boolean类型的trigger的第二个参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers', @level2type=N'COLUMN',@level2name=N'bool_prop_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'同步机制的行锁表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_simprop_triggers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'sched_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'触发器的名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'trigger_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'触发器所属组的名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'trigger_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_job_details表job_name的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'job_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qrtz_job_details表job_group的外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'job_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相关介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上一次触发时间（毫秒）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'next_fire_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下一次触发时间（默认为-1表示不触发）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'prev_fire_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优先级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'priority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'触发器状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'trigger_state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'触发器的类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'trigger_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'start_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'end_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日程表名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'calendar_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'补偿执行的策略' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'misfire_instr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存放持久化job对象' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers', @level2type=N'COLUMN',@level2name=N'job_data'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'触发器详细信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qrtz_triggers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'config_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'config_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数键名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'config_key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数键值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'config_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统内置（Y是 N否）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'config_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数配置表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'dept_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父部门id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'祖级列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'ancestors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'dept_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示顺序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'order_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'负责人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'leader'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门状态（0正常 1停用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志（0代表存在 2代表删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'dict_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'dict_sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'dict_label'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典键值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'dict_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'dict_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'样式属性（其他样式扩展）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'css_class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表格回显样式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'list_class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认（Y是 N否）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'is_default'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0正常 1停用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典数据表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_data'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_type', @level2type=N'COLUMN',@level2name=N'dict_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_type', @level2type=N'COLUMN',@level2name=N'dict_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_type', @level2type=N'COLUMN',@level2name=N'dict_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0正常 1停用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_type', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_type', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_type', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_type', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_type', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_type', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典类型表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'job_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'job_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务组名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'job_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用目标字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'invoke_target'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'cron执行表达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'cron_expression'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划执行错误策略（1立即执行 2执行一次 3放弃执行）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'misfire_policy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否并发执行（0允许 1禁止）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'concurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0正常 1暂停）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'定时任务调度表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务日志ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job_log', @level2type=N'COLUMN',@level2name=N'job_log_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job_log', @level2type=N'COLUMN',@level2name=N'job_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务组名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job_log', @level2type=N'COLUMN',@level2name=N'job_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用目标字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job_log', @level2type=N'COLUMN',@level2name=N'invoke_target'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job_log', @level2type=N'COLUMN',@level2name=N'job_message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行状态（0正常 1失败）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job_log', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'异常信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job_log', @level2type=N'COLUMN',@level2name=N'exception_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job_log', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'定时任务调度日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_job_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logininfor', @level2type=N'COLUMN',@level2name=N'info_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logininfor', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logininfor', @level2type=N'COLUMN',@level2name=N'ipaddr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logininfor', @level2type=N'COLUMN',@level2name=N'login_location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览器类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logininfor', @level2type=N'COLUMN',@level2name=N'browser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作系统' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logininfor', @level2type=N'COLUMN',@level2name=N'os'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录状态（0成功 1失败）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logininfor', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提示消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logininfor', @level2type=N'COLUMN',@level2name=N'msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logininfor', @level2type=N'COLUMN',@level2name=N'login_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统访问记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logininfor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'menu_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'menu_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示顺序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'order_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'component'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'query'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为外链（0是 1否）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'is_frame'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否缓存（0缓存 1不缓存）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'is_cache'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单类型（M目录 C菜单 F按钮）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'menu_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单状态（0显示 1隐藏）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'visible'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单状态（0正常 1停用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'perms'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单权限表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_notice', @level2type=N'COLUMN',@level2name=N'notice_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_notice', @level2type=N'COLUMN',@level2name=N'notice_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告类型（1通知 2公告）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_notice', @level2type=N'COLUMN',@level2name=N'notice_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_notice', @level2type=N'COLUMN',@level2name=N'notice_content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告状态（0正常 1关闭）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_notice', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_notice', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_notice', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_notice', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_notice', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_notice', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通知公告表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_notice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'oper_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务类型（0其它 1新增 2修改 3删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'business_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'request_method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类别（0其它 1后台用户 2手机端用户）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'operator_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'oper_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'dept_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'oper_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主机地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'oper_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'oper_location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'oper_param'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返回参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'json_result'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作状态（0正常 1异常）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'错误消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'error_msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log', @level2type=N'COLUMN',@level2name=N'oper_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日志记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_oper_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_post', @level2type=N'COLUMN',@level2name=N'post_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_post', @level2type=N'COLUMN',@level2name=N'post_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_post', @level2type=N'COLUMN',@level2name=N'post_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示顺序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_post', @level2type=N'COLUMN',@level2name=N'post_sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0正常 1停用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_post', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_post', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_post', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_post', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_post', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_post', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_post'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'role_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色权限字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'role_key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示顺序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'role_sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'data_scope'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单树选择项是否关联显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'menu_check_strictly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门树选择项是否关联显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'dept_check_strictly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色状态（0正常 1停用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志（0代表存在 2代表删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_dept', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_dept', @level2type=N'COLUMN',@level2name=N'dept_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色和部门关联表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_dept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_menu', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_menu', @level2type=N'COLUMN',@level2name=N'menu_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色和菜单关联表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'dept_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'nick_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户类型（00系统用户）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'user_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'phonenumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户性别（0男 1女 2未知）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'avatar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帐号状态（0正常 1停用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志（0代表存在 2代表删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'login_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'login_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user_post', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user_post', @level2type=N'COLUMN',@level2name=N'post_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户与岗位关联表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user_post'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user_role', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user_role', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户和角色关联表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user_role'
GO
