USE [BDHIS_MINSA]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_PAIS]    Script Date: 30/07/2020 10:03:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_PAIS]') AND type in (N'U'))
DROP TABLE [dbo].[MAESTRO_HIS_PAIS]
GO
/****** Object:  Table [dbo].[MAESTRO_HIS_PAIS]    Script Date: 30/07/2020 10:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MAESTRO_HIS_PAIS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MAESTRO_HIS_PAIS](
	[Id_Pais] [varchar](3) NOT NULL,
	[Descripcion_Pais] [varchar](300) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ABW', N'ARUBA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'AFG', N'AFGANISTAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'AGO', N'ANGOLA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'AIA', N'ANGUILA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ALA', N'ISLAS AALAND')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ALB', N'ALBANIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'AND', N'ANDORRA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ANT', N'ANTILLAS NEERLANDESAS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ARE', N'EMIRATOS ARABES UNIDOS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ARG', N'ARGENTINA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ARM', N'ARMENIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ASM', N'SAMOA AMERICANA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ATA', N'ANTÁRTIDA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ATF', N'TERRITORIOS AUSTRALES FRANCESES')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ATG', N'ANTIGUA Y BARBUDA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'AUS', N'AUSTRALIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'AUT', N'AUSTRIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'AZE', N'AZERBAIYAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BDI', N'BURUNDI')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BEL', N'BÉLGICA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BEN', N'BENIN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BES', N'BONAIRE, SAN EUSTAQUIO Y SABA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BFA', N'BURKINA FASO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BGD', N'BANGLADESH')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BGR', N'BULGARIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BHR', N'BAHRÉIN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BHS', N'BAHAMAS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BIH', N'BOSNIA Y HERZEGOVINA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BLM', N'SAN BARTOLOME')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BLR', N'BIELORRUSIA (BELARÚS)')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BLZ', N'BELICE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BMU', N'BERMUDAS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BOL', N'BOLIVIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BRA', N'BRASIL')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BRB', N'BARBADOS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BRN', N'BRUNEI DARUSSALAM')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BTN', N'BUTAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BVT', N'ISLA BOUVET')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'BWA', N'BOTSUANA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CAF', N'REPUBLICA CENTROAFRICANA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CAN', N'CANADA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CCK', N'ISLAS COCOS (KEELING)')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CHE', N'SUIZA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CHL', N'CHILE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CHN', N'CHINA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CIV', N'COSTA DE MARFIL')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CMR', N'CAMERUN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'COD', N'REPUBLICA DEMOCRATICA DEL CONGO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'COG', N'REPUBLICA DEL CONGO (BRAZZAVILLE)')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'COK', N'ISLAS COOK')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'COL', N'COLOMBIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'COM', N'COMORAS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CPV', N'CABO VERDE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CRI', N'COSTA RICA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CUB', N'CUBA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CUW', N'CURACAO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CXR', N'ISLA DE NAVIDAD (ISLA CHRISTMAS)')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CYM', N'ISLAS CAIMAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CYP', N'CHIPRE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'CZE', N'REPUBLICA CHECA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'DEU', N'ALEMANIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'DJI', N'YIBUTI')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'DMA', N'DOMINICA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'DNK', N'DINAMARCA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'DOM', N'REPUBLICA DOMINICANA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'DZA', N'ARGELIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ECU', N'ECUADOR')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'EGY', N'EGIPTO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ERI', N'ERITREA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ESH', N'SAHARA OCCIDENTAL')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ESP', N'ESPAÑA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'EST', N'ESTONIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ETH', N'ETIOPIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'FIN', N'FINLANDIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'FJI', N'FIYI')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'FLK', N'ISLAS MALVINAS (FARKLAND)')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'FRA', N'FRANCIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'FRO', N'ISLAS FEROE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'FSM', N'MICRONESIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GAB', N'GABON')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GBR', N'REINO UNIDO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GEO', N'GEORGIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GGY', N'GUERNSEY')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GHA', N'GHANA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GIB', N'GIBRALTAR')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GIN', N'GUINEA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GLP', N'GUADALUPE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GMB', N'GAMBIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GNB', N'GUINEA-BISSAU')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GNQ', N'GUINEA ECUATORIAL')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GRC', N'GRECIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GRD', N'GRANADA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GRL', N'GROENLANDIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GTM', N'GUATEMALA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GUF', N'GUAYANA FRANCESA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GUM', N'GUAM')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'GUY', N'GUYANA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'HKG', N'HONG KONG')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'HMD', N'ISLAS HEARD Y MCDONALD')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'HND', N'HONDURAS')
GO
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'HRV', N'CROACIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'HTI', N'HAITI')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'HUN', N'HUNGRIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'IDN', N'INDONESIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'IMN', N'ISLA DE MAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'IND', N'INDIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'IOT', N'TERRITORIO BRITANICO DEL OCEANO INDICO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'IRL', N'IRLANDA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'IRN', N'IRAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'IRQ', N'IRAK')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ISL', N'ISLANDIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ISR', N'ISRAEL')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ITA', N'ITALIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'JAM', N'JAMAICA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'JEY', N'JERSEY')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'JOR', N'JORDANIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'JPN', N'JAPON')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'KAZ', N'KAZAJISTÁN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'KEN', N'KENIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'KGZ', N'KIRGUIZISTÁN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'KHM', N'CAMBOYA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'KIR', N'KIRIBATI')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'KNA', N'SAN CRISTOBAL Y NIEVES')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'KOR', N'COREA DEL SUR')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'KWT', N'KUWAIT')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'LAO', N'LAOS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'LBN', N'LÍBANO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'LBR', N'LIBERIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'LBY', N'LIBIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'LCA', N'SANTA LUCIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'LIE', N'LIECHTENSTEIN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'LKA', N'SRI LANKA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'LSO', N'LESOTO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'LTU', N'LITUANIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'LUX', N'LUXEMBURGO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'LVA', N'LETONIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MAC', N'MACAO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MAF', N'SAN MARTIN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MAR', N'MARRUECOS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MCO', N'MóNACO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MDA', N'MOLDAVIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MDG', N'MADAGASCAR')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MDV', N'MALDIVAS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MEX', N'MÉXICO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MHL', N'ISLAS MARSHALL')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MKD', N'MACEDONIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MLI', N'MALI')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MLT', N'MALTA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MMR', N'MYANMAR (BIRMANIA)')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MNE', N'MONTENEGRO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MNG', N'MONGOLIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MNP', N'ISLAS MARIANAS DEL NORTE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MOZ', N'MOZAMBIQUE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MRT', N'MAURITANIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MSR', N'MONTSERRAT')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MTQ', N'MARTINICA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MUS', N'MAURICIO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MWI', N'MALAWI')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MYS', N'MALASIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'MYT', N'MAYOTTE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NAM', N'NAMIBIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NCL', N'NUEVA CALEDONIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NER', N'NíGER')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NFK', N'ISLA NORFOLK')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NGA', N'NIGERIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NIC', N'NICARAGUA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NIU', N'NIUE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NLD', N'HOLANDA (PAISES BAJOS)')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NOR', N'NORUEGA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NPL', N'NEPAL')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NRU', N'NAURU')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'NZL', N'NUEVA ZELANDA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'OMN', N'OMAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PAK', N'PAKISTAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PAN', N'PANAMA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PCN', N'ISLAS PITCAIRN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PER', N'PERU')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PHL', N'FILIPINAS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PLW', N'PALAOS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PNG', N'PAPUA-NUEVA GUINEA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'POL', N'POLONIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PRI', N'PUERTO RICO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PRK', N'COREA DEL NORTE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PRT', N'PORTUGAL')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PRY', N'PARAGUAY')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PSE', N'PALESTINA (GAZA)')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'PYF', N'POLINESIA FRANCESA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'QAT', N'QATAR')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'REU', N'REUNION')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ROU', N'RUMANIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'RUS', N'RUSIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'RWA', N'RUANDA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SAU', N'ARABIA SAUDITA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SDN', N'SUDAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SEN', N'SENEGAL')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SGP', N'SINGAPUR')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SGS', N'ISLAS GEORGIA DEL SUR Y SANDWICH DEL SUR')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SHN', N'SANTA HELENA - ASCENSIÓN Y TRISTÁN DA CUNHA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SJM', N'SVALBARD Y JAN MAYEN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SLB', N'ISLAS SALOMON')
GO
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SLE', N'SIERRA LEONA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SLV', N'EL SALVADOR')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SMR', N'SAN MARINO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SOM', N'SOMALIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SPM', N'SAN PEDRO Y MIQUELON')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SRB', N'SERBIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SSD', N'SUDAN SUR')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'STP', N'SANTO TOME Y PRINCIPE')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SUR', N'SURINAM')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SVK', N'ESLOVAQUIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SVN', N'ESLOVENIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SWE', N'SUECIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SWZ', N'SUAZILANDIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SYC', N'SEYCHELLES')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'SYR', N'SIRIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TCA', N'ISLAS TURCAS Y CAICOS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TCD', N'CHAD')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TGO', N'TOGO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'THA', N'TAILANDIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TJK', N'TAYIKISTAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TKL', N'TOKELAU')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TKM', N'TURKMENISTÁN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TLS', N'TIMOR ORIENTAL')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TON', N'TONGA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TTO', N'TRINIDAD Y TOBAGO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TUN', N'TÚNEZ')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TUR', N'TURQUIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TUV', N'TUVALU')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TWN', N'TAIWAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'TZA', N'TANZANIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'UGA', N'UGANDA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'UKR', N'UCRANIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'UMI', N'ISLAS MENORES ALEJADAS DE LOS ESTADOS UN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'URY', N'URUGUAY')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'USA', N'ESTADOS UNIDOS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'UZB', N'UZBEKISTAN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'VAT', N'CIUDAD DEL VATICANO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'VCT', N'SAN VICENTE Y LAS GRANADINAS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'VEN', N'VENEZUELA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'VGB', N'ISLAS VIRGENES BRITANICAS')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'VIR', N'ISLAS VIRGENES AMERICANAS (EEUU)')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'VNM', N'VIETNAM')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'VUT', N'VANUATU')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'WLF', N'WALLIS Y FUTUNA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'WSM', N'SAMOA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'XKX', N'KOSOVO')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'YEM', N'YEMEN')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ZAF', N'SUDAFRICA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ZMB', N'ZAMBIA')
INSERT [dbo].[MAESTRO_HIS_PAIS] ([Id_Pais], [Descripcion_Pais]) VALUES (N'ZWE', N'ZIMBABUE')
