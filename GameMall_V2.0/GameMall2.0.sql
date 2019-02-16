/*
 Navicat Premium Data Transfer

 Source Server         : 123.207.242.177sqlserver
 Source Server Type    : SQL Server
 Source Server Version : 12004100
 Source Host           : 123.207.242.177:1433
 Source Catalog        : GameMall
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 12004100
 File Encoding         : 65001

 Date: 16/02/2019 14:47:57
*/


-- ----------------------------
-- Table structure for Admin
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Admin]') AND type IN ('U'))
	DROP TABLE [dbo].[Admin]
GO

CREATE TABLE [dbo].[Admin] (
  [AdminId] int  IDENTITY(1,1) NOT NULL,
  [UserId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[Admin] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Admin
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Admin] ON
GO

INSERT INTO [dbo].[Admin] ([AdminId], [UserId]) VALUES (N'1', N'1')
GO

INSERT INTO [dbo].[Admin] ([AdminId], [UserId]) VALUES (N'2', N'3')
GO

INSERT INTO [dbo].[Admin] ([AdminId], [UserId]) VALUES (N'3', N'8')
GO

INSERT INTO [dbo].[Admin] ([AdminId], [UserId]) VALUES (N'4', N'9')
GO

INSERT INTO [dbo].[Admin] ([AdminId], [UserId]) VALUES (N'5', N'10')
GO

SET IDENTITY_INSERT [dbo].[Admin] OFF
GO


-- ----------------------------
-- Table structure for AdminLog
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminLog]') AND type IN ('U'))
	DROP TABLE [dbo].[AdminLog]
GO

CREATE TABLE [dbo].[AdminLog] (
  [AdminLogId] int  IDENTITY(1,1) NOT NULL,
  [AdminId] int  NOT NULL,
  [OperatorTime] datetime  NOT NULL,
  [IP] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OperationRecord] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[AdminLog] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of AdminLog
-- ----------------------------
SET IDENTITY_INSERT [dbo].[AdminLog] ON
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'1', N'1', N'2017-04-05 22:48:35.733', N'10.37.87.52', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'2', N'1', N'2017-04-06 00:16:32.397', N'10.37.87.52', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'3', N'1', N'2017-04-06 00:19:58.893', N'10.37.87.52', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'4', N'1', N'2017-04-06 00:23:42.077', N'10.37.87.52', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'5', N'1', N'2017-04-06 11:29:51.020', N'10.91.238.176', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'6', N'1', N'2017-04-06 11:42:33.847', N'10.91.238.176', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'7', N'1', N'2017-04-06 11:44:43.013', N'10.91.238.176', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'8', N'1', N'2017-04-06 12:01:17.507', N'10.91.238.176', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'9', N'1', N'2017-04-06 12:02:44.940', N'10.91.238.176', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'10', N'1', N'2017-04-06 12:58:28.737', N'10.91.238.176', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'11', N'1', N'2017-04-06 13:46:57.880', N'10.91.238.176', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'12', N'1', N'2017-04-06 15:18:09.913', N'10.91.238.176', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'13', N'1', N'2017-04-06 15:18:13.910', N'10.91.238.176', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'14', N'1', N'2017-04-06 20:44:43.553', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'15', N'1', N'2017-04-06 21:01:00.877', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'16', N'1', N'2017-04-06 21:02:32.443', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'17', N'1', N'2017-04-06 21:06:54.513', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'18', N'1', N'2017-04-07 15:14:46.377', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'19', N'1', N'2017-04-07 15:21:44.080', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'20', N'1', N'2017-04-07 15:24:01.347', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'21', N'1', N'2017-04-07 15:25:46.357', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'22', N'1', N'2017-04-07 15:28:38.460', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'23', N'1', N'2017-04-07 15:32:09.407', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'24', N'1', N'2017-04-07 15:43:03.000', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'25', N'1', N'2017-04-07 15:59:47.057', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'26', N'1', N'2017-04-07 16:02:27.880', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'27', N'1', N'2017-04-07 16:08:48.050', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'28', N'1', N'2017-04-07 16:16:05.210', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'29', N'1', N'2017-04-07 16:32:48.567', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'30', N'1', N'2017-04-07 17:05:25.070', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'31', N'1', N'2017-04-07 17:12:45.097', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'32', N'1', N'2017-04-07 17:24:57.833', N'192.168.198.160', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'33', N'1', N'2017-04-07 21:20:42.230', N'10.164.67.106', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'34', N'1', N'2017-04-07 21:35:37.703', N'10.164.67.106', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'35', N'1', N'2017-04-07 21:38:31.843', N'10.164.67.106', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'36', N'1', N'2017-04-08 11:12:50.583', N'10.17.113.13', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'37', N'1', N'2017-04-08 21:01:03.927', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'38', N'1', N'2017-04-08 21:01:10.393', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'39', N'1', N'2017-04-08 21:02:14.707', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'40', N'1', N'2017-04-08 21:04:50.520', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'41', N'1', N'2017-04-08 21:04:57.887', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'42', N'1', N'2017-04-08 21:08:21.663', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'43', N'1', N'2017-04-08 21:08:50.727', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'44', N'1', N'2017-04-08 21:36:14.650', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'45', N'1', N'2017-04-08 21:37:57.333', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'46', N'1', N'2017-04-08 21:41:00.060', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'47', N'1', N'2017-04-08 21:42:34.507', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'48', N'1', N'2017-04-08 21:46:05.820', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'49', N'2', N'2017-04-08 21:48:46.780', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'50', N'1', N'2017-04-08 22:13:26.597', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'51', N'1', N'2017-04-08 22:17:45.910', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'52', N'1', N'2017-04-08 22:25:43.543', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'53', N'1', N'2017-04-08 22:31:11.053', N'10.211.52.24', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'54', N'1', N'2017-04-08 23:05:04.933', N'192.168.43.166', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'55', N'1', N'2017-04-08 23:06:01.790', N'192.168.43.166', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'56', N'1', N'2017-04-08 23:09:19.050', N'192.168.43.166', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'57', N'2', N'2017-04-08 23:54:33.787', N'192.168.43.166', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'58', N'2', N'2017-04-09 00:15:07.490', N'192.168.43.166', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'59', N'1', N'2017-04-09 00:27:50.513', N'192.168.43.166', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'60', N'1', N'2017-04-09 10:53:37.733', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'61', N'1', N'2017-04-09 11:06:42.667', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'62', N'1', N'2017-04-09 11:07:11.773', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'63', N'1', N'2017-04-09 11:12:06.917', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'64', N'1', N'2017-04-09 11:21:15.907', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'65', N'1', N'2017-04-09 11:28:29.337', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'66', N'1', N'2017-04-09 11:51:07.010', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'67', N'1', N'2017-04-09 11:53:54.950', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'68', N'1', N'2017-04-09 12:01:45.870', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'69', N'1', N'2017-04-09 12:06:13.420', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'70', N'1', N'2017-04-09 12:52:23.557', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'71', N'1', N'2017-04-09 12:54:07.517', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'72', N'1', N'2017-04-09 13:02:30.387', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'73', N'1', N'2017-04-09 13:06:28.037', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'74', N'1', N'2017-04-09 13:15:26.670', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'75', N'1', N'2017-04-09 13:18:59.837', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'76', N'1', N'2017-04-09 13:20:04.037', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'77', N'1', N'2017-04-09 13:24:30.893', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'78', N'1', N'2017-04-09 13:26:16.523', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'79', N'1', N'2017-04-09 13:32:21.507', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'80', N'1', N'2017-04-09 13:35:12.593', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'81', N'1', N'2017-04-09 13:49:41.727', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'82', N'1', N'2017-04-09 13:53:28.010', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'83', N'1', N'2017-04-09 14:09:38.390', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'84', N'1', N'2017-04-09 14:09:39.747', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'85', N'1', N'2017-04-09 14:22:01.390', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'86', N'2', N'2017-04-09 14:27:28.467', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'87', N'1', N'2017-04-09 15:40:03.160', N'192.168.199.147', N'登录')
GO

