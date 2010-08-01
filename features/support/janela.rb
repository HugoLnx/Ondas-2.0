module Ondas2
	module Visoes
		class Janela
			attr_reader :_componentes
		
			alias old_initialize initialize
			def initialize
				old_initialize
				@_componentes = {}
				adicionar_componentes
			end

			def adicionar_componentes
				self.adiciona @pnl_vis, 'desenho'
				self.adiciona @barra_menu, 'barra_menu'
				self.adiciona @lbl_des_onda, 'Desenho da Onda'
				self.adiciona @lbl_amp, 'Amplitude'
				self.adiciona @lbl_lam, 'Lambda'
				self.adiciona @lbl_vel, 'Velocidade'
				self.adiciona @lbl_freq, 'Frequencia'
				self.adiciona @lbl_per, 'Periodo'
				self.adiciona @lbl_erros, 'erros'
				self.adiciona @txtf_amp, 'amplitude'
				self.adiciona @txtf_lam, 'lambda'
				self.adiciona @txtf_vel, 'velocidade'
				self.adiciona @txtf_freq, 'frequencia'
				self.adiciona @txtf_per, 'periodo'
				self.adiciona @btn_gerar, 'Gerar Onda'
			end
		
			def adiciona(objeto,nome)
				class_s = objeto.class.to_s.split('::').last
				@_componentes[class_s] ||= {}
				@_componentes[class_s][nome] = objeto
			end
	
			def o_componente_de_classe_e_nome(classe,nome)
				@_componentes[classe][nome]
			end
		end
	end
end
