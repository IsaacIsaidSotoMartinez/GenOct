USE master
GO

/*
Proyecto: P01R01_BD_IISM
Autor: Isaac Isaid Soto Martinez
Fecha: 20261002
Descripción: Plan de contingencia: Base de datos
*/

--==================
-- CONTINGENCIA DE BASE DE DATOS
--==================

		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM master.dbo.sysdatabases WHERE NAME = 'GenOct'
							)
							BEGIN
							ALTER DATABASE GenOct
							SET SINGLE_USER 
							WITH ROLLBACK IMMEDIATE;

								--Eliminar informaciòn de las tablas
								 DROP DATABASE GenOct;
								PRINT 'La base de datos GenOct se elimino correctamente.'
							END
		ELSE
			BEGIN
				PRINT 'La base de datos GenOct no existe'
			END
GO