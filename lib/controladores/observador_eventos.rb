module Ondas2
	module Controladores
		class ObservadorEventos
			include ActionListener
		
			def initialize(aplicacao)
				@app = aplicacao
				botao_gerar = @app.componentes.o_de_classe_e_nome 'JButton', 'Gerar Onda'
				botao_gerar.add_action_listener self
			end
		
			def action_performed(evento)
				botao_gerar = @app.componentes.o_de_classe_e_nome 'JButton', 'Gerar Onda'
				if evento.source == botao_gerar
					@app.gera_onda
				end
			end
		end
	end
end
