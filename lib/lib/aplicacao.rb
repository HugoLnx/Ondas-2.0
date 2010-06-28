module Ondas2
	class Aplicacao
		attr_reader :componentes
		def initialize
			@componentes = GrupoHashesObjs.new
		end
	
		def inicia
		end
	end
end