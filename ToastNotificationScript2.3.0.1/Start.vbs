On Error Resume Next
command = "powershell.exe -nologo -command caminho do arquivo local\CheckNet.ps1"
set shell = CreateObject("WScript.Shell")
shell.Run command,0
