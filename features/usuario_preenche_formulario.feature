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
	
	Cenario: Usuario nao preenche velocidade e o periodo
		Dado que a caixa de texto "amplitude" foi preenchida com "50"
		E que a caixa de texto "lambda" foi preenchida com "20"
		E que a caixa de texto "frequencia" foi preenchida com "10"
		E que clicaram no botao "Gerar Onda"
		Entao a caixa de texto "velocidade" deve ter o texto "200"
		E a caixa de texto "periodo" deve ter o texto "0.1"

	Cenario: Usuario nao preenche lambda e o periodo
		Dado que a caixa de texto "amplitude" foi preenchida com "50"
		E que a caixa de texto "velocidade" foi preenchida com "200"
		E que a caixa de texto "frequencia" foi preenchida com "10"
		E que clicaram no botao "Gerar Onda"
		Entao a caixa de texto "lambda" deve ter o texto "20"
		E a caixa de texto "periodo" deve ter o texto "0.1"
		
	Cenario: Usuario nao preenche velocidade e a frequencia
		Dado que a caixa de texto "amplitude" foi preenchida com "50"
		E que a caixa de texto "lambda" foi preenchida com "20"
		E que a caixa de texto "periodo" foi preenchida com "0.1"
		E que clicaram no botao "Gerar Onda"
		Entao a caixa de texto "velocidade" deve ter o texto "200"
		E a caixa de texto "frequencia" deve ter o texto "10"
		
	Cenario: Usuario nao preenche lambda e a frequencia
		Dado que a caixa de texto "amplitude" foi preenchida com "50"
		E que a caixa de texto "velocidade" foi preenchida com "200"
		E que a caixa de texto "periodo" foi preenchida com "0.1"
		E que clicaram no botao "Gerar Onda"
		Entao a caixa de texto "lambda" deve ter o texto "20"
		E a caixa de texto "frequencia" deve ter o texto "10"
		
	Cenario: Usuario nao preenche periodo e a frequencia
		Dado que a caixa de texto "amplitude" foi preenchida com "50"
		E que a caixa de texto "lambda" foi preenchida com "20"
		E que a caixa de texto "velocidade" foi preenchida com "200"
		E que clicaram no botao "Gerar Onda"
		Entao a caixa de texto "frequencia" deve ter o texto "10"
		E a caixa de texto "periodo" deve ter o texto "0.1"