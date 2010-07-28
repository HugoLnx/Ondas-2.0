module Ondas2
	module Modelos
		module InfraE
			module App
				def self.iniciar
					janela = Ondas2::Visoes::Janela.new
					fabrica_ondas = Ondas2::Modelos::InfraE::FabricaOndas.new
					Ondas2::Controladores::Observador.new(:janela => janela,
														  :fabrica_ondas => fabrica_ondas)
					janela if $modo_teste
				end
			end
		end
	end
end