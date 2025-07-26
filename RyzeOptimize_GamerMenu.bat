@echo off
title RYZE OPTIMIZE - MODO GAMER 🎮
color 0A

:MENU
cls
echo ================================================
echo           RYZE OPTIMIZE - MODO GAMER 🎮
echo             Desenvolvido por Im Ryze
echo ================================================
echo [1] Otimizacao total para jogos
echo [2] Restaurar configuracoes padrao
echo [3] Sair
echo.
set /p op="Escolha uma opcao: "

if "%op%"=="1" goto OTIMIZAR
if "%op%"=="2" goto RESTAURAR
if "%op%"=="3" exit
goto MENU

:OTIMIZAR
echo =======================================
echo 🔧 APLICANDO OTIMIZACOES PARA JOGOS...
echo =======================================
:: Energia máxima
powercfg -setactive SCHEME_MIN

:: Input lag baixo
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d 20 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d 20 /f

:: Game DVR e Game Bar OFF
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 0 /f

:: Prioridade para jogos
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 26 /f

:: Timer resolution
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d 1 /f

:: Notificações OFF
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f

:: Preferência por GPU dedicada
reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "GpuPreference" /t REG_DWORD /d 2 /f

echo.
echo ✅ Otimizacao concluida com sucesso!
echo 🔁 Reinicie o PC para aplicar todas as alteracoes.
pause
goto MENU

:RESTAURAR
echo =======================================
echo 🔄 RESTAURANDO CONFIGURACOES ORIGINAIS...
echo =======================================

:: Restaurar Game DVR e Game Bar
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /f
reg delete "HKCU\System\GameConfigStore" /f
reg delete "HKCU\Software\Microsoft\GameBar" /f

:: Restaurar input lag padrão
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /f

:: Restaurar timer resolution padrão
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /f

:: Restaurar notificações
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /f

:: Restaurar prioridade padrão
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 2 /f

:: Restaurar preferência de GPU
reg delete "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "GpuPreference" /f

echo.
echo ✅ Restauracao concluida com sucesso!
echo 🔁 Reinicie o PC para retornar ao estado original.
pause
goto MENU
