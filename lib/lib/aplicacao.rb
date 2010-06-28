module Ondas2
	class Aplicacao
		attr_reader :componentes
		def initialize
			@componentes = GrupoHashesObjs.new
		end
	
		def inicia
		end
		
		def usa(args={})
			classe = args[:classe]
			nome = args[:nome]
			args_construtor = args[:args]
			
			comp = classe.method(:new).call(*args_construtor)
			self.componentes.adiciona comp, nome
		end
	end
end