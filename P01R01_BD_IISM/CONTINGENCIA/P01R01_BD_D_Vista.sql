USE GenOct
GO

/*
Proyecto: P01R01_BD_IISM
Autor: Isaac Isaid Soto Martinez
Fecha: 20261002
Descripción: Plan de contingencia: View
*/

--==================
-- CONTINGENCIA DE VISTAS/VIEW
--==================

BEGIN TRANSACTION
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'VwVistaResumenVentas'
							AND TABLE_SCHEMA = 'dbo'
							)
							BEGIN
								--Eliminar procedimiento vistas
								DROP VIEW [dbo].[VwVistaResumenVentas];
								PRINT 'La vista VwVistaResumenVentas se elimino correctamente.'
							END
		ELSE
			BEGIN
				PRINT 'La vista VwVistaResumenVentas no existe'
			END
	COMMIT TRANSACTION;
	END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO