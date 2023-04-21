# OBTER USUARIO QUE ESTA NO COMPUTADOR
$UsuarioDominio = whoami
$UsuarioDominio = $UsuarioDominio.Split("\")

$Usuario = $UsuarioDominio[1] 

#Write-Host $Usuario


#VERIFICAR SE O NOME DO USUÁRIO ESTA NO ARQUIVO

$fileKeys = "caminho do arquivo\chaves.xml"


$xmlKey = New-Object XML


$xmlKey = Get-content($fileKeys)
#Write-Host $xmlKey

$pendente = $False

foreach ($line in $xmlKey){
    $i = 2 #('a...
    $nome = $null
    while ($line[$i] -ne 'separador criado na query, : '){
        #Write-Host $line[$i] -NoNewline
        $nome += $line[$i]
        $i += 1
    }

    if ($nome -eq $Usuario){
        #Write-Host $nome
        
        $i += 1
        $Key = $null
        while ($line[$i] -ne "'"){
            $Key += $line[$i]
            $i += 1
        }
        #Write-Host $Key


        #CRIAR ARQUIVO DE CONFIGURAÇÃO PERSONALIZADO COM O NOME DO USUÁRIO
        powershell.exe -command Copy-Item -Path "caminho do arquivo\config-toast-feedback.xml" -Destination "caminho do arquivo de rede\config\$Usuario.xml" -force
        

        #ALTERAR A CHAVE DA PESQUISA NO ARQUIVO DO USUARIO E EXECUTAR A NOTIFICAÇÃO
        $filePath = "caminho do arquivo\config\$Usuario.xml"
        
        $xml = New-Object XML
        $xml.Load($filePath)
        $node = $xml.SelectSingleNode("//Configuration/Option[@Name='Action1']/@Value")
        $link = "URL.....=$Key" #url onde no final vem uma chave
        $node.InnerText = "$link"
        $xml.Save($filePath) 
        powershell.exe -command "caminho do arquivo\wscript.cmd"
        
        $pendente = $True
        break
    }

    else{
        continue
    }

}
if($pendente -eq $False){
    Write-Host "Voce nao possui pesquisa pendente"
    Stop-Process -ID $pid -Force
}

Stop-Process -ID $pid -Force