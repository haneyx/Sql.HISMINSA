USE [BDHIS_MINSA]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_TIPO_DOC]    Script Date: 30/07/2020 10:03:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_TIPO_DOC]') AND type in (N'U'))
DROP TABLE [dbo].[MAESTRO_HIS_TIPO_DOC]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_TIPO_DOC]    Script Date: 30/07/2020 10:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_TIPO_DOC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MAESTRO_HIS_TIPO_DOC](
	[Id_Tipo_Documento] [int] NOT NULL,
	[Abrev_Tipo_Doc] [varchar](20) NULL,
	[Descripcion_Tipo_Documento] [varchar](250) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[MAESTRO_HIS_TIPO_DOC] ([Id_Tipo_Documento], [Abrev_Tipo_Doc], [Descripcion_Tipo_Documento]) VALUES (1, N'DNI', N'Documento Nacional de Identidad')
INSERT [dbo].[MAESTRO_HIS_TIPO_DOC] ([Id_Tipo_Documento], [Abrev_Tipo_Doc], [Descripcion_Tipo_Documento]) VALUES (2, N'CE', N'Carnet de Extranjería')
INSERT [dbo].[MAESTRO_HIS_TIPO_DOC] ([Id_Tipo_Documento], [Abrev_Tipo_Doc], [Descripcion_Tipo_Documento]) VALUES (3, N'PASS', N'Pasaporte')
INSERT [dbo].[MAESTRO_HIS_TIPO_DOC] ([Id_Tipo_Documento], [Abrev_Tipo_Doc], [Descripcion_Tipo_Documento]) VALUES (4, N'DIE', N'Documento de Identidad Extranjero')
INSERT [dbo].[MAESTRO_HIS_TIPO_DOC] ([Id_Tipo_Documento], [Abrev_Tipo_Doc], [Descripcion_Tipo_Documento]) VALUES (5, N'S/ DOCUMENTO', N'No sabe')
INSERT [dbo].[MAESTRO_HIS_TIPO_DOC] ([Id_Tipo_Documento], [Abrev_Tipo_Doc], [Descripcion_Tipo_Documento]) VALUES (6, N'CNV', N'Certificado de Nacido Vivo')
