USE GenOct
GO

/*
Proyecto: P01R01_BD_IISM
Autor: Isaac Isaid Soto Martinez
Fecha: 20261002
Descripción: Plan de contingencia: Tablas
*/

--==================
-- CONTINGENCIA DE TABLAS
--==================

BEGIN TRANSACTION
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DetallesPedidos'
							AND TABLE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar informaciòn de las tablas
								 DROP TABLE [dbo].[DetallesPedidos];
								PRINT 'La Tabla DetallesPedidos se elimino correctamente.'
							END
		ELSE
			BEGIN
				PRINT 'La tabla DetallesPedidos no existe'
			END
	COMMIT TRANSACTION;
	END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO

BEGIN TRANSACTION
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Pedidos'
							AND TABLE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar informaciòn de las tablas
								 DROP TABLE [dbo].[Pedidos];
								PRINT 'La Tabla Pedidos se elimino correctamente.'
							END
		ELSE
			BEGIN
				PRINT 'La tabla Pedidos no existe'
			END
	COMMIT TRANSACTION;
	END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO

BEGIN TRANSACTION
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Clientes'
							AND TABLE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar informaciòn de las tablas
								 DROP TABLE [dbo].[Clientes];
								PRINT 'La Tabla Clientes se elimino correctamente.'
							END
		ELSE
			BEGIN
				PRINT 'La tabla Clientes no existe'
			END
	COMMIT TRANSACTION;
	END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO

BEGIN TRANSACTION
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Productos'
							AND TABLE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar informaciòn de las tablas
								 DROP TABLE [dbo].[Productos];
								PRINT 'La Tabla Productos se elimino correctamente.'
							END
		ELSE
			BEGIN
				PRINT 'La tabla Productos no existe'
			END
	COMMIT TRANSACTION;
	END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO

BEGIN TRANSACTION
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'AuditoriaProductos'
							AND TABLE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar informaciòn de las tablas
								 DROP TABLE [dbo].[AuditoriaProductos];
								PRINT 'La Tabla AuditoriaProductos se elimino correctamente.'
							END
		ELSE
			BEGIN
				PRINT 'La tabla VwVistaResumenVentas no existe'
			END
	COMMIT TRANSACTION;
	END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO