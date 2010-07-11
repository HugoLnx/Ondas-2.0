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
		Dado que o usuario iniciou o programa

	# CASOS DE SUCESSO
	Cenario: Usuario nao preenche velocidade e o periodo
		Dado que a caixa de texto "amplitude" foi preenchida com "50"
		E que a caixa de texto "lambda" foi preenchida com "20"
		E que a caixa de texto "frequencia" foi preenchida com "10"
		E que clicaram no botao "Gerar Onda"
		Entao a "JTextField" "velocidade" deve ter o texto "200"
		E a "JTextField" "periodo" deve ter o texto "0.1"

	Cenario: Usuario nao preenche lambda e o periodo
		Dado que a caixa de texto "amplitude" foi preenchida com "50"
		E que a caixa de texto "velocidade" foi preenchida com "200"
		E que a caixa de texto "frequencia" foi preenchida com "10"
		E que clicaram no botao "Gerar Onda"
		Entao a "JTextField" "lambda" deve ter o texto "20"
		E a "JTextField" "periodo" deve ter o texto "0.1"
		
	Cenario: Usuario nao preenche velocidade e a frequencia
		Dado que a caixa de texto "amplitude" foi preenchida com "50"
		E que a caixa de texto "lambda" foi preenchida com "20"
		E que a caixa de texto "periodo" foi preenchida com "0.1"
		E que clicaram no botao "Gerar Onda"
		Entao a "JTextField" "velocidade" deve ter o texto "200"
		E a "JTextField" "frequencia" deve ter o texto "10"
		
	Cenario: Usuario nao preenche lambda e a frequencia
		Dado que a caixa de texto "amplitude" foi preenchida com "50"
		E que a caixa de texto "velocidade" foi preenchida com "200"
		E que a caixa de texto "periodo" foi preenchida com "0.1"
		E que clicaram no botao "Gerar Onda"
		Entao a "JTextField" "lambda" deve ter o texto "20"
		E a "JTextField" "frequencia" deve ter o texto "10"
		
	Cenario: Usuario nao preenche periodo e a frequencia
		Dado que a caixa de texto "amplitude" foi preenchida com "50"
		E que a caixa de texto "lambda" foi preenchida com "20"
		E que a caixa de texto "velocidade" foi preenchida com "200"
		E que clicaram no botao "Gerar Onda"
		Entao a "JTextField" "frequencia" deve ter o texto "10"
		E a "JTextField" "periodo" deve ter o texto "0.1"

	# CASOS DE FALHA
	Cenario: Usuario nao preenche nada
		E que clicaram no botao "Gerar Onda"
		Entao a "JLabel" "erros" deve ter o texto "Dados insuficientes para a criacao de uma onda."