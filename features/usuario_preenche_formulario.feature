# language:pt
Funcionalidade: Usuario preenche o formulario
	
	Para gerar a visualizacao de uma onda
	Como um usuario do sistema
	Devo preencher os campos e clicar no botao Gerar Onda
	
	
	amp - 50
	lam - 20
	vel - 200
	frq - 10
	per - 0.1
	
	Contexto:
		Dado que o usuario iniciou o programa
	
	Cenario: Usuario nao preenche lambda e a frequencia
		E que a caixa de texto "lambda" foi preenchida com "20"
		E que a caixa de texto "frequencia" foi preenchida com "10"
		Entao a caixa de texto "velocidade" deve ter o texto "200"
		E a caixa de texto "periodo" deve ter o texto "0.1"
