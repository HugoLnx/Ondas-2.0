module Ondas2
	module Controladores
		class Observador
			include ActionListener
			
			alias old_initialize initialize
			def initialize(args=[])
				old_initialize
				@janela = args[:janela]
				@janela.componentes[:btn_gerar].add_action_listener self
				@janela.componentes[:timer].add_action_listener self
				@janela.componentes[:barra_menu].add_action_listener self
				@fabrica_ondas = args[:fabrica_ondas]
				@janela_about_ondas2 = Ondas2::Visoes::JanelaAboutOndas2.new :janela_mae => @janela,
																			 :modal => true
				@janela_about_desenvolvedor = Ondas2::Visoes::JanelaAboutDesenvolvedor.new :janela_mae => @janela,
																						   :modal => true
			end
		
			def action_performed(evento)
				case evento.source
				when @janela.componentes[:btn_gerar]
					clicou_botao_gerar
				when @janela.componentes[:timer]
					timer_disparou
				when @janela.componentes[:barra_menu].abas['Arquivo'].itens['Sair']
					@janela.dispose
				when @janela.componentes[:barra_menu].abas['Sobre'].itens['Ondas 2.0']
					@janela_about_ondas2.mostrar
				when @janela.componentes[:barra_menu].abas['Sobre'].itens['Desenvolvedor']
					@janela_about_desenvolvedor.mostrar
				end
			end
			
			def clicou_botao_gerar
				begin
					@janela.prepara_reinicializacao_do_timer
					@onda = @fabrica_ondas.fabrica_onda_com @janela.valores_dos_campos_de_texto
					@janela.limpa_notificacoes_de_erro
					@janela.atualiza_campos_de_texto_com @onda.propriedades
					@janela.reinicia_timer
				rescue Ondas2::Modelos::InfraE::OndaException => erro
					@janela.notifica_erro erro.mensagem_notificacao
				end
			end
			
			def timer_disparou
				ys = @onda.gerar_ys :tempo => @janela.componentes[:timer].tempo,
									:x_max => @janela.componentes[:pnl_des].width
				@janela.componentes[:pnl_des].pintar_onda_com ys
				@janela.componentes[:timer].incrementar_tempo
			end
		end
	end
end
