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
	Cenario: Usuario nao preenche a velocidade e o periodo
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "lambda" com "20"
		E que preencho a caixa de texto "frequencia" com "10"
		Quando clico no botao "Gerar Onda"
		Entao vejo "200" na "JTextField" "velocidade"
		E vejo "0.1" na "JTextField" "periodo"

	Cenario: Usuario nao preenche o lambda e o periodo
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "velocidade" com "200"
		E que preencho a caixa de texto "frequencia" com "10"
		Quando clico no botao "Gerar Onda"
		Entao vejo "20" na "JTextField" "lambda"
		E vejo "0.1" na "JTextField" "periodo"
		
	Cenario: Usuario nao preenche a velocidade e a frequencia
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "lambda" com "20"
		E que preencho a caixa de texto "periodo" com "0.1"
		Quando clico no botao "Gerar Onda"
		Entao vejo "200" na "JTextField" "velocidade"
		E vejo "10" na "JTextField" "frequencia"
		
	Cenario: Usuario nao preenche o lambda e a frequencia
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "velocidade" com "200"
		E que preencho a caixa de texto "periodo" com "0.1"
		Quando clico no botao "Gerar Onda"
		Entao vejo "20" na "JTextField" "lambda"
		E vejo "10" na "JTextField" "frequencia"
		
	Cenario: Usuario nao preenche o periodo e a frequencia
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "lambda" com "20"
		E que preencho a caixa de texto "velocidade" com "200"
		Quando clico no botao "Gerar Onda"
		Entao vejo "10" na "JTextField" "frequencia"
		E vejo "0.1" na "JTextField" "periodo"

	# CASOS DE FALHA
	# FALHA = DADOS INSUFICIENTES
	Cenario: Usuario preenche a amplitude
		E que preencho a caixa de texto "amplitude" com "50"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Dados insuficientes para a criacao de uma onda." na "JLabel" "erros"
		
	Cenario: Usuario preenche a amplitude e o lambda
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "lambda" com "20"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Dados insuficientes para a criacao de uma onda." na "JLabel" "erros"
		
	Cenario: Usuario preenche a amplitude e a velocidade
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "velocidade" com "200"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Dados insuficientes para a criacao de uma onda." na "JLabel" "erros"

	Cenario: Usuario preenche a amplitude e a frequencia
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "frequencia" com "10"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Dados insuficientes para a criacao de uma onda." na "JLabel" "erros"
		
	Cenario: Usuario preenche a amplitude e o periodo
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "periodo" com "0.1"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Dados insuficientes para a criacao de uma onda." na "JLabel" "erros"
		
	Cenario: Usuario preenche a amplitude e a frequencia e o periodo
		Dado que preencho a caixa de texto "amplitude" com "50"
		E que preencho a caixa de texto "frequencia" com "10"
		E que preencho a caixa de texto "periodo" com "0.1"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Dados insuficientes para a criacao de uma onda." na "JLabel" "erros"
		
	# FALHA = FALTA AMPLITUDE		
	Cenario: Usuario nao preenche nada
		Quando clico no botao "Gerar Onda"
		Entao vejo "Informe o valor da Amplitude." na "JLabel" "erros"
	
	Cenario: Usuario nao preenche a amplitude
		Dado que preencho a caixa de texto "lambda" com "20"
		E que preencho a caixa de texto "velocidade" com "200"
		E que preencho a caixa de texto "frequencia" com "10"
		E que preencho a caixa de texto "periodo" com "0.1"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Informe o valor da Amplitude." na "JLabel" "erros"
	
	Cenario: Usuario preenche o lambda
		E que preencho a caixa de texto "lambda" com "20"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Informe o valor da Amplitude." na "JLabel" "erros"
		
	Cenario: Usuario preenche a velocidade
		E que preencho a caixa de texto "velocidade" com "200"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Informe o valor da Amplitude." na "JLabel" "erros"

	Cenario: Usuario preenche a frequencia
		E que preencho a caixa de texto "frequencia" com "10"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Informe o valor da Amplitude." na "JLabel" "erros"
		
	Cenario: Usuario preenche o periodo
		E que preencho a caixa de texto "periodo" com "0.1"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Informe o valor da Amplitude." na "JLabel" "erros"
		
	Cenario: Usuario preenche a frequencia e o periodo
		E que preencho a caixa de texto "frequencia" com "10"
		E que preencho a caixa de texto "periodo" com "0.1"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Informe o valor da Amplitude." na "JLabel" "erros"

	# FALHA = LETRAS	
	Cenario: Usuario preenche a amplitude com letras
		E que preencho a caixa de texto "amplitude" com "50fs"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Preencha os campos somente com numeros." na "JLabel" "erros"
	
	Cenario: Usuario preenche o lambda com letras
		E que preencho a caixa de texto "lambda" com "20fs"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Preencha os campos somente com numeros." na "JLabel" "erros"
		
	Cenario: Usuario preenche a velocidade com letras
		E que preencho a caixa de texto "velocidade" com "200fas"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Preencha os campos somente com numeros." na "JLabel" "erros"

	Cenario: Usuario preenche a frequencia com letras
		E que preencho a caixa de texto "frequencia" com "1s0gds"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Preencha os campos somente com numeros." na "JLabel" "erros"
		
	Cenario: Usuario preenche o periodo com letras
		E que preencho a caixa de texto "periodo" com "0.1ds"
		Quando clico no botao "Gerar Onda"
		Entao vejo "Preencha os campos somente com numeros." na "JLabel" "erros"