INSERT INTO [dbo].[AdminLog] ([AdminLogId], [AdminId], [OperatorTime], [IP], [OperationRecord]) VALUES (N'88', N'1', N'2019-02-16 14:16:34.197', N'10.135.87.159', N'登录')
GO

SET IDENTITY_INSERT [dbo].[AdminLog] OFF
GO


-- ----------------------------
-- Table structure for AdminPermissions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminPermissions]') AND type IN ('U'))
	DROP TABLE [dbo].[AdminPermissions]
GO

CREATE TABLE [dbo].[AdminPermissions] (
  [PermissionId] uniqueidentifier  NOT NULL,
  [AdminId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[AdminPermissions] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of AdminPermissions
-- ----------------------------
INSERT INTO [dbo].[AdminPermissions]  VALUES (N'FBE0E422-44F7-486B-A909-035BF33E6FA0', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'FBE0E422-44F7-486B-A909-035BF33E6FA0', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'FBE0E422-44F7-486B-A909-035BF33E6FA0', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'02865220-0175-44EB-8105-0D2BAD4A36CE', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'02865220-0175-44EB-8105-0D2BAD4A36CE', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'11496F50-5EF6-4120-9706-11821DFF64DF', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'11496F50-5EF6-4120-9706-11821DFF64DF', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'11496F50-5EF6-4120-9706-11821DFF64DF', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'CB911662-BF9F-4E4A-B0D3-20840710D80D', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'CB911662-BF9F-4E4A-B0D3-20840710D80D', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'1E506118-0E2B-4F19-82B2-48773511F735', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'1E506118-0E2B-4F19-82B2-48773511F735', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'1E506118-0E2B-4F19-82B2-48773511F735', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'F58F2EC5-D8E4-4EDB-A4C7-4980BADC68CA', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'F58F2EC5-D8E4-4EDB-A4C7-4980BADC68CA', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'C88064DA-449D-48A4-A7A0-4A57E3F45C70', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'C88064DA-449D-48A4-A7A0-4A57E3F45C70', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'C88064DA-449D-48A4-A7A0-4A57E3F45C70', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'BC18C019-EE6F-44CC-942E-5222F1EBE27A', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'BC18C019-EE6F-44CC-942E-5222F1EBE27A', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'BC18C019-EE6F-44CC-942E-5222F1EBE27A', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'29800518-B9FA-4233-8CFC-75AE89D20C52', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'29800518-B9FA-4233-8CFC-75AE89D20C52', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'29800518-B9FA-4233-8CFC-75AE89D20C52', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'04ECE922-8108-4BB7-A35C-80BF351383E8', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'04ECE922-8108-4BB7-A35C-80BF351383E8', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'4508DDFE-D21E-45F7-9877-80C986BB9EEA', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'4508DDFE-D21E-45F7-9877-80C986BB9EEA', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'4508DDFE-D21E-45F7-9877-80C986BB9EEA', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'498087BC-F1B1-4C85-B0B9-8378FE0F79F6', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'498087BC-F1B1-4C85-B0B9-8378FE0F79F6', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'2B4D1A69-9648-4D67-9C41-9F3ED45E1C0A', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'2B4D1A69-9648-4D67-9C41-9F3ED45E1C0A', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'A9569941-4A20-499E-9809-B2111A38EADA', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'A9569941-4A20-499E-9809-B2111A38EADA', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'D4DBF0DD-807C-44FB-B684-B5A07D405D9F', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'D4DBF0DD-807C-44FB-B684-B5A07D405D9F', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'D4DBF0DD-807C-44FB-B684-B5A07D405D9F', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'42DA5541-D0F7-4D16-B63D-BBFACA278C1C', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'42DA5541-D0F7-4D16-B63D-BBFACA278C1C', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'4E1A8189-1A89-4F05-BA0C-BEE6A5D4F841', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'4E1A8189-1A89-4F05-BA0C-BEE6A5D4F841', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'7D4E9994-DC21-4170-A5F7-BF03AB743800', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'7D4E9994-DC21-4170-A5F7-BF03AB743800', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'28547D86-EEC7-4D9E-BE1B-C2A117E06BDC', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'28547D86-EEC7-4D9E-BE1B-C2A117E06BDC', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'F22071F6-F12C-4626-BA02-C2EA0F1B2E55', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'F22071F6-F12C-4626-BA02-C2EA0F1B2E55', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'FDE896CF-6453-4975-8556-C6155C4B8E7D', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'FDE896CF-6453-4975-8556-C6155C4B8E7D', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'FDE896CF-6453-4975-8556-C6155C4B8E7D', N'3')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'30D57272-CD66-45EC-BBD6-F6FC169C8B75', N'1')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'30D57272-CD66-45EC-BBD6-F6FC169C8B75', N'2')
GO

INSERT INTO [dbo].[AdminPermissions]  VALUES (N'30D57272-CD66-45EC-BBD6-F6FC169C8B75', N'3')
GO


-- ----------------------------
-- Table structure for AdminRoles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminRoles]') AND type IN ('U'))
	DROP TABLE [dbo].[AdminRoles]
GO

CREATE TABLE [dbo].[AdminRoles] (
  [RoleId] uniqueidentifier  NOT NULL,
  [AdminId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[AdminRoles] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of AdminRoles
-- ----------------------------
INSERT INTO [dbo].[AdminRoles]  VALUES (N'58323E28-B814-42CC-8D96-7DA9718FB1BA', N'4')
GO

INSERT INTO [dbo].[AdminRoles]  VALUES (N'58323E28-B814-42CC-8D96-7DA9718FB1BA', N'5')
GO

INSERT INTO [dbo].[AdminRoles]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'2')
GO

INSERT INTO [dbo].[AdminRoles]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'3')
GO


-- ----------------------------
-- Table structure for Customers
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type IN ('U'))
	DROP TABLE [dbo].[Customers]
GO

CREATE TABLE [dbo].[Customers] (
  [CustomerId] int  IDENTITY(1,1) NOT NULL,
  [UserId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[Customers] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Customers
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Customers] ON
GO

INSERT INTO [dbo].[Customers] ([CustomerId], [UserId]) VALUES (N'1', N'2')
GO

INSERT INTO [dbo].[Customers] ([CustomerId], [UserId]) VALUES (N'2', N'4')
GO

INSERT INTO [dbo].[Customers] ([CustomerId], [UserId]) VALUES (N'3', N'5')
GO

INSERT INTO [dbo].[Customers] ([CustomerId], [UserId]) VALUES (N'4', N'6')
GO

INSERT INTO [dbo].[Customers] ([CustomerId], [UserId]) VALUES (N'5', N'7')
GO

SET IDENTITY_INSERT [dbo].[Customers] OFF
GO


-- ----------------------------
-- Table structure for DeliveryAddress
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DeliveryAddress]') AND type IN ('U'))
	DROP TABLE [dbo].[DeliveryAddress]
GO

CREATE TABLE [dbo].[DeliveryAddress] (
  [DeliveryAddressId] int  IDENTITY(1,1) NOT NULL,
  [CustomerId] int  NOT NULL,
  [DeliveryName] nvarchar(10) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Default] int  NULL,
  [Province] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Area] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Street] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [DetailAddress] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [TelNum] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Postcode] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[DeliveryAddress] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of DeliveryAddress
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DeliveryAddress] ON
GO

INSERT INTO [dbo].[DeliveryAddress] ([DeliveryAddressId], [CustomerId], [DeliveryName], [Default], [Province], [Area], [Street], [DetailAddress], [TelNum], [Postcode]) VALUES (N'1', N'1', N'张云鹏', N'0', N'重庆市', N' 巴南区', N'花溪街道', N'理工大学', N'15223246130', NULL)
GO

