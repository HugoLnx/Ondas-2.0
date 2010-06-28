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