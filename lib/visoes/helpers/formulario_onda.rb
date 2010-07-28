module Ondas2
	module Visoes
		module Helpers
			class FormularioOnda < Container
				alias old_initialize initialize
				def initialize(args={})
					old_initialize
					@componentes = args[:componentes]
					@coluna_atual = -1
					inicializa_layout
					posiciona_componentes
				end
				
				def inicializa_layout
					self.layout = GridBagLayout.new
					@gbc = GridBagConstraints.new
					@gbc.gridx = 0
					@gbc.gridy = 0
					@gbc.gridwidth = 2
					@gbc.gridheight = 1
					@gbc.fill = GridBagConstraints::HORIZONTAL
					@gbc.weightx = 1
				end
				
				def posiciona_componentes
					self.add @componentes[:lbl_erros], @gbc
					
					add_coluna do
						add_linha @componentes[:lbl_amp]
						add_linha @componentes[:txtf_amp]
						add_linha @componentes[:lbl_lam]
						add_linha @componentes[:txtf_lam]
						add_linha @componentes[:lbl_vel]
						add_linha @componentes[:txtf_vel]
					end
					
					add_coluna :afastar do
						add_linha @componentes[:lbl_freq]
						add_linha @componentes[:txtf_freq]
						add_linha @componentes[:lbl_per]
						add_linha @componentes[:txtf_per]
						add_linha
						@gbc.fill = GridBagConstraints::BOTH
						@gbc.ipady = -10
						add_linha @componentes[:btn_gerar]
					end
				end
				
				def add_coluna(afastar=false,&block)
					@gbc.gridx += 1 if afastar
					@gbc.gridwidth = 1
					@gbc.gridy = 1
					yield
				end

				def add_linha(componente=nil)
					@gbc.gridy += 1
					self.add componente, @gbc unless componente.nil?
				end
				
			end
		end
	end
end