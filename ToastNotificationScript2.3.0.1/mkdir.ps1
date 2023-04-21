#powershell.exe -WindowStyle hidden -command mkdir -Path "C:\Windows\Scripts" 
#powershell.exe -WindowStyle hidden -command mkdir -Path "$env:userprofile\Scripts" 
powershell.exe -WindowStyle hidden -command Copy-Item -Path "\\caminho de rede do arquivo\Start.vbs" -Destination "Destino\Start.vbs" -force
powershell.exe -WindowStyle hidden -command Copy-Item -Path "\\caminho de rede do arquivo\CheckNet.ps1" -Destination "Destino\CheckNet.ps1" -force