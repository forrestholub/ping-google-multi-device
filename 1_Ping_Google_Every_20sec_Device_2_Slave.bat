@echo off
set _number=1
set device2=%1

:start
echo STARTING Iteration #%_number% for device: %device2%
set /a _number +=1
adb -s %device2% shell ping -c 10 209.17.116.7
timeout 12


if %_number%==180 goto end
echo For next ping

goto start

:end
echo End
exit /b 0