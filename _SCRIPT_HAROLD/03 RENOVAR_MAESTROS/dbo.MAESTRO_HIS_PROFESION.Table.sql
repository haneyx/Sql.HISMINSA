USE [BDHIS_MINSA]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_PROFESION]    Script Date: 30/07/2020 10:03:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_PROFESION]') AND type in (N'U'))
DROP TABLE [dbo].[MAESTRO_HIS_PROFESION]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_PROFESION]    Script Date: 30/07/2020 10:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_PROFESION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MAESTRO_HIS_PROFESION](
	[Id_Profesion] [varchar](2) NOT NULL,
	[Descripcion_Profesion] [varchar](200) NULL,
	[Id_Colegio] [varchar](2) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'01', N'MEDICO GENERAL', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'02', N'MEDICO NEUMOLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'03', N'MEDICO CARDIOLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'04', N'MEDICO NEUROLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'05', N'MEDICO GASTROENTEROLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'06', N'MEDICO DERMATOLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'07', N'MEDICO NEFROLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'08', N'MEDICO ONCOLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'09', N'MEDICO PSIQUIATRA', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'10', N'MEDICO CIRUJANO GENERAL', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'11', N'MEDICO TRAUMATOLOGO ORTOPEDISTA', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'12', N'MEDICO OTORRINOLARINGOLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'13', N'MEDICO OFTALMOLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'14', N'MEDICO UROLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'15', N'MEDICO CIRUJANO ONCOLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'16', N'MEDICO PATOLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'17', N'MEDICO OTROS CIRUGIA', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'18', N'MEDICO PEDIATRA', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'19', N'MEDICO GINECO-OBSTETRA', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'20', N'MEDICO EPIDEMIOLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'21', N'MEDICO RADIOLOGO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'22', N'MEDICO OTRAS ESPECIALIDADES', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'23', N'OBSTETRIZ', N'05')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'24', N'NUTRICIONISTA', N'10')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'25', N'ODONTOLOGO', N'03')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'26', N'QUIMICO FARMACEUTICO', N'02')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'27', N'RADIOTERAPEUTA', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'28', N'PSICOLOGO', N'08')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'29', N'ENFERMERA (O)', N'06')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'30', N'TECNOLOGO MEDICO', N'09')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'31', N'BIOLOGO', N'04')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'32', N'VETERINARIO', N'11')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'33', N'ASISTENTA SOCIAL', N'07')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'34', N'TECNICOS DE SALUD', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'35', N'TECNICAS DE ENFERMERIA', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'36', N'TECNICO DE LABORATORIO', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'37', N'TECNICO RADIOLOGO', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'38', N'TECNICO DENTAL', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'39', N'TECNICO SANEAMIENTO AMBIENTAL', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'40', N'AUXILIARES DE SALUD', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'41', N'OTROS TECNICOS Y AUXILIARES', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'42', N'OTROS NO ESPECIFICADOS', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'43', N'INTERNO DE MEDICINA', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'44', N'INTERNOS NO MEDICOS', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'45', N'SERUMISTA MEDICO', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'46', N'SERUMISTA ENFERMERA', N'06')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'47', N'SERUMISTA ODONTOLOGO', N'03')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'48', N'SERUMISTA OBSTETRIZ', N'05')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'49', N'SERUMISTA SERVICIO SOCIAL', N'07')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'50', N'SERUMISTA PSICOLOGO', N'08')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'51', N'MEDICO RESIDENTE', N'01')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'52', N'AGENTE COMUNITARIO', N'00')
INSERT [dbo].[MAESTRO_HIS_PROFESION] ([Id_Profesion], [Descripcion_Profesion], [Id_Colegio]) VALUES (N'53', N'ESTADISTICO', N'00')
