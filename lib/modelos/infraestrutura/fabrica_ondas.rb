module Ondas2
	module Modelos
		module InfraE
			class FabricaOndas
				def fabrica_onda_com(txtfs={})
					amp_val = txtfs[:amplitude].empty? ? nil : txtfs[:amplitude]
					lam_val = txtfs[:lambda].empty? ? nil : txtfs[:lambda]
					vel_val = txtfs[:velocidade].empty? ? nil : txtfs[:velocidade]
					freq_val = txtfs[:frequencia].empty? ? nil : txtfs[:frequencia]
					per_val = txtfs[:periodo].empty? ? nil : txtfs[:periodo]
					
					onda = Ondas2::Modelos::Onda.new :amplitude => amp_val,
													 :lambda => lam_val,
													 :velocidade => vel_val,
													 :frequencia => freq_val,
													 :periodo => per_val
					onda
				end
			end
		end
	end
end