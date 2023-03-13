USE [BDHIS_MINSA]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_OTRA_CONDICION]    Script Date: 30/07/2020 10:03:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_OTRA_CONDICION]') AND type in (N'U'))
DROP TABLE [dbo].[MAESTRO_HIS_OTRA_CONDICION]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_OTRA_CONDICION]    Script Date: 30/07/2020 10:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_OTRA_CONDICION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MAESTRO_HIS_OTRA_CONDICION](
	[Id_Otra_Condicion] [int] NOT NULL,
	[Descripcion_Otra_Condicion] [varchar](300) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[MAESTRO_HIS_OTRA_CONDICION] ([Id_Otra_Condicion], [Descripcion_Otra_Condicion]) VALUES (1, N'GESTANTE')
INSERT [dbo].[MAESTRO_HIS_OTRA_CONDICION] ([Id_Otra_Condicion], [Descripcion_Otra_Condicion]) VALUES (2, N'PUERPERA')
