USE GenOct
GO

/*
Proyecto: P01R01_BD_IISM
Autor: Isaac Isaid Soto Martinez
Fecha: 20261002
Descripción: Plan de contingencia: STORED PROCEDURE
*/

--==================
-- CONTINGENCIA DE STORED PROCEDURE
--==================

BEGIN TRANSACTION
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'spConsultarContenidoTablasGenOct'
							AND ROUTINE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar procedimiento almacenado
								DROP PROCEDURE [dbo].[spConsultarContenidoTablasGenOct];
								PRINT 'Procedimiento spConsultarContenidoTablasGenOct eliminado correctamente.'
							END
		ELSE
			BEGIN
				PRINT 'El procedimiento spConsultarContenidoTablasGenOct no existe'
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
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'spInsertarPedido'
							AND ROUTINE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar procedimiento almacenado
								DROP PROCEDURE [dbo].[spInsertarPedido];
								PRINT 'Procedimiento spInsertarPedido eliminado correctamente.'
							END
		ELSE
			BEGIN
				PRINT 'El procedimiento spInsertarPedido no existe'
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
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'spObtenerClientePorId'
							AND ROUTINE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar procedimiento almacenado
								DROP PROCEDURE [dbo].[spObtenerClientePorId];
								PRINT 'Procedimiento spObtenerClientePorId eliminado correctamente.'
							END
		ELSE
			BEGIN
				PRINT 'El procedimiento spObtenerClientePorId no existe'
			END
	COMMIT TRANSACTION;
	END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO
			