# TCE
Repositório criado para hospedar meu primeiro trabalho de conclusão de estágio.

Em resumo esse projeto gera um notificação personalizada para cada usuário para que ele possa responder a uma pesquisa de satisfação referente à qualidade do atendimento de um técnico durante um chamado.

Os arquivos CheckNet.ps1 e Start.vbs devem ficar armazenados localmente nos computadores. Os demais arquivos podem ficar armazenados em uma máquina virtual. Nesse projeto foi utilizada uma GPO para configurar os arquivos localmente e para executar a notificação nos computadores de cada usuário.

Outras ferramentas utilizadas foram o agendador de tarefas do Windows e o Python.

Foi criado um script em python (script.py) que é reponsável por acessar um banco de dados, nesse caso um mariadb, executar uma query e retornar os usuários que tem uma pesquisa de satisfação pendente de resposta e a chave para a pesquisa. Esse resultado é armazenado em um arquivo XML (chaves.xml).

O processo para geração da notificação começa com a o agendador de tarefas executando o Start.vbs que executa o CheckNet.ps1 em segundo plano. O script powershell verifica se o computador está conectado na rede corporativa antes de gerar a notificação.

Caso esteja ele executa o scriptFinal.ps1 que é responsável por verificar o usuário que está logado no computador e verificar se o nome está no arquivo. Caso o nome seja encontrado o script irá alterar o arquivo de configuração XML personalizado com o nome do usuário e irá executar um batch file (wscript.cmd). Ao final irá fechar a janela do powershell que está aberta em segundo plano.

Esse arquivo irá executar um outro arquivo .cmd (RunToastHidden.cmd) em segundo plano (Hidden.vbs).

O RunToastHidden.cmd irá executar o arquivo padrão da notificaçao com a configuração XML personalizada e a notificação será gerada.

Os arquivos mapping.cmd, unmapping.cmd e mkdir.ps1 são arquivos auxiliares.

O mapping.cmd e o unmapping.cmd mapeiam e retiram o mapeamento de uma unidade de rede à uma Unidade Local do computador a sua escolha.

O mkdir.ps1 juntamente com uma GPO armazenou os arquivos CheckNet.ps1 e Start.vbs localmente nos computadores.