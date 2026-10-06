USE GenOct
GO

/*
Proyecto: P01R01_BD_IISM
Autor: Isaac Isaid Soto Martinez
Fecha: 20261002
Descripción: Plan de contingencia: Informacion de tablas
*/

--==================
-- CONTINGENCIA DE CARGA INICIAL
--==================

BEGIN TRANSACTION
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'AuditoriaProductos'
							AND TABLE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar informaciòn de las tablas
								 DELETE FROM [dbo].[AuditoriaProductos];
								PRINT 'La Tabla AuditoriaProductos se vacio correctamente.'
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

BEGIN TRANSACTION
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DetallesPedidos'
							AND TABLE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar informaciòn de las tablas
								 DELETE FROM [dbo].[DetallesPedidos];
								PRINT 'La Tabla DetallesPedidos sse vacio correctamente.'
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
								 DELETE FROM [dbo].[Pedidos];
								PRINT 'La Tabla Pedidos se vacio correctamente.'
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
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Productos'
							AND TABLE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar informaciòn de las tablas
								 DELETE FROM [dbo].[Productos];
								PRINT 'La Tabla Productos se vacio correctamente.'
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
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Clientes'
							AND TABLE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar informaciòn de las tablas
								 DELETE FROM [dbo].[Clientes];
								PRINT 'La Tabla Clientes se vacio correctamente.'
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