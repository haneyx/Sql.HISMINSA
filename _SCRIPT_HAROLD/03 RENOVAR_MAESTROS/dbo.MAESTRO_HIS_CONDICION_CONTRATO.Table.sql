USE [BDHIS_MINSA]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_CONDICION_CONTRATO]    Script Date: 30/07/2020 10:03:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_CONDICION_CONTRATO]') AND type in (N'U'))
DROP TABLE [dbo].[MAESTRO_HIS_CONDICION_CONTRATO]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_CONDICION_CONTRATO]    Script Date: 30/07/2020 10:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_CONDICION_CONTRATO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MAESTRO_HIS_CONDICION_CONTRATO](
	[Id_Condicion] [int] NOT NULL,
	[Descripcion_Condicion] [varchar](500) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[MAESTRO_HIS_CONDICION_CONTRATO] ([Id_Condicion], [Descripcion_Condicion]) VALUES (1, N'NOMBRADO')
INSERT [dbo].[MAESTRO_HIS_CONDICION_CONTRATO] ([Id_Condicion], [Descripcion_Condicion]) VALUES (2, N'CONTRATADO')
INSERT [dbo].[MAESTRO_HIS_CONDICION_CONTRATO] ([Id_Condicion], [Descripcion_Condicion]) VALUES (3, N'SERUM')
INSERT [dbo].[MAESTRO_HIS_CONDICION_CONTRATO] ([Id_Condicion], [Descripcion_Condicion]) VALUES (4, N'RESIDENTE')
INSERT [dbo].[MAESTRO_HIS_CONDICION_CONTRATO] ([Id_Condicion], [Descripcion_Condicion]) VALUES (5, N'INTERNO')
INSERT [dbo].[MAESTRO_HIS_CONDICION_CONTRATO] ([Id_Condicion], [Descripcion_Condicion]) VALUES (6, N'ALUMNO')
INSERT [dbo].[MAESTRO_HIS_CONDICION_CONTRATO] ([Id_Condicion], [Descripcion_Condicion]) VALUES (7, N'AGENTE COMUNITARIO')
INSERT [dbo].[MAESTRO_HIS_CONDICION_CONTRATO] ([Id_Condicion], [Descripcion_Condicion]) VALUES (8, N'OTROS')
INSERT [dbo].[MAESTRO_HIS_CONDICION_CONTRATO] ([Id_Condicion], [Descripcion_Condicion]) VALUES (9, N'DESTACADO')
