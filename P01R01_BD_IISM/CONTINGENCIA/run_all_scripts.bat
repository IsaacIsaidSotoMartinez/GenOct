@echo off
rem Ejecutar todos los scripts SQL en orden
    setlocal
    rem cambiar por el nombre de tu instancia a sql server
    set "SERVER=DESKTOP-RCVDT3D"
    set "AUTH=-E"
    set "SQLCMD=sqlcmd"
    set "SCRIPTS_DIR=%~dp0"

    echo.
    echo ==================
    echo Ejecutando Scripts 1: Eliminar jobs
    echo ==================

    %SQLCMD% -S %SERVER% %AUTH% -C -d master -i "%SCRIPTS_DIR%P01R01_BD_A_Jobs.sql" -b
    if errorlevel 1 goto error

    rem Cambia por el nombre de la bd que crea tu script
    set "DB=GenOct"

    echo.
    echo ==================
    echo Ejecutando Scripts 2: Eliminar triggers
    echo ==================

    %SQLCMD% -S %SERVER% %AUTH% -C -d %DB% -i "%SCRIPTS_DIR%P01R01_BD_B_Triggers.sql" -b
    if errorlevel 1 goto error

    echo.
    echo ==================
    echo Ejecutando Scripts 3: Eliminar SP
    echo ==================

    %SQLCMD% -S %SERVER% %AUTH% -C -d %DB% -i "%SCRIPTS_DIR%P01R01_BD_C_StoredProcedure.sql" -b
    if errorlevel 1 goto error

    echo.
    echo ==================
    echo Ejecutando Scripts 4: Eliminar vistas
    echo ==================

    %SQLCMD% -S %SERVER% %AUTH% -C -d %DB% -i "%SCRIPTS_DIR%P01R01_BD_D_Vista.sql" -b
    if errorlevel 1 goto error

    echo.
    echo ==================
    echo Ejecutando Scripts 5: Eliminar carga
    echo ==================

    %SQLCMD% -S %SERVER% %AUTH% -C -d %DB% -i "%SCRIPTS_DIR%P01R01_BD_E_CargaInicial.sql" -b
    if errorlevel 1 goto error

    echo.
    echo ==================
    echo Ejecutando Scripts 6: Eliminar tablas
    echo ==================

    %SQLCMD% -S %SERVER% %AUTH% -C -d %DB% -i "%SCRIPTS_DIR%P01R01_BD_F_Tablas.sql" -b
    if errorlevel 1 goto error

    echo.
    echo ==================
    echo Ejecutando Scripts 7: Eliminar base de datos
    echo ==================

    %SQLCMD% -S %SERVER% %AUTH% -C -d %DB% -i "%SCRIPTS_DIR%P01R01_BD_G_BaseDeDatos.sql" -b
    if errorlevel 1 goto error

    echo.
    echo ==================
    echo Los scripts se crearon de %DB% correcta.
    echo ==================
    pause
    goto end

    :error
    echo.
    echo ==================
    echo ERROR: Fallo en la ejecución de los scripts.
    echo Revisa el mensaje anterior para obtener mas detalles
    echo ==================
    pause

    :end
    endlocal