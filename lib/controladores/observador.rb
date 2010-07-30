module Ondas2
	module Controladores
		class Observador
			include ActionListener
			
			alias old_initialize initialize
			def initialize(args=[])
				old_initialize
				@janela = args[:janela]
				@janela.componentes[:btn_gerar].add_action_listener self
				@fabrica_ondas = args[:fabrica_ondas]
			end
		
			def action_performed(evento)
				#if evento.source == @janela.componentes.btn_gerar
				clicou_botao_gerar
				#end
			end
			
			def clicou_botao_gerar
				begin
					@animador.matar unless @animador.nil?
					@onda = @fabrica_ondas.fabrica_onda_com @janela.valores_dos_campos_de_texto
					@janela.limpa_notificacoes_de_erro
					@janela.atualiza_campos_de_texto_com @onda.propriedades
					@animador = Ondas2::Modelos::InfraE::Animador.new :onda => @onda,
																														:painel => @janela.componentes[:pnl_des]
					@animador.start
				rescue Ondas2::Modelos::InfraE::OndaException => erro
					@janela.notifica_erro erro.mensagem_notificacao
				end
			end
		end
	end
end
