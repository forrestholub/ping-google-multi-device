@echo off
set _number=1

SET /p device1= "DEVICE #1 SERIAL NUMBER, EX. 'N2PT220117':"
ECHO.
SET /p device2= "DEVICE #2 SERIAL NUMBER, EX. 'N2PT220117':"
ECHO.

REM You can also enter in devices manually below:
REM SET device1=NRVA280227
REM SET device2=NRVA280191

ping 127.0.0.1 -n 1 >NUL

CALL START 1_Ping_Google_Every_20sec_Device_2_Slave.bat %device2%

:start
echo STARTING Iteration #%_number% for device: %device1%
set /a _number +=1

adb -s %device1% shell ping -c 10 209.17.116.7

REM adb -s %device2% shell ping -c 10 209.17.116.7


timeout 12


if %_number%==180 goto end
echo For next ping

goto start

:end
echo End
exit /b 0