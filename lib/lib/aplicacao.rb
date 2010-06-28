module Ondas2
	class Aplicacao
		attr_reader :componentes
		def self.inicia
			@componentes = Componentes.new
		end
	end
end