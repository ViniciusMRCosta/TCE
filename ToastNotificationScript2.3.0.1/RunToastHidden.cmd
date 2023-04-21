REM This file is intended to be used when the toast notification script is used with scheduled tasks with the Hidden.vbs file. See the documentation for further details
@echo off

rem @echo Nome de usuario: %user:~7%

rem executa o arquivo New-ToastNotification.ps1 com umq configuração personalizada para cada usuário

powershell -command "Caminho do arquivo\New-ToastNotification.ps1" -Config "caminho do arquivo\config\%username%.xml"