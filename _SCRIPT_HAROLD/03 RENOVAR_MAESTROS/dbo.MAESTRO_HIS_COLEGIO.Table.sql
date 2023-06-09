USE [BDHIS_MINSA]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_COLEGIO]    Script Date: 30/07/2020 10:03:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_COLEGIO]') AND type in (N'U'))
DROP TABLE [dbo].[MAESTRO_HIS_COLEGIO]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_COLEGIO]    Script Date: 30/07/2020 10:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_COLEGIO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MAESTRO_HIS_COLEGIO](
	[Id_Colegio] [varchar](2) NOT NULL,
	[Descripcion_Colegio] [varchar](800) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'00', N'PERSONAL DE SALUD SIN COLEGIATURA')
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'01', N'COLEGIO MEDICO DE PERU')
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'02', N'COLEGIO QUIMICO FARMACEUTICO DEL PERU')
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'03', N'COLEGIO ODONTOLOGICO DEL PERU')
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'04', N'COLEGIO DE BIOLOGOS DEL PERU')
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'05', N'COLEGIO DE OBSTETRICES DEL PERU')
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'06', N'COLEGIO DE ENFERMEROS DEL PERU')
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'07', N'COLEGIO DE TRABAJADORES SOCIALES DEL PERU')
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'08', N'COLEGIO DE PSICOLOGOS DEL PERU')
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'09', N'COLEGIO TECNOLOGO MEDICO DEL PERU')
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'10', N'COLEGIO DE NUTRICIONISTAS DEL PERU')
INSERT [dbo].[MAESTRO_HIS_COLEGIO] ([Id_Colegio], [Descripcion_Colegio]) VALUES (N'11', N'COLEGIO MEDICO VETERINARIO DEL PERU')
