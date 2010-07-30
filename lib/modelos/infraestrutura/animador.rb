module Ondas2
	module Modelos
		module InfraE
			class Animador < java.lang.Thread
				alias old_initialize initialize
				def initialize(args={})
					old_initialize
					@onda = args[:onda]
					@painel = args[:painel]
					@tempo = 0.0
					@viva = true
				end
				
				def matar
					@painel.pintar_onda_com nil
					@viva = false
				end
				
				def run
					loop do
						if @viva
							ys = @onda.gerar_ys(:tempo => @tempo, :x_max => @painel.width)
							@painel.pintar_onda_com ys
							JThread.sleep 0.1
							@tempo += 0.1
						end
					end
				end
			end
		end
	end
end
