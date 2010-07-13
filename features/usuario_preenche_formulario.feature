# language:pt
#	amp - 50
#	lam - 20
#	vel - 200
#	frq - 10
#	per - 0.1
@preenche
Funcionalidade: Usuario preenche o formulario
	
	Para gerar a visualizacao de uma onda
	Como um usuario do sistema
	Devo preencher os campos e clicar no botao Gerar Onda
	
	Contexto:
		Dado que inicio o programa

	# CASOS DE SUCESSO
	Cenario: Usuario nao preenche velocidade e o periodo
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "lambda" com "20"
		E que preencho a caixa de texto "frequencia" com "10"
		Quando clico no botao "Gerar Onda"
		Entao vejo "200" na "JTextField" "velocidade"
		E vejo "0.1" na "JTextField" "periodo"

	Cenario: Usuario nao preenche lambda e o periodo
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "velocidade" com "200"
		E que preencho a caixa de texto "frequencia" com "10"
		Quando clico no botao "Gerar Onda"
		Entao vejo "20" na "JTextField" "lambda"
		E vejo "0.1" na "JTextField" "periodo"
		
	Cenario: Usuario nao preenche velocidade e a frequencia
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "lambda" com "20"
		E que preencho a caixa de texto "periodo" com "0.1"
		Quando clico no botao "Gerar Onda"
		Entao vejo "200" na "JTextField" "velocidade"
		E vejo "10" na "JTextField" "frequencia"
		
	Cenario: Usuario nao preenche lambda e a frequencia
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "velocidade" com "200"
		E que preencho a caixa de texto "periodo" com "0.1"
		Quando clico no botao "Gerar Onda"
		Entao vejo "20" na "JTextField" "lambda"
		E vejo "10" na "JTextField" "frequencia"
		
	Cenario: Usuario nao preenche periodo e a frequencia
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "lambda" com "20"
		E que preencho a caixa de texto "velocidade" com "200"
		Quando clico no botao "Gerar Onda"
		Entao vejo "10" na "JTextField" "frequencia"
		E vejo "0.1" na "JTextField" "periodo"

	# CASOS DE FALHA
	Cenario: Usuario nao preenche nada
		Quando clico no botao "Gerar Onda"
		Entao vejo "Dados insuficientes para a criacao de uma onda." na "JLabel" "erros"