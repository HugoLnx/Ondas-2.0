module Ondas2
	module Modelos
		module InfraE
			class Animador < java.lang.Thread
				alias old_initialize initialize
				def initialize(args={})
					old_initialize
					@onda = args[:onda]
					@painel = args[:painel]
					@tempo = 0
				end
				
				def run
					loop do
						@painel.repaint(:pontos => @onda.gerar_pontos)
					end
				end
			end
		end
	end
end