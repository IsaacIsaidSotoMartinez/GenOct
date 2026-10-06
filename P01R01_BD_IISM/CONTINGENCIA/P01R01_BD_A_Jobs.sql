USE msdb
GO

/*
Proyecto: P01R01_BD_IISM
Autor: Isaac Isaid Soto Martinez
Fecha: 20261002
Descripción: Plan de contingencia
*/

--==================
-- CONTINGENCIA DE JOBS
--==================
IF EXISTS (SELECT 1 FROM dbo.sysjobs WHERE name = 'JExecSPGenOctv1')
	BEGIN
		EXEC dbo.sp_delete_job
		@job_name =N'JExecSPGenOctv1',
		@delete_unused_schedule = 1--,
		--@force_delete = 1;
		
		PRINT 'Job y sus recursos asociados eliminados';

		--Borrar duplicados
		DECLARE @SCHEDULE_ID INT;
		DECLARE cur CURSOR FOR
			SELECT
				SCHEDULE_ID
			FROM msdb.dbo.sysschedules
			WHERE name = N'Schedule_Cada5MinGenOct';

			OPEN cur
				FETCH NEXT FROM cur INTO @SCHEDULE_ID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							EXEC dbo.sp.delete_schedule @SCHEDULE_ID = @SCHEDULE_ID,
							@FORCE_DELETED = 1
							FETCH NEXT FROM cur INTO @SCHEDULE_ID;
						END
						CLOSE cur
							DEALLOCATE cur;
							PRINT 'Se borraron duplicates'
END