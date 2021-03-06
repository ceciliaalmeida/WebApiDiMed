USE [master]
GO
/****** Object:  Database [DBNicaMed]    Script Date: 02/05/2018 23:12:42 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'DBNicaMed')
BEGIN
CREATE DATABASE [DBNicaMed] ON  PRIMARY 
( NAME = N'DBNicaMed', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLSERVER2008R2\MSSQL\DATA\DBNicaMed.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBNicaMed_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLSERVER2008R2\MSSQL\DATA\DBNicaMed_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [DBNicaMed] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBNicaMed].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBNicaMed] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DBNicaMed] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DBNicaMed] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DBNicaMed] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DBNicaMed] SET ARITHABORT OFF
GO
ALTER DATABASE [DBNicaMed] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DBNicaMed] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DBNicaMed] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DBNicaMed] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DBNicaMed] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DBNicaMed] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DBNicaMed] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DBNicaMed] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DBNicaMed] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DBNicaMed] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DBNicaMed] SET  DISABLE_BROKER
GO
ALTER DATABASE [DBNicaMed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DBNicaMed] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DBNicaMed] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DBNicaMed] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DBNicaMed] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DBNicaMed] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DBNicaMed] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DBNicaMed] SET  READ_WRITE
GO
ALTER DATABASE [DBNicaMed] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DBNicaMed] SET  MULTI_USER
GO
ALTER DATABASE [DBNicaMed] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DBNicaMed] SET DB_CHAINING OFF
GO
USE [DBNicaMed]
GO
/****** Object:  StoredProcedure [dbo].[usp_DelTipoEspecialidad]    Script Date: 02/05/2018 23:12:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DelTipoEspecialidad]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DelTipoEspecialidad]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllTipoEspecialidad]    Script Date: 02/05/2018 23:12:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetAllTipoEspecialidad]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetAllTipoEspecialidad]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsTipoEspecialidad]    Script Date: 02/05/2018 23:12:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsTipoEspecialidad]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InsTipoEspecialidad]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdTipoEspecialidad]    Script Date: 02/05/2018 23:12:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdTipoEspecialidad]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_UpdTipoEspecialidad]
GO
/****** Object:  Table [dbo].[TBL_TIPO_ESPECIALIDAD]    Script Date: 02/05/2018 23:12:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_TIPO_ESPECIALIDAD]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_TIPO_ESPECIALIDAD]
GO
/****** Object:  Table [dbo].[TBL_TIPO_ESPECIALIDAD]    Script Date: 02/05/2018 23:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_TIPO_ESPECIALIDAD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_TIPO_ESPECIALIDAD](
	[TipoEspecialidadId] [int] IDENTITY(1,1) NOT NULL,
	[Desc_TipoEspecialidad] [nvarchar](100) NULL,
 CONSTRAINT [PK_TipoEspecialidadId] PRIMARY KEY CLUSTERED 
(
	[TipoEspecialidadId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdTipoEspecialidad]    Script Date: 02/05/2018 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdTipoEspecialidad]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_UpdTipoEspecialidad]
@Id int,
@Desc_TipoEspecialidad nvarchar(100)
as 
begin
	declare @Error int =0,@Mensaje varchar(max)=''Registro actualizado exitosamente''

	begin try
		update TBL_TIPO_ESPECIALIDAD
		set Desc_TipoEspecialidad = @Desc_TipoEspecialidad
		where TipoEspecialidadId = @Id
	end try
		BEGIN CATCH
	
	set @Error = 1
	set @Mensaje =''Error al actualizar el tipo de especialidad''
	
	END CATCH
	select @Error Error,@Mensaje Mensaje
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsTipoEspecialidad]    Script Date: 02/05/2018 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsTipoEspecialidad]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_InsTipoEspecialidad]
@Desc_TipoEspecialidad nvarchar (100)
as 
begin
	begin try
	declare @Error int =0,@Mensaje varchar(max)=''Registro insertado exitosamente''
	
	INSERT INTO TBL_TIPO_ESPECIALIDAD (Desc_TipoEspecialidad) VALUES (@Desc_TipoEspecialidad)
	end TRY
	BEGIN CATCH
	
	set @Error = 1
	set @Mensaje =''Error al registrar el tipo de especialidad''
	
	END CATCH
	select @Error Error,@Mensaje Mensaje
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllTipoEspecialidad]    Script Date: 02/05/2018 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetAllTipoEspecialidad]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_GetAllTipoEspecialidad]
as 
begin
	select * from TBL_TIPO_ESPECIALIDAD
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DelTipoEspecialidad]    Script Date: 02/05/2018 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DelTipoEspecialidad]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_DelTipoEspecialidad]
@Id int
as 
begin
declare @Error int =0,@Mensaje varchar(max)=''Registro borrado exitosamente''

	begin try
	delete FROM TBL_TIPO_ESPECIALIDAD
	where TipoEspecialidadId = @Id
	end try
		BEGIN CATCH
	
	set @Error = 1
	set @Mensaje =''Error al borrar el tipo de especialidad''
	
	END CATCH
	select @Error Error,@Mensaje Mensaje
end
' 
END
GO
