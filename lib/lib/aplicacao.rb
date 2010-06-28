module Ondas2
	class Aplicacao
		attr_reader :componentes
		attr_reader :janela
		def initialize
			@componentes = GrupoHashesObjs.new
		end
	
		def inicia
			@janela = self.usa :classe => JFrame,
							   :args => ['Visualizador de Ondas']
			@janela.set_size 500,500
			@janela.default_close_operation = JFrame::EXIT_ON_CLOSE
			@janela.resizable = false
			@janela.visible = true
			
			vboxp = Box.create_vertical_box
			
			lbl_des_onda = self.usa :classe => JLabel,
									:args => ['Desenho da Onda']
			vboxp.add lbl_des_onda
			
			pnl_des = self.usa :classe => JPanel,
							   :nome => 'desenho'
			pnl_des.set_size 480,200
			pnl_des.background = Color::WHITE
			vboxp.add pnl_des
						
			vbox1 = Box.create_vertical_box
			
			lbl_amp = self.usa :classe => JLabel,
							   :args => ['Amplitude']
			txtf_amp = self.usa :classe => JTextField,
								:nome => 'amplitude'
			vbox1.add lbl_amp
			vbox1.add txtf_amp
			
			lbl_lam = self.usa :classe => JLabel,
							   :args => ['Lambda']
			txtf_lam = self.usa :classe => JTextField,
								:nome => 'lambda'
			vbox1.add lbl_lam
			vbox1.add txtf_lam
			
			lbl_vel = self.usa :classe => JLabel,
							   :args => ['Velocidade']
			txtf_vel = self.usa :classe => JTextField,
								:nome => 'velocidade'
			vbox1.add lbl_vel
			vbox1.add txtf_vel
			
			vbox2 = Box.create_vertical_box
			
			lbl_freq = self.usa :classe => JLabel,
							   :args => ['Frequencia']
			txtf_freq = self.usa :classe => JTextField,
								:nome => 'frequencia'
			vbox2.add lbl_freq
			vbox2.add txtf_freq
			
			lbl_per = self.usa :classe => JLabel,
							   :args => ['Periodo']
			txtf_per = self.usa :classe => JTextField,
								:nome => 'periodo'
			vbox2.add lbl_per
			vbox2.add txtf_per
			
			hbox = Box.create_horizontal_box
			
			hbox.add vbox1
			hbox.add vbox2
			vboxp.add hbox
			@janela.add vboxp
					 
		end
		
		def usa(args={})
			classe = args[:classe]
			nome = args[:nome]
			args_construtor = args[:args]
			
			comp = classe.method(:new).call(*args_construtor)
			
			nome = comp.text if classe == JLabel and nome.nil?
			nome = comp.title if classe == JFrame and nome.nil?
			self.componentes.adiciona comp, nome
			comp
		end
	end
end