module Ondas2
	class Aplicacao
		attr_reader :componentes
		attr_reader :janela
		def initialize
			@componentes = GrupoHashesObjs.new
		end
	
		def inicia
			cria_janela_principal
			cria_e_posiciona_outros_componentes
		end
		
		def cria_janela_principal
			@janela = self.usa :classe => JFrame,
							   :args => ['Visualizador de Ondas']
			@janela.set_size 305,273
			@janela.default_close_operation = JFrame::EXIT_ON_CLOSE
			@janela.content_pane.layout = nil
			@janela.resizable = false
			@janela.visible = true
		end
		
		def cria_e_posiciona_outros_componentes
			lbl_des_onda = self.usa :classe => JLabel, :args => ['Desenho da Onda']
			pnl_des = self.usa :classe => JPanel, :nome => 'desenho'
			pnl_des.background = Color::WHITE
			pnl_des.border = BorderFactory.create_line_border(Color::BLACK)
			
			lbl_amp = self.usa :classe => JLabel, :args => ['Amplitude']
			lbl_lam = self.usa :classe => JLabel, :args => ['Lambda']
			lbl_vel = self.usa :classe => JLabel, :args => ['Velocidade']
			lbl_freq = self.usa :classe => JLabel, :args => ['Frequencia']
			lbl_per = self.usa :classe => JLabel, :args => ['Periodo']
			
			txtf_amp = self.usa :classe => JTextField, :nome => 'amplitude'
			txtf_lam = self.usa :classe => JTextField, :nome => 'lambda'
			txtf_vel = self.usa :classe => JTextField, :nome => 'velocidade'
			txtf_freq = self.usa :classe => JTextField, :nome => 'frequencia'
			txtf_per = self.usa :classe => JTextField, :nome => 'periodo'
			
			btn_gerar = self.usa :classe => JButton, :args => ['Gerar Onda']
								
			lbl_des_onda.set_bounds(10 , 10 , 105, 14 )
			pnl_des.set_bounds	   (10 , 30 , 275, 120)
			lbl_amp.set_bounds	   (10 , 170, 70 , 14 )
			txtf_amp.set_bounds	   (80 , 170, 59 , 20 )
			lbl_lam.set_bounds	   (10 , 190, 70 , 14 )
			txtf_lam.set_bounds	   (80 , 190, 59 , 20 )
			lbl_vel.set_bounds	   (10 , 210, 70 , 14 )
			txtf_vel.set_bounds	   (80 , 210, 59 , 20 )
			lbl_freq.set_bounds	   (150, 170, 70 , 14 )
			txtf_freq.set_bounds   (220, 170, 59 , 20 )
			lbl_per.set_bounds	   (150, 190, 70 , 14 )
			txtf_per.set_bounds	   (220, 190, 59 , 20 )
			btn_gerar.set_bounds   (150, 210, 128, 19 )
		end
		
		
		def usa(args={})
			classe = args[:classe]
			nome = args[:nome]
			args_construtor = args[:args]
			
			comp = classe.method(:new).call(*args_construtor)
			
			nome = comp.text if nome.nil? and (classe == JButton or classe == JLabel)
			nome = comp.title if classe == JFrame and nome.nil?
			
			self.componentes.adiciona comp, nome
			@janela.content_pane.add comp if classe != JFrame and !@janela.nil?
			comp
		end
	end
end