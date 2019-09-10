@echo on

set "service1=iphlpsvc"
set "service2=Winmgmt"
set "ip=127.0.0.1"

set "user=domain\adminuser"
set "pass=s3cr3tp@ss"

net use \\%ip%\ipc$ /user:%user% %pass%

cmdkey.exe /add:%ip% /user:%user% /pass:%pass%

C:\SysinternalsSuite\Psservice.exe \\%ip% -u %user% -p %pass% stop %service1%
C:\SysinternalsSuite\Psservice.exe \\%ip% -u %user% -p %pass% restart %service2%
C:\SysinternalsSuite\Psservice.exe \\%ip% -u %user% -p %pass% start %service1%

cmdkey.exe /delete:%ip%