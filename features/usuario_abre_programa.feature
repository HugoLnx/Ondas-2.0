# language:pt
@abrir
Funcionalidade: Usuario abre o programa
	Para usufruir das funcionalidades do programa
	Como um usuario
	Devo visualizar sua janela e componentes da mesma
	
	Cenario: Usuario abre a janela
		Dado que inicio o programa
		E devo vizualizar a "JLabel" "Desenho da Onda"
		E devo vizualizar o "PainelVisualizacao" "desenho"
		E devo vizualizar a "JLabel" "Amplitude"
		E devo vizualizar o "JTextField" "amplitude"
		E devo vizualizar a "JLabel" "Lambda"
		E devo vizualizar o "JTextField" "lambda"
		E devo vizualizar a "JLabel" "Velocidade"
		E devo vizualizar o "JTextField" "velocidade"
		E devo vizualizar a "JLabel" "Frequencia"
		E devo vizualizar o "JTextField" "frequencia"
		E devo vizualizar a "JLabel" "Periodo"
		E devo vizualizar o "JTextField" "periodo"
		E devo vizualizar o "JButton" "Gerar Onda"
		E devo vizualizar a "BarraMenu" "barra_menu"
		E devo vizualizar as abas: "Arquivo,Sobre"
