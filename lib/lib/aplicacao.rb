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
			@janela.visible = true
			
			self.usa :classe => JLabel,
					 :args => ['Desenho da Onda']
					 
		end
		
		def usa(args={})
			classe = args[:classe]
			nome = args[:nome]
			args_construtor = args[:args]
			
			comp = classe.method(:new).call(*args_construtor)
			
			nome = comp.text if classe == JLabel and nome.nil?
			nome = comp.title if classe == JFrame and nome.nil?
			self.componentes.adiciona comp, nome
			@janela.add comp if classe != JFrame
			comp
		end
	end
end