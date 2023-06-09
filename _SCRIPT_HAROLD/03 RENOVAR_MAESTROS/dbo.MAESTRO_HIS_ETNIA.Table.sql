USE [BDHIS_MINSA]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_ETNIA]    Script Date: 30/07/2020 10:03:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_ETNIA]') AND type in (N'U'))
DROP TABLE [dbo].[MAESTRO_HIS_ETNIA]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_ETNIA]    Script Date: 30/07/2020 10:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_ETNIA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MAESTRO_HIS_ETNIA](
	[Id_Etnia] [char](2) NOT NULL,
	[Descripcion_Etnia] [varchar](100) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'01', N'ACHUAR')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'02', N'AIMARA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'03', N'AMAHUACA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'04', N'ARABELA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'05', N'ASHANINKA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'06', N'ASHENINKA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'07', N'AWAJÚN')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'08', N'BORA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'09', N'CAPANAHUA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'10', N'CASHINAHUA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'11', N'CHAMICURO')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'12', N'CHAPRA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'13', N'CHITONAHUA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'14', N'ESE EJA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'15', N'HARAKBUT')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'16', N'IKITU')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'17', N'IÑAPARI')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'18', N'ISCONAHUA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'19', N'JAQARU')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'20', N'JÍBARO')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'21', N'KAKATAIBO')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'22', N'KAKINTE')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'23', N'KANDOZI')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'24', N'KICHWA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'25', N'KUKAMA KUKAMIRIA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'26', N'MADIJA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'27', N'MAIJUNA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'28', N'MARINAHUA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'29', N'MASHCO PIRO')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'30', N'MASTANAHUA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'31', N'MATSÉS')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'32', N'MATSIGENKA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'33', N'MUNICHE')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'34', N'MURUI-MUINANI')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'35', N'NAHUA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'36', N'NANTI')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'37', N'NOMATSIGENGA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'38', N'OCAINA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'39', N'OMAGUA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'40', N'QUECHUAS')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'41', N'RESÍGARO')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'42', N'SECOYA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'43', N'SHARANAHUA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'44', N'SHAWI')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'45', N'SHIPIBO-KONIBO')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'46', N'SHIWILU')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'47', N'TIKUNA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'48', N'URARINA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'49', N'URO')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'50', N'VACACOCHA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'51', N'WAMPIS')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'52', N'YAGUA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'53', N'YAMINAHUA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'54', N'YANESHA')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'55', N'YINE')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'56', N'AFROPERUANO')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'57', N'BLANCO')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'58', N'MESTIZO')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'59', N'ASIATICODESCENDIENTE')
INSERT [dbo].[MAESTRO_HIS_ETNIA] ([Id_Etnia], [Descripcion_Etnia]) VALUES (N'60', N'OTRO')
