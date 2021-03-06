:: mandatory
if "%KETTLE_DIR%" == "" call :warnNoKettleDir
if "%KETTLE_HOME%" == "" call :warnNoKettleHome

:: optional
if "%KETTLE_JAVA_HOME%" neq "" call :setJavaHome
if "%KETTLE_JVM_MEM%" neq "" call :setJavaMaxMem
if "%KETTLE_LOG_LEVEL%" == "" call :setLogLevel
goto:eof

:setJavaHome
echo Overriding KETTLE default JVM: %KETTLE_JAVA_HOME%
set PENTAHO_JAVA_HOME=%KETTLE_JAVA_HOME%
goto:eof

:setJavaMaxMem
echo Overriding KETTLE default JVM mem size: %KETTLE_JVM_MEM%
set JAVAMAXMEM=%KETTLE_JVM_MEM%
goto:eof

:setLogLevel
echo Setting default logging level to INFO
set KETTLE_LOG_LEVEL=INFO
goto:eof

:warnNoKettleDir
echo Please define the KETTLE_DIR variable in the configuration file
exit
goto:eof

:warnNoKettleHome
echo Please define the KETTLE_HOME variable in the configuration file
exit
goto:eof