INSERT INTO [dbo].[DeliveryAddress] ([DeliveryAddressId], [CustomerId], [DeliveryName], [Default], [Province], [Area], [Street], [DetailAddress], [TelNum], [Postcode]) VALUES (N'2', N'1', N'李雷', N'1', N'重庆市', N' 巴南区', N'花溪街道', N'理工大学', N'123456789', NULL)
GO

INSERT INTO [dbo].[DeliveryAddress] ([DeliveryAddressId], [CustomerId], [DeliveryName], [Default], [Province], [Area], [Street], [DetailAddress], [TelNum], [Postcode]) VALUES (N'3', N'3', N'刘小宇', N'1', N'重庆市', N' 巴南区', N'花溪街道', N'理工大学', N'123456789', NULL)
GO

INSERT INTO [dbo].[DeliveryAddress] ([DeliveryAddressId], [CustomerId], [DeliveryName], [Default], [Province], [Area], [Street], [DetailAddress], [TelNum], [Postcode]) VALUES (N'4', N'5', N'张云鹏', N'1', N'重庆市', N' 巴南区', N'花溪街道', N'重庆理工大学', N'15223246130', NULL)
GO

SET IDENTITY_INSERT [dbo].[DeliveryAddress] OFF
GO


-- ----------------------------
-- Table structure for Evaluation
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Evaluation]') AND type IN ('U'))
	DROP TABLE [dbo].[Evaluation]
GO

CREATE TABLE [dbo].[Evaluation] (
  [EvaluationId] int  IDENTITY(1,1) NOT NULL,
  [OrderId] int  NOT NULL,
  [CustomerId] int  NOT NULL,
  [AdminId] int  NULL,
  [Evaluate] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Reply] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Evaluation] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Evaluation
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Evaluation] ON
GO

INSERT INTO [dbo].[Evaluation] ([EvaluationId], [OrderId], [CustomerId], [AdminId], [Evaluate], [Reply]) VALUES (N'1', N'1', N'1', N'1', N'1234567', N'fasdfrq')
GO

INSERT INTO [dbo].[Evaluation] ([EvaluationId], [OrderId], [CustomerId], [AdminId], [Evaluate], [Reply]) VALUES (N'2', N'1', N'1', N'1', N'safdaqwr', N'asfdafxz')
GO

INSERT INTO [dbo].[Evaluation] ([EvaluationId], [OrderId], [CustomerId], [AdminId], [Evaluate], [Reply]) VALUES (N'3', N'1', N'1', NULL, N'124325215', NULL)
GO

INSERT INTO [dbo].[Evaluation] ([EvaluationId], [OrderId], [CustomerId], [AdminId], [Evaluate], [Reply]) VALUES (N'4', N'1', N'1', NULL, N'qr', NULL)
GO

INSERT INTO [dbo].[Evaluation] ([EvaluationId], [OrderId], [CustomerId], [AdminId], [Evaluate], [Reply]) VALUES (N'5', N'1', N'1', NULL, N'1234125', NULL)
GO

INSERT INTO [dbo].[Evaluation] ([EvaluationId], [OrderId], [CustomerId], [AdminId], [Evaluate], [Reply]) VALUES (N'6', N'9', N'1', N'1', N'1423421', N'1234125215')
GO

SET IDENTITY_INSERT [dbo].[Evaluation] OFF
GO


-- ----------------------------
-- Table structure for Goods
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Goods]') AND type IN ('U'))
	DROP TABLE [dbo].[Goods]
GO

CREATE TABLE [dbo].[Goods] (
  [GoodsId] int  IDENTITY(1,1) NOT NULL,
  [GoodsName] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Detail] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Configuration] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [InstallWay] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Type] int  NOT NULL,
  [TotalSales] int  NOT NULL
)
GO

ALTER TABLE [dbo].[Goods] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Goods
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Goods] ON
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'1', N'仙剑奇侠传6', N'                                                                                                                                                                                                                                                                                                                                        
            
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        ', NULL, NULL, N'1', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'2', N'我的世界', N'                                                    
            
        
        
        ', NULL, NULL, N'1', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'3', N'古墓丽影：崛起', N'                                                                            
            
        
        
        
        
        ', NULL, NULL, N'1', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'4', N'侠客风云传', N'                                                                
            
        
        
        
        ', NULL, NULL, N'1', N'1')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'5', N'洛川群侠传', N'                                                                
            
        
        
        
        ', NULL, NULL, N'1', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'6', N'侠盗猎车手5 GTA5 PC版 中文', N'                            
            
        ', NULL, NULL, N'1', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'7', N'三国志13', N'                            
            
        ', NULL, NULL, N'1', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'8', N'古剑奇谭', N'                                        
            
        
        ', NULL, NULL, N'1', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'9', N'英雄联盟（LOL）官方直充', N'                
            ', NULL, NULL, N'2', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'10', N'英雄无敌7', N'                            
            
        ', NULL, NULL, N'1', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'11', N'天龙八部', N'                
            ', NULL, NULL, N'2', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'12', N'腾讯Q币卡 官方卡密', N'                
            ', NULL, NULL, N'2', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'13', N'龙之谷', N'                            
            
        ', NULL, NULL, N'2', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'14', N'凌波丽 可动粘土人 预定', N'                            
            
        ', NULL, NULL, N'3', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'15', N'初音未来 赛车娘 手办预定', N'                                        
            
        
        ', NULL, NULL, N'3', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'16', N'忍野忍 小忍 浴缸 手办预', N'                                                    
            
        
        
        ', NULL, NULL, N'3', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'17', N'毛瑟98K 1/8 手办 预定', N'                                        
            
        
        ', NULL, NULL, N'3', N'0')
GO

INSERT INTO [dbo].[Goods] ([GoodsId], [GoodsName], [Detail], [Configuration], [InstallWay], [Type], [TotalSales]) VALUES (N'18', N'凰铃音 手办 预定', N'                                        
            
        
        ', NULL, NULL, N'3', N'0')
GO

SET IDENTITY_INSERT [dbo].[Goods] OFF
GO


-- ----------------------------
-- Table structure for Invoice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice]') AND type IN ('U'))
	DROP TABLE [dbo].[Invoice]
GO

CREATE TABLE [dbo].[Invoice] (
  [InvoiceId] int  IDENTITY(1,1) NOT NULL,
  [OrderId] int  NOT NULL,
  [AdminId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[Invoice] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Invoice
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Invoice] ON
GO

INSERT INTO [dbo].[Invoice] ([InvoiceId], [OrderId], [AdminId]) VALUES (N'1', N'1', N'1')
GO

INSERT INTO [dbo].[Invoice] ([InvoiceId], [OrderId], [AdminId]) VALUES (N'2', N'2', N'1')
GO

INSERT INTO [dbo].[Invoice] ([InvoiceId], [OrderId], [AdminId]) VALUES (N'3', N'6', N'2')
GO

INSERT INTO [dbo].[Invoice] ([InvoiceId], [OrderId], [AdminId]) VALUES (N'4', N'9', N'1')
GO

SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO


-- ----------------------------
-- Table structure for Menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Menu]') AND type IN ('U'))
	DROP TABLE [dbo].[Menu]
GO

CREATE TABLE [dbo].[Menu] (
  [MenuId] uniqueidentifier  NOT NULL,
  [Name] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Icon] image  NULL,
  [Url] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Code] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParentId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[Menu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Menu
-- ----------------------------
INSERT INTO [dbo].[Menu]  VALUES (N'DA156317-5B4F-40A6-8F02-0559BC61F881', N'发货单列表', NULL, N'/Order/InvoiceList', N'OrderCenter.InvoiceList', N'785D7F7C-8B97-4471-89BF-F67D570CC7C8')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'FE84F6E8-D356-4462-99A4-0988826540FF', N'用户评论', NULL, N'/Goods/Evaluation', N'GoodsCenter.CustomerComments', N'11211844-8EFC-40D2-B725-F5AA067E037D')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'9BC7DBCC-9B00-4768-9F1E-22DE1C44C844', N'仓库日志', NULL, N'/Warehouse/StockLog', N'WarehouseCenter.WarehouseLog', N'0E79F882-042F-4B9B-A987-45F4CF7C7B37')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'029CC0D4-D98C-424E-B237-2E8608095743', N'管理员列表', NULL, N'/Admin/AdminList', N'PermissionsCenter.AdminList', N'8B78D804-0EBE-46BE-8858-8428884DC618')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'0E79F882-042F-4B9B-A987-45F4CF7C7B37', N'仓库中心', NULL, N'', N'WarehouseCenter', N'00000000-0000-0000-0000-000000000000')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'7624EB83-702B-44E6-AD92-4F867076544D', N'管理员日志', NULL, N'/Admin/AdminLog', N'PermissionsCenter.AdminLog', N'8B78D804-0EBE-46BE-8858-8428884DC618')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'352EA4C8-84C0-4264-B051-5824B21424CE', N'订单列表', NULL, N'/Order/OrderList', N'OrderCenter.OrderList', N'785D7F7C-8B97-4471-89BF-F67D570CC7C8')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'8B78D804-0EBE-46BE-8858-8428884DC618', N'权限中心', NULL, N'', N'PermissionsCenter', N'00000000-0000-0000-0000-000000000000')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'9237761F-C066-496F-9134-904D2A3A96CB', N'仓库列表', NULL, N'/Warehouse/WarehouseList', N'WarehouseCenter.WarehouseList', N'0E79F882-042F-4B9B-A987-45F4CF7C7B37')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'D38434DC-A390-423D-88AB-A5F55204FD9D', N'角色列表', NULL, N'/Admin/RoleList', N'PermissionsCenter.RoleList', N'8B78D804-0EBE-46BE-8858-8428884DC618')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'4A88C802-33D5-4850-9940-C1182253EB7D', N'商品列表', NULL, N'/Goods/GoodsList', N'GoodsCenter.GoodsList', N'11211844-8EFC-40D2-B725-F5AA067E037D')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'11211844-8EFC-40D2-B725-F5AA067E037D', N'商品中心', NULL, N'', N'GoodsCenter', N'00000000-0000-0000-0000-000000000000')
GO

INSERT INTO [dbo].[Menu]  VALUES (N'785D7F7C-8B97-4471-89BF-F67D570CC7C8', N'订单中心', NULL, N'', N'OrderCenter', N'00000000-0000-0000-0000-000000000000')
GO


-- ----------------------------
-- Table structure for Orders
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type IN ('U'))
	DROP TABLE [dbo].[Orders]
GO

CREATE TABLE [dbo].[Orders] (
  [OrderId] int  IDENTITY(1,1) NOT NULL,
  [GoodsId] int  NOT NULL,
  [CustomerId] int  NOT NULL,
  [VersionId] int  NOT NULL,
  [WarehouseId] int  NOT NULL,
  [OrderGoodsNumber] int  NOT NULL,
  [Price] real  NOT NULL,
  [OrderStatus] int  NOT NULL,
  [OrderTime] datetime  NOT NULL,
  [Express] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [SellerMessage] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [GoodsName] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [VersionName] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [DeliveryName] nvarchar(10) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [TelNum] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Province] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Area] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Street] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [DetailAddress] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Orders] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Orders
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Orders] ON
GO

INSERT INTO [dbo].[Orders] ([OrderId], [GoodsId], [CustomerId], [VersionId], [WarehouseId], [OrderGoodsNumber], [Price], [OrderStatus], [OrderTime], [Express], [SellerMessage], [GoodsName], [VersionName], [DeliveryName], [TelNum], [Province], [Area], [Street], [DetailAddress]) VALUES (N'1', N'8', N'1', N'8', N'2', N'1', N'123', N'5', N'2017-04-06 12:40:17.897', NULL, NULL, N'古剑奇谭', N'PC版', N'张云鹏', N'15223246130', N'重庆市', N' 巴南区', N'花溪街道', N'理工大学')
GO

INSERT INTO [dbo].[Orders] ([OrderId], [GoodsId], [CustomerId], [VersionId], [WarehouseId], [OrderGoodsNumber], [Price], [OrderStatus], [OrderTime], [Express], [SellerMessage], [GoodsName], [VersionName], [DeliveryName], [TelNum], [Province], [Area], [Street], [DetailAddress]) VALUES (N'2', N'7', N'1', N'7', N'2', N'1', N'123', N'2', N'2017-04-06 12:40:30.437', NULL, NULL, N'三国志13', N'PC版', N'李雷', N'123456789', N'重庆市', N' 巴南区', N'花溪街道', N'理工大学')
GO

INSERT INTO [dbo].[Orders] ([OrderId], [GoodsId], [CustomerId], [VersionId], [WarehouseId], [OrderGoodsNumber], [Price], [OrderStatus], [OrderTime], [Express], [SellerMessage], [GoodsName], [VersionName], [DeliveryName], [TelNum], [Province], [Area], [Street], [DetailAddress]) VALUES (N'5', N'1', N'3', N'1', N'1', N'1', N'123', N'1', N'2017-04-08 15:07:05.027', NULL, NULL, N'仙剑奇侠传6', N'普通版', N'刘小宇', N'123456789', N'重庆市', N' 巴南区', N'花溪街道', N'理工大学')
GO

INSERT INTO [dbo].[Orders] ([OrderId], [GoodsId], [CustomerId], [VersionId], [WarehouseId], [OrderGoodsNumber], [Price], [OrderStatus], [OrderTime], [Express], [SellerMessage], [GoodsName], [VersionName], [DeliveryName], [TelNum], [Province], [Area], [Street], [DetailAddress]) VALUES (N'6', N'8', N'5', N'8', N'2', N'1', N'123', N'2', N'2017-04-08 23:50:35.357', NULL, NULL, N'古剑奇谭', N'PC版', N'张云鹏', N'15223246130', N'重庆市', N' 巴南区', N'花溪街道', N'重庆理工大学')
GO

INSERT INTO [dbo].[Orders] ([OrderId], [GoodsId], [CustomerId], [VersionId], [WarehouseId], [OrderGoodsNumber], [Price], [OrderStatus], [OrderTime], [Express], [SellerMessage], [GoodsName], [VersionName], [DeliveryName], [TelNum], [Province], [Area], [Street], [DetailAddress]) VALUES (N'7', N'4', N'1', N'4', N'3', N'1', N'123', N'0', N'2017-04-09 15:38:25.187', NULL, NULL, N'侠客风云传', N'PC版', N'张云鹏', N'15223246130', N'重庆市', N' 巴南区', N'花溪街道', N'理工大学')
GO

INSERT INTO [dbo].[Orders] ([OrderId], [GoodsId], [CustomerId], [VersionId], [WarehouseId], [OrderGoodsNumber], [Price], [OrderStatus], [OrderTime], [Express], [SellerMessage], [GoodsName], [VersionName], [DeliveryName], [TelNum], [Province], [Area], [Street], [DetailAddress]) VALUES (N'8', N'4', N'1', N'4', N'3', N'1', N'123', N'1', N'2017-04-09 15:38:25.887', NULL, NULL, N'侠客风云传', N'PC版', N'张云鹏', N'15223246130', N'重庆市', N' 巴南区', N'花溪街道', N'理工大学')
GO

