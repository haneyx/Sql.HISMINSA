USE [BDHIS_MINSA]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_FINANCIADOR]    Script Date: 30/07/2020 10:03:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_FINANCIADOR]') AND type in (N'U'))
DROP TABLE [dbo].[MAESTRO_HIS_FINANCIADOR]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_FINANCIADOR]    Script Date: 30/07/2020 10:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_FINANCIADOR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MAESTRO_HIS_FINANCIADOR](
	[Id_Financiador] [varchar](2) NOT NULL,
	[Descripcion_Financiador] [varchar](100) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[MAESTRO_HIS_FINANCIADOR] ([Id_Financiador], [Descripcion_Financiador]) VALUES (N'1', N'USUARIO')
INSERT [dbo].[MAESTRO_HIS_FINANCIADOR] ([Id_Financiador], [Descripcion_Financiador]) VALUES (N'10', N'OTROS')
INSERT [dbo].[MAESTRO_HIS_FINANCIADOR] ([Id_Financiador], [Descripcion_Financiador]) VALUES (N'11', N'EXONERADO')
INSERT [dbo].[MAESTRO_HIS_FINANCIADOR] ([Id_Financiador], [Descripcion_Financiador]) VALUES (N'2', N'S.I.S')
INSERT [dbo].[MAESTRO_HIS_FINANCIADOR] ([Id_Financiador], [Descripcion_Financiador]) VALUES (N'3', N'ESSALUD')
INSERT [dbo].[MAESTRO_HIS_FINANCIADOR] ([Id_Financiador], [Descripcion_Financiador]) VALUES (N'4', N'S.O.A.T')
INSERT [dbo].[MAESTRO_HIS_FINANCIADOR] ([Id_Financiador], [Descripcion_Financiador]) VALUES (N'5', N'SANIDAD F.A.P')
INSERT [dbo].[MAESTRO_HIS_FINANCIADOR] ([Id_Financiador], [Descripcion_Financiador]) VALUES (N'6', N'SANIDAD NAVAL')
INSERT [dbo].[MAESTRO_HIS_FINANCIADOR] ([Id_Financiador], [Descripcion_Financiador]) VALUES (N'7', N'SANIDAD EP')
INSERT [dbo].[MAESTRO_HIS_FINANCIADOR] ([Id_Financiador], [Descripcion_Financiador]) VALUES (N'8', N'SANIDAD PNP')
INSERT [dbo].[MAESTRO_HIS_FINANCIADOR] ([Id_Financiador], [Descripcion_Financiador]) VALUES (N'9', N'PRIVADOS')
