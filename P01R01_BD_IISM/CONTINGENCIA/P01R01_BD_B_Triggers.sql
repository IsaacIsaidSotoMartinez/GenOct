USE GenOct
GO

/*
Proyecto: P01R01_BD_IISM
Autor: Isaac Isaid Soto Martinez
Fecha: 20261002
Descripción: Plan de contingencia: Triggers
*/

--==================
-- CONTINGENCIA DE TRIGGERS
--==================

--COMMIT ROLLBACK
BEGIN TRANSACTION;
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'TR_AuditarCambioPrecio'
							AND type = 'TR' 
							AND SCHEMA_NAME(schema_id)= 'dbo'
							)

			BEGIN
				--ELIMINA TRIGGER
				DROP TRIGGER dbo.TR_AuditarCambioPrecio;
				PRINT 'TRIGGER TR_AuditarCambioPrecio eliminado correctamente.'
			END
		ELSE
			BEGIN
				PRINT 'El trigger [dbo].[TR_AuditarCambioPrecio] no existe'
			END
	COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO

BEGIN TRANSACTION;
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'TR_AuditarInsertProd'
							AND type = 'TR' 
							AND SCHEMA_NAME(schema_id)= 'dbo'
							)

			BEGIN
				--ELIMINA TRIGGER
				DROP TRIGGER dbo.TR_AuditarInsertProd;
				PRINT 'TRIGGER TR_AuditarInsertProd eliminado correctamente.'
			END
		ELSE
			BEGIN
				PRINT 'El trigger [dbo].[TR_AuditarInsertProd] no existe'
			END
	COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO

BEGIN TRANSACTION;
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'TR_AuditarProductos'
							AND type = 'TR' 
							AND SCHEMA_NAME(schema_id)= 'dbo'
							)

			BEGIN
				--ELIMINA TRIGGER
				DROP TRIGGER dbo.TR_AuditarProductos;
				PRINT 'TRIGGER TR_AuditarProductos eliminado correctamente.'
			END
		ELSE
			BEGIN
				PRINT 'El trigger [dbo].[TR_AuditarProductos] no existe'
			END
	COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO

BEGIN TRANSACTION;
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'TR_Auditar_TablaPr'
							AND type = 'TR' 
							AND SCHEMA_NAME(schema_id)= 'dbo'
							)

			BEGIN
				--ELIMINA TRIGGER
				DROP TRIGGER dbo.TR_Auditar_TablaPr;
				PRINT 'TRIGGER TR_Auditar_TablaPr eliminado correctamente.'
			END
		ELSE
			BEGIN
				PRINT 'El trigger [dbo].[TR_Auditar_TablaPr] no existe'
			END
	COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO

BEGIN TRANSACTION;
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'TR_InsteadOfUpdateProd'
							AND type = 'TR' 
							AND SCHEMA_NAME(schema_id)= 'dbo'
							)

			BEGIN
				--ELIMINA TRIGGER
				DROP TRIGGER dbo.TR_InsteadOfUpdateProd;
				PRINT 'TRIGGER TR_InsteadOfUpdateProd eliminado correctamente.'
			END
		ELSE
			BEGIN
				PRINT 'El trigger [dbo].[TR_InsteadOfUpdateProd] no existe'
			END
	COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO

BEGIN TRANSACTION;
	BEGIN TRY
		--VALIDACIONES
		IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'TR_aud_Instead'
							AND type = 'TR' 
							AND SCHEMA_NAME(schema_id)= 'dbo'
							)

			BEGIN
				--ELIMINA TRIGGER
				DROP TRIGGER dbo.TR_aud_Instead;
				PRINT 'TRIGGER TR_aud_Instead eliminado correctamente.'
			END
		ELSE
			BEGIN
				PRINT 'El trigger [dbo].[TR_aud_Instead] no existe'
			END
	COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH
GO