INSERT INTO [dbo].[Orders] ([OrderId], [GoodsId], [CustomerId], [VersionId], [WarehouseId], [OrderGoodsNumber], [Price], [OrderStatus], [OrderTime], [Express], [SellerMessage], [GoodsName], [VersionName], [DeliveryName], [TelNum], [Province], [Area], [Street], [DetailAddress]) VALUES (N'9', N'4', N'1', N'4', N'3', N'1', N'123', N'5', N'2017-04-09 15:38:26.527', NULL, NULL, N'侠客风云传', N'PC版', N'张云鹏', N'15223246130', N'重庆市', N' 巴南区', N'花溪街道', N'理工大学')
GO

SET IDENTITY_INSERT [dbo].[Orders] OFF
GO


-- ----------------------------
-- Table structure for Permissions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Permissions]') AND type IN ('U'))
	DROP TABLE [dbo].[Permissions]
GO

CREATE TABLE [dbo].[Permissions] (
  [PermissionId] uniqueidentifier  NOT NULL,
  [Name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Code] varchar(500) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [CreationTime] datetime  NOT NULL,
  [PermissionPId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[Permissions] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Permissions
-- ----------------------------
INSERT INTO [dbo].[Permissions]  VALUES (N'FBE0E422-44F7-486B-A909-035BF33E6FA0', N'添加角色', N'PermissionsCenter.RoleList.AddRole', N'2017-04-05 22:41:02.870', N'4508DDFE-D21E-45F7-9877-80C986BB9EEA')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'02865220-0175-44EB-8105-0D2BAD4A36CE', N'删除评论', N'GoodsCenter.CustomerComments.Delete', N'2017-04-05 22:41:02.767', N'28547D86-EEC7-4D9E-BE1B-C2A117E06BDC')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'11496F50-5EF6-4120-9706-11821DFF64DF', N'仓库日志', N'WarehouseCenter.WarehouseLog', N'2017-04-05 22:41:02.797', N'29800518-B9FA-4233-8CFC-75AE89D20C52')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'CB911662-BF9F-4E4A-B0D3-20840710D80D', N'回复评论', N'GoodsCenter.CustomerComments.Reply', N'2017-04-05 22:41:02.750', N'28547D86-EEC7-4D9E-BE1B-C2A117E06BDC')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'1E506118-0E2B-4F19-82B2-48773511F735', N'生成发货单', N'OrderCenter.OrderList.GenerateInvoice', N'2017-04-05 22:41:02.913', N'C88064DA-449D-48A4-A7A0-4A57E3F45C70')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'F58F2EC5-D8E4-4EDB-A4C7-4980BADC68CA', N'添加管理员', N'PermissionsCenter.AdminList.AddAdmin', N'2017-04-05 22:41:02.820', N'4508DDFE-D21E-45F7-9877-80C986BB9EEA')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'C88064DA-449D-48A4-A7A0-4A57E3F45C70', N'订单中心', N'OrderCenter', N'2017-04-05 22:41:02.883', N'00000000-0000-0000-0000-000000000000')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'BC18C019-EE6F-44CC-942E-5222F1EBE27A', N'查看发货单', N'OrderCenter.InvoiceList', N'2017-04-05 22:41:02.920', N'C88064DA-449D-48A4-A7A0-4A57E3F45C70')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'29800518-B9FA-4233-8CFC-75AE89D20C52', N'仓库中心', N'WarehouseCenter', N'2017-04-05 22:41:02.790', N'00000000-0000-0000-0000-000000000000')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'04ECE922-8108-4BB7-A35C-80BF351383E8', N'删除角色', N'PermissionsCenter.RoleList.DeleteRole', N'2017-04-05 22:41:02.877', N'4508DDFE-D21E-45F7-9877-80C986BB9EEA')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'4508DDFE-D21E-45F7-9877-80C986BB9EEA', N'权限中心', N'PermissionsCenter', N'2017-04-05 22:41:02.813', N'00000000-0000-0000-0000-000000000000')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'498087BC-F1B1-4C85-B0B9-8378FE0F79F6', N'编辑管理员', N'PermissionsCenter.AdminList.EditAdmin', N'2017-04-05 22:41:02.843', N'4508DDFE-D21E-45F7-9877-80C986BB9EEA')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'2B4D1A69-9648-4D67-9C41-9F3ED45E1C0A', N'分配权限', N'PermissionsCenter.AdminList.AssignPermissions', N'2017-04-05 22:41:02.833', N'4508DDFE-D21E-45F7-9877-80C986BB9EEA')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'A9569941-4A20-499E-9809-B2111A38EADA', N'添加商品', N'GoodsCenter.GoodsList.AddGoods', N'2017-04-05 22:41:02.710', N'28547D86-EEC7-4D9E-BE1B-C2A117E06BDC')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'D4DBF0DD-807C-44FB-B684-B5A07D405D9F', N'查看订单', N'OrderCenter.OrderList.OrderList', N'2017-04-05 22:41:02.890', N'C88064DA-449D-48A4-A7A0-4A57E3F45C70')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'42DA5541-D0F7-4D16-B63D-BBFACA278C1C', N'删除管理员', N'PermissionsCenter.AdminList.DeleteAdmin', N'2017-04-05 22:41:02.850', N'4508DDFE-D21E-45F7-9877-80C986BB9EEA')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'4E1A8189-1A89-4F05-BA0C-BEE6A5D4F841', N'上架商品', N'GoodsCenter.GoodsList.ShelvesGoods', N'2017-04-05 22:41:02.740', N'28547D86-EEC7-4D9E-BE1B-C2A117E06BDC')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'7D4E9994-DC21-4170-A5F7-BF03AB743800', N'管理员日志', N'PermissionsCenter.AdminLog', N'2017-04-05 22:41:02.860', N'00000000-0000-0000-0000-000000000000')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'28547D86-EEC7-4D9E-BE1B-C2A117E06BDC', N'商品中心', N'GoodsCenter', N'2017-04-05 22:41:02.687', N'00000000-0000-0000-0000-000000000000')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'F22071F6-F12C-4626-BA02-C2EA0F1B2E55', N'修改商品', N'GoodsCenter.GoodsList.ModifyGoods', N'2017-04-05 22:41:02.727', N'28547D86-EEC7-4D9E-BE1B-C2A117E06BDC')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'FDE896CF-6453-4975-8556-C6155C4B8E7D', N'创建仓库', N'WarehouseCenter.CreatWarehouse', N'2017-04-05 22:41:02.807', N'29800518-B9FA-4233-8CFC-75AE89D20C52')
GO

INSERT INTO [dbo].[Permissions]  VALUES (N'30D57272-CD66-45EC-BBD6-F6FC169C8B75', N'发货', N'OrderCenter.InvoiceList.Deliver', N'2017-04-05 22:41:02.930', N'C88064DA-449D-48A4-A7A0-4A57E3F45C70')
GO


-- ----------------------------
-- Table structure for RolePermissions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[RolePermissions]') AND type IN ('U'))
	DROP TABLE [dbo].[RolePermissions]
GO

CREATE TABLE [dbo].[RolePermissions] (
  [RoleId] uniqueidentifier  NOT NULL,
  [PermissionId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[RolePermissions] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of RolePermissions
-- ----------------------------
INSERT INTO [dbo].[RolePermissions]  VALUES (N'58323E28-B814-42CC-8D96-7DA9718FB1BA', N'11496F50-5EF6-4120-9706-11821DFF64DF')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'58323E28-B814-42CC-8D96-7DA9718FB1BA', N'1E506118-0E2B-4F19-82B2-48773511F735')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'58323E28-B814-42CC-8D96-7DA9718FB1BA', N'C88064DA-449D-48A4-A7A0-4A57E3F45C70')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'58323E28-B814-42CC-8D96-7DA9718FB1BA', N'29800518-B9FA-4233-8CFC-75AE89D20C52')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'58323E28-B814-42CC-8D96-7DA9718FB1BA', N'FDE896CF-6453-4975-8556-C6155C4B8E7D')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'58323E28-B814-42CC-8D96-7DA9718FB1BA', N'30D57272-CD66-45EC-BBD6-F6FC169C8B75')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'FBE0E422-44F7-486B-A909-035BF33E6FA0')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'02865220-0175-44EB-8105-0D2BAD4A36CE')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'11496F50-5EF6-4120-9706-11821DFF64DF')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'CB911662-BF9F-4E4A-B0D3-20840710D80D')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'29800518-B9FA-4233-8CFC-75AE89D20C52')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'4508DDFE-D21E-45F7-9877-80C986BB9EEA')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'A9569941-4A20-499E-9809-B2111A38EADA')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'4E1A8189-1A89-4F05-BA0C-BEE6A5D4F841')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'28547D86-EEC7-4D9E-BE1B-C2A117E06BDC')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'F22071F6-F12C-4626-BA02-C2EA0F1B2E55')
GO

INSERT INTO [dbo].[RolePermissions]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'FDE896CF-6453-4975-8556-C6155C4B8E7D')
GO


-- ----------------------------
-- Table structure for Roles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type IN ('U'))
	DROP TABLE [dbo].[Roles]
GO

CREATE TABLE [dbo].[Roles] (
  [RoleId] uniqueidentifier  NOT NULL,
  [Name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Code] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [CreationTime] datetime  NOT NULL
)
GO

ALTER TABLE [dbo].[Roles] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Roles
-- ----------------------------
INSERT INTO [dbo].[Roles]  VALUES (N'58323E28-B814-42CC-8D96-7DA9718FB1BA', N'仓库管理员', N'', N'2017-04-07 17:26:44.113')
GO

INSERT INTO [dbo].[Roles]  VALUES (N'DAAD1435-EA42-47AE-AF6F-F9807F5902B2', N'销售管理员', N'', N'2017-04-05 22:41:03.060')
GO


-- ----------------------------
-- Table structure for Screenshot
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Screenshot]') AND type IN ('U'))
	DROP TABLE [dbo].[Screenshot]
GO

CREATE TABLE [dbo].[Screenshot] (
  [ScreenshotId] int  IDENTITY(1,1) NOT NULL,
  [GoodsId] int  NOT NULL,
  [Screenshot] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Screenshot] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Screenshot
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Screenshot] ON
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'31', N'1', N'http://123.207.242.177:8000/Screenshots/2017-04-07 16.35.17.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'32', N'1', N'http://123.207.242.177:8000/Screenshots/2017-04-07 16.35.17.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'33', N'1', N'http://123.207.242.177:8000/Screenshots/2017-04-07 16.35.18.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'34', N'2', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.21.36.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'35', N'2', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.21.36.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'36', N'2', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.21.37.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'37', N'3', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.23.06.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'38', N'3', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.23.06.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'39', N'3', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.23.07.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'40', N'4', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.29.56.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'41', N'4', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.29.57.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'42', N'4', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.29.57.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'43', N'5', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.31.33.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'44', N'5', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.31.33.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'45', N'5', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.31.34.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'46', N'6', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.32.57.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'47', N'6', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.32.58.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'48', N'6', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.32.58.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'49', N'7', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.34.17.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'50', N'7', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.34.18.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'51', N'7', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.34.18.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'52', N'8', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.35.35.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'53', N'8', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.35.35.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'54', N'8', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.35.36.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'55', N'10', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.37.46.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'56', N'10', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.37.46.jpg')
GO

INSERT INTO [dbo].[Screenshot] ([ScreenshotId], [GoodsId], [Screenshot]) VALUES (N'57', N'10', N'http://123.207.242.177:8000/Screenshots/2017-04-09 00.37.47.jpg')
GO

SET IDENTITY_INSERT [dbo].[Screenshot] OFF
GO


-- ----------------------------
-- Table structure for ShoppingCars
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCars]') AND type IN ('U'))
	DROP TABLE [dbo].[ShoppingCars]
GO

CREATE TABLE [dbo].[ShoppingCars] (
  [ShoppingCarId] int  IDENTITY(1,1) NOT NULL,
  [CustomerId] int  NOT NULL,
  [GoodsId] int  NOT NULL,
  [VersionId] int  NOT NULL,
  [ShoppingCarGoodsNumber] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ShoppingCars] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ShoppingCars
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ShoppingCars] ON
GO

INSERT INTO [dbo].[ShoppingCars] ([ShoppingCarId], [CustomerId], [GoodsId], [VersionId], [ShoppingCarGoodsNumber]) VALUES (N'1', N'1', N'7', N'7', N'1')
GO

SET IDENTITY_INSERT [dbo].[ShoppingCars] OFF
GO


-- ----------------------------
-- Table structure for StockLog
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLog]') AND type IN ('U'))
	DROP TABLE [dbo].[StockLog]
GO

CREATE TABLE [dbo].[StockLog] (
  [StockLogId] int  IDENTITY(1,1) NOT NULL,
  [AdminId] int  NOT NULL,
  [WarehouseId] int  NOT NULL,
  [GoodsId] int  NOT NULL,
  [OrderId] int  NOT NULL,
  [VersionId] int  NOT NULL,
  [OperationRecord] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OperationTime] datetime  NOT NULL,
  [Stock] int  NOT NULL
)
GO

ALTER TABLE [dbo].[StockLog] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of StockLog
-- ----------------------------
SET IDENTITY_INSERT [dbo].[StockLog] ON
GO

INSERT INTO [dbo].[StockLog] ([StockLogId], [AdminId], [WarehouseId], [GoodsId], [OrderId], [VersionId], [OperationRecord], [OperationTime], [Stock]) VALUES (N'1', N'1', N'2', N'8', N'1', N'8', N'发货', N'2017-04-06 12:59:13.340', N'-1')
GO

INSERT INTO [dbo].[StockLog] ([StockLogId], [AdminId], [WarehouseId], [GoodsId], [OrderId], [VersionId], [OperationRecord], [OperationTime], [Stock]) VALUES (N'2', N'1', N'3', N'4', N'9', N'4', N'发货', N'2017-04-09 15:41:25.957', N'-1')
GO

SET IDENTITY_INSERT [dbo].[StockLog] OFF
GO


-- ----------------------------
-- Table structure for Users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type IN ('U'))
	DROP TABLE [dbo].[Users]
GO

CREATE TABLE [dbo].[Users] (
  [UserId] int  IDENTITY(1,1) NOT NULL,
  [UserName] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [PhoneNumber] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [Password] varchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [CreationTime] datetime  NOT NULL,
  [Head] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [RealName] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Users] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Users
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Users] ON
GO

INSERT INTO [dbo].[Users] ([UserId], [UserName], [PhoneNumber], [Password], [CreationTime], [Head], [RealName]) VALUES (N'1', N'Admin', N'15223246130', N'123456', N'2017-04-05 22:41:02.097', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([UserId], [UserName], [PhoneNumber], [Password], [CreationTime], [Head], [RealName]) VALUES (N'2', N'Cloudy', N'123456789', N'123456', N'2017-04-05 22:41:02.643', N'/Images/CustomerHead/2017-04-09 13.58.06.jpg', N'张云鹏')
GO

INSERT INTO [dbo].[Users] ([UserId], [UserName], [PhoneNumber], [Password], [CreationTime], [Head], [RealName]) VALUES (N'3', N'jack', N'1234587611', N'123456', N'2017-04-06 13:54:54.257', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([UserId], [UserName], [PhoneNumber], [Password], [CreationTime], [Head], [RealName]) VALUES (N'4', N'nick', NULL, N'123456', N'2017-04-06 18:49:58.353', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([UserId], [UserName], [PhoneNumber], [Password], [CreationTime], [Head], [RealName]) VALUES (N'5', N'刘小宇', NULL, N'123456', N'2017-04-08 15:03:56.313', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([UserId], [UserName], [PhoneNumber], [Password], [CreationTime], [Head], [RealName]) VALUES (N'6', N'1234', NULL, N'123456', N'2017-04-08 15:15:15.163', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([UserId], [UserName], [PhoneNumber], [Password], [CreationTime], [Head], [RealName]) VALUES (N'7', N'15415151243', NULL, N'123456', N'2017-04-08 23:38:11.630', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([UserId], [UserName], [PhoneNumber], [Password], [CreationTime], [Head], [RealName]) VALUES (N'8', N'class', N'1531661641351', N'123456', N'2017-04-09 11:55:29.610', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([UserId], [UserName], [PhoneNumber], [Password], [CreationTime], [Head], [RealName]) VALUES (N'9', N'waly', N'154316416', N'123456', N'2017-04-09 12:54:55.903', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([UserId], [UserName], [PhoneNumber], [Password], [CreationTime], [Head], [RealName]) VALUES (N'10', N'张云鹏', N'12432152135', N'123456', N'2017-04-09 15:49:23.690', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[Users] OFF
GO


-- ----------------------------
-- Table structure for Versions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Versions]') AND type IN ('U'))
	DROP TABLE [dbo].[Versions]
GO

CREATE TABLE [dbo].[Versions] (
  [VersionId] int  IDENTITY(1,1) NOT NULL,
  [GoodsId] int  NOT NULL,
  [WarehouseId] int  NOT NULL,
  [VersionName] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ActivationTimes] int  NULL,
  [VersionImage] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Price] real  NOT NULL,
  [Stock] int  NOT NULL,
  [Sell] int  NOT NULL,
  [SalesVolume] int  NOT NULL
)
GO

ALTER TABLE [dbo].[Versions] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Versions
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Versions] ON
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'1', N'1', N'1', N'普通版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-05 22.52.43.jpg', N'123', N'100', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'2', N'2', N'1', N'PC版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 00.27.07.jpg', N'21', N'131', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'3', N'3', N'1', N'PC版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 00.28.20.jpg', N'123', N'122', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'4', N'4', N'3', N'PC版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 00.29.33.jpg', N'123', N'1110', N'1', N'1')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'5', N'5', N'1', N'PC版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 00.31.45.jpg', N'123', N'122', N'1', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'6', N'6', N'2', N'PC版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 00.33.18.jpg', N'123', N'100', N'1', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'7', N'7', N'2', N'PC版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 00.34.09.jpg', N'123', N'100', N'1', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'8', N'8', N'2', N'PC版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 12.08.35.jpg', N'123', N'1111', N'1', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'9', N'9', N'1', N'PC版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 00.36.21.jpg', N'12', N'100', N'1', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'10', N'10', N'2', N'PC版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 11.32.56.jpg', N'123', N'1111', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'11', N'11', N'2', N'网页版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 11.44.58.jpg', N'123', N'100', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'12', N'12', N'3', N'游戏卡密', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 11.47.36.jpg', N'121', N'100', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'13', N'13', N'2', N'卡密', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 11.48.31.jpg', N'12', N'100', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'14', N'14', N'3', N'普通版', N'1', N'http://123.207.242.177:8000/VersionImages/2017-04-06 11.50.03.jpg', N'123', N'100', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'15', N'15', N'3', N'普通版', NULL, N'http://123.207.242.177:8000/VersionImages/2017-04-06 11.56.13.jpg', N'123', N'1111', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'16', N'16', N'2', N'普通版', NULL, N'http://123.207.242.177:8000/VersionImages/2017-04-06 11.52.02.jpg', N'121', N'100', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'17', N'17', N'3', N'普通版', NULL, N'http://123.207.242.177:8000/VersionImages/2017-04-06 11.53.39.jpg', N'121', N'100', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'18', N'18', N'2', N'普通版', NULL, N'http://123.207.242.177:8000/VersionImages/2017-04-06 11.54.36.jpg', N'123', N'100', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'21', N'1', N'1', N'家庭版', NULL, N'http://123.207.242.177:8000/VersionImages/2017-04-05 22.52.43.jpg', N'100', N'12', N'0', N'0')
GO

INSERT INTO [dbo].[Versions] ([VersionId], [GoodsId], [WarehouseId], [VersionName], [ActivationTimes], [VersionImage], [Price], [Stock], [Sell], [SalesVolume]) VALUES (N'22', N'1', N'2', N'版本3', NULL, N'http://123.207.242.177:8000/VersionImages/2017-04-09 11.24.44.jpg', N'134', N'122', N'1', N'0')
GO

SET IDENTITY_INSERT [dbo].[Versions] OFF
GO


-- ----------------------------
-- Table structure for Warehouse
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Warehouse]') AND type IN ('U'))
	DROP TABLE [dbo].[Warehouse]
GO

CREATE TABLE [dbo].[Warehouse] (
  [WarehouseId] int  IDENTITY(1,1) NOT NULL,
  [WarehouseName] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [CreatTime] datetime  NOT NULL,
  [AdminId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[Warehouse] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Warehouse
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Warehouse] ON
GO

INSERT INTO [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [CreatTime], [AdminId]) VALUES (N'1', N'重庆仓库', N'2017-04-05 22:51:29.107', N'0')
GO

INSERT INTO [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [CreatTime], [AdminId]) VALUES (N'2', N'北京仓库', N'2017-04-05 22:51:39.173', N'0')
GO

INSERT INTO [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [CreatTime], [AdminId]) VALUES (N'3', N'上海仓库', N'2017-04-05 22:51:51.187', N'0')
GO

SET IDENTITY_INSERT [dbo].[Warehouse] OFF
GO


-- ----------------------------
-- Primary Key structure for table Admin
-- ----------------------------
ALTER TABLE [dbo].[Admin] ADD CONSTRAINT [PK_ADMIN] PRIMARY KEY CLUSTERED ([AdminId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table AdminLog
-- ----------------------------
ALTER TABLE [dbo].[AdminLog] ADD CONSTRAINT [PK_ADMINLOG] PRIMARY KEY CLUSTERED ([AdminLogId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table AdminPermissions
-- ----------------------------
ALTER TABLE [dbo].[AdminPermissions] ADD CONSTRAINT [PK_ADMINPERMISSIONS] PRIMARY KEY CLUSTERED ([PermissionId], [AdminId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table AdminRoles
-- ----------------------------
ALTER TABLE [dbo].[AdminRoles] ADD CONSTRAINT [PK_ADMINROLES] PRIMARY KEY CLUSTERED ([RoleId], [AdminId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Customers
-- ----------------------------
ALTER TABLE [dbo].[Customers] ADD CONSTRAINT [PK_CUSTOMERS] PRIMARY KEY CLUSTERED ([CustomerId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table DeliveryAddress
-- ----------------------------
ALTER TABLE [dbo].[DeliveryAddress] ADD CONSTRAINT [PK_DELIVERYADDRESS] PRIMARY KEY CLUSTERED ([DeliveryAddressId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Evaluation
-- ----------------------------
ALTER TABLE [dbo].[Evaluation] ADD CONSTRAINT [PK_EVALUATION] PRIMARY KEY CLUSTERED ([EvaluationId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Goods
-- ----------------------------
ALTER TABLE [dbo].[Goods] ADD CONSTRAINT [PK_GOODS] PRIMARY KEY CLUSTERED ([GoodsId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Invoice
-- ----------------------------
ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT [PK_INVOICE] PRIMARY KEY CLUSTERED ([InvoiceId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Menu
-- ----------------------------
ALTER TABLE [dbo].[Menu] ADD CONSTRAINT [PK_MENU] PRIMARY KEY CLUSTERED ([MenuId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Orders
-- ----------------------------
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED ([OrderId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Permissions
-- ----------------------------
ALTER TABLE [dbo].[Permissions] ADD CONSTRAINT [PK_PERMISSIONS] PRIMARY KEY CLUSTERED ([PermissionId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table RolePermissions
-- ----------------------------
ALTER TABLE [dbo].[RolePermissions] ADD CONSTRAINT [PK_ROLEPERMISSIONS] PRIMARY KEY CLUSTERED ([RoleId], [PermissionId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Roles
-- ----------------------------
ALTER TABLE [dbo].[Roles] ADD CONSTRAINT [PK_ROLES] PRIMARY KEY CLUSTERED ([RoleId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Screenshot
-- ----------------------------
ALTER TABLE [dbo].[Screenshot] ADD CONSTRAINT [PK_SCREENSHOT] PRIMARY KEY CLUSTERED ([ScreenshotId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table ShoppingCars
-- ----------------------------
ALTER TABLE [dbo].[ShoppingCars] ADD CONSTRAINT [PK_SHOPPINGCARS] PRIMARY KEY CLUSTERED ([ShoppingCarId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table StockLog
-- ----------------------------
ALTER TABLE [dbo].[StockLog] ADD CONSTRAINT [PK_STOCKLOG] PRIMARY KEY CLUSTERED ([StockLogId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Users
-- ----------------------------
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED ([UserId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Versions
-- ----------------------------
ALTER TABLE [dbo].[Versions] ADD CONSTRAINT [PK_VERSIONS] PRIMARY KEY CLUSTERED ([VersionId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Warehouse
-- ----------------------------
ALTER TABLE [dbo].[Warehouse] ADD CONSTRAINT [PK_WAREHOUSE] PRIMARY KEY CLUSTERED ([WarehouseId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table Admin
-- ----------------------------
ALTER TABLE [dbo].[Admin] ADD CONSTRAINT [FK_ADMIN_REFERENCE_USERS] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AdminLog
-- ----------------------------
ALTER TABLE [dbo].[AdminLog] ADD CONSTRAINT [FK_ADMINLOG_REFERENCE_ADMIN] FOREIGN KEY ([AdminId]) REFERENCES [dbo].[Admin] ([AdminId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AdminPermissions
-- ----------------------------
ALTER TABLE [dbo].[AdminPermissions] ADD CONSTRAINT [FK_ADMINPER_REFERENCE_PERMISSI] FOREIGN KEY ([PermissionId]) REFERENCES [dbo].[Permissions] ([PermissionId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[AdminPermissions] ADD CONSTRAINT [FK_ADMINPER_REFERENCE_ADMIN] FOREIGN KEY ([AdminId]) REFERENCES [dbo].[Admin] ([AdminId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AdminRoles
-- ----------------------------
ALTER TABLE [dbo].[AdminRoles] ADD CONSTRAINT [FK_ADMINROL_REFERENCE_ADMIN] FOREIGN KEY ([AdminId]) REFERENCES [dbo].[Admin] ([AdminId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[AdminRoles] ADD CONSTRAINT [FK_ADMINROL_REFERENCE_ROLES] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([RoleId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Customers
-- ----------------------------
ALTER TABLE [dbo].[Customers] ADD CONSTRAINT [FK_CUSTOMER_REFERENCE_USERS] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table DeliveryAddress
-- ----------------------------
ALTER TABLE [dbo].[DeliveryAddress] ADD CONSTRAINT [FK_DELIVERY_REFERENCE_CUSTOMER] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([CustomerId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Evaluation
-- ----------------------------
ALTER TABLE [dbo].[Evaluation] ADD CONSTRAINT [FK_EVALUATI_REFERENCE_ORDERS] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([OrderId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Evaluation] ADD CONSTRAINT [FK_EVALUATI_REFERENCE_CUSTOMER] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([CustomerId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Evaluation] ADD CONSTRAINT [FK_EVALUATI_REFERENCE_ADMIN] FOREIGN KEY ([AdminId]) REFERENCES [dbo].[Admin] ([AdminId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Invoice
-- ----------------------------
ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT [FK_INVOICE_REFERENCE_ORDERS] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([OrderId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT [FK_INVOICE_REFERENCE_ADMIN] FOREIGN KEY ([AdminId]) REFERENCES [dbo].[Admin] ([AdminId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Orders
-- ----------------------------
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_ORDERS_REFERENCE_CUSTOMER] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([CustomerId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_ORDERS_REFERENCE_GOODS] FOREIGN KEY ([GoodsId]) REFERENCES [dbo].[Goods] ([GoodsId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_ORDERS_REFERENCE_WAREHOUS] FOREIGN KEY ([WarehouseId]) REFERENCES [dbo].[Warehouse] ([WarehouseId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_ORDERS_REFERENCE_VERSIONS] FOREIGN KEY ([VersionId]) REFERENCES [dbo].[Versions] ([VersionId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table RolePermissions
-- ----------------------------
ALTER TABLE [dbo].[RolePermissions] ADD CONSTRAINT [FK_ROLEPERM_REFERENCE_ROLES] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([RoleId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[RolePermissions] ADD CONSTRAINT [FK_ROLEPERM_REFERENCE_PERMISSI] FOREIGN KEY ([PermissionId]) REFERENCES [dbo].[Permissions] ([PermissionId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Screenshot
-- ----------------------------
ALTER TABLE [dbo].[Screenshot] ADD CONSTRAINT [FK_SCREENSH_REFERENCE_GOODS] FOREIGN KEY ([GoodsId]) REFERENCES [dbo].[Goods] ([GoodsId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ShoppingCars
-- ----------------------------
ALTER TABLE [dbo].[ShoppingCars] ADD CONSTRAINT [FK_SHOPPING_REFERENCE_CUSTOMER] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([CustomerId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[ShoppingCars] ADD CONSTRAINT [FK_SHOPPING_REFERENCE_VERSIONS] FOREIGN KEY ([VersionId]) REFERENCES [dbo].[Versions] ([VersionId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[ShoppingCars] ADD CONSTRAINT [FK_SHOPPING_REFERENCE_GOODS] FOREIGN KEY ([GoodsId]) REFERENCES [dbo].[Goods] ([GoodsId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table StockLog
-- ----------------------------
ALTER TABLE [dbo].[StockLog] ADD CONSTRAINT [FK_STOCKLOG_REFERENCE_GOODS] FOREIGN KEY ([GoodsId]) REFERENCES [dbo].[Goods] ([GoodsId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[StockLog] ADD CONSTRAINT [FK_STOCKLOG_REFERENCE_ADMIN] FOREIGN KEY ([AdminId]) REFERENCES [dbo].[Admin] ([AdminId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[StockLog] ADD CONSTRAINT [FK_STOCKLOG_REFERENCE_WAREHOUS] FOREIGN KEY ([WarehouseId]) REFERENCES [dbo].[Warehouse] ([WarehouseId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[StockLog] ADD CONSTRAINT [FK_STOCKLOG_REFERENCE_ORDERS] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([OrderId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[StockLog] ADD CONSTRAINT [FK_STOCKLOG_REFERENCE_VERSIONS] FOREIGN KEY ([VersionId]) REFERENCES [dbo].[Versions] ([VersionId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Versions
-- ----------------------------
ALTER TABLE [dbo].[Versions] ADD CONSTRAINT [FK_VERSIONS_REFERENCE_WAREHOUS] FOREIGN KEY ([WarehouseId]) REFERENCES [dbo].[Warehouse] ([WarehouseId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Versions] ADD CONSTRAINT [FK_VERSIONS_REFERENCE_GOODS] FOREIGN KEY ([GoodsId]) REFERENCES [dbo].[Goods] ([GoodsId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

