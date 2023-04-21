$Rede = Get-NetConnectionProfile

$Rede = $Rede.Name

#$Rede.GetType()
#Write-host $Rede

If($Rede -eq 'Nome_da_Rede'){
    powershell.exe -command "scriptFinal.ps1"
    #Write-host "Ta na rede"
}
    Else{
        #Write-host "Nao ta na rede"
        Stop-Process -ID $pid -Force
    }

Stop-Process -ID $pid -Force