@echo off

set "process_name=pythonw3.11.exe"
set "pid="

for /f "tokens=2 delims=," %%a in ('tasklist /NH /FI "IMAGENAME eq %process_name%" /FO CSV') do (
    for /f %%b in ("%%a") do (
        set "pid=%%~b"
        echo Found %process_name% process with PID: %pid%
        tasklist | findstr /I python
        
    )
)

set /p pid=Enter the PID of the process to terminate: 

if "%pid%"=="" (
    echo No PID entered. Exiting script.
    pause
    exit
)

taskkill /F /PID %pid%

echo Process with PID %pid% terminated.
echo Script completed.
pause
