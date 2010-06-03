#language:pt
Funcionalidade: Onda calcula suas propriedades
	Para calcular minhas propriedades
	Como uma Onda
	Eu devo receber algumas propriedades do usuario
	
	Cenario: Usuario nao passa velocidade
		Dado que foi preenchida a "caixa de texto" "lambda" com "5"
		Dado que foi preenchida a "caixa de texto" "frequencia" com "2"
		Quando for pressionado o botao "Gerar Onda"
		E uma "onda" for criada
		Dado que a "onda" deve ter "5" de "lambda"
		E que a "onda" deve ter "2" de "frequencia"
		E que a "onda" deve ter "10" de "velocidade"