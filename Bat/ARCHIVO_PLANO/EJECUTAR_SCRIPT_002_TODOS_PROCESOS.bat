sqlcmd -E -S UEIHNE01\SQLEXPRESS -d master -i C:\HISMINSA\Scripts\ARCHIVO_PLANO\HISMINSA_LOCAL_000_SCRIPT_CREA_BASE_DATOS.sql -o C:\HISMINSA\Resultados\HISMINSA_LOCAL_000_SCRIPT_CREA_BASE_DATOS.txt & @echo Script  ejecutado en la Base de datos UEIHNE01/SQLEXPRESS/master
sqlcmd -E -S UEIHNE01\SQLEXPRESS -d BDHIS_MINSA -i C:\HISMINSA\Scripts\ARCHIVO_PLANO\HISMINSA_LOCAL_001_SCRIPT_LIMPIAR_TABLAS.sql -o C:\HISMINSA\Resultados\HISMINSA_LOCAL_001_SCRIPT_LIMPIAR_TABLAS.txt & @echo Script  ejecutado en la Base de datos UEIHNE01/SQLEXPRESS/BDHIS_MINSA
sqlcmd -E -S UEIHNE01\SQLEXPRESS -d BDHIS_MINSA -i C:\HISMINSA\Scripts\ARCHIVO_PLANO\HISMINSA_LOCAL_002_SCRIPT_VALIDACION_TABLAS.sql -o C:\HISMINSA\Resultados\HISMINSA_LOCAL_002_SCRIPT_VALIDACION_TABLAS.txt & @echo Script  ejecutado en la Base de datos UEIHNE01/SQLEXPRESS/BDHIS_MINSA
sqlcmd -E -S UEIHNE01\SQLEXPRESS -d BDHIS_MINSA -i C:\HISMINSA\Scripts\ARCHIVO_PLANO\HISMINSA_LOCAL_003_SCRIPT_IMPORTAR_ARCHIVOS_PLANOS.sql -o C:\HISMINSA\Resultados\HISMINSA_LOCAL_003_SCRIPT_IMPORTAR_ARCHIVOS_PLANOS.txt & @echo Script  ejecutado en la Base de datos UEIHNE01/SQLEXPRESS/BDHIS_MINSA
sqlcmd -E -S UEIHNE01\SQLEXPRESS -d BDHIS_MINSA -i C:\HISMINSA\Scripts\ARCHIVO_PLANO\HISMINSA_LOCAL_004_SCRIPT_VISTAS_TABLAS_MAESTRAS_ARCHIVOS_PLANOS.sql -o C:\HISMINSA\Resultados\HISMINSA_LOCAL_004_SCRIPT_VISTAS_TABLAS_MAESTRAS_ARCHIVOS_PLANOS.txt & @echo Script  ejecutado en la Base de datos UEIHNE01/SQLEXPRESS/BDHIS_MINSA