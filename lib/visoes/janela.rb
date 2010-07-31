module Ondas2
	module Visoes
		class Janela < JFrame
			def initialize
				super
				inicializar_atributos
				criar_componentes
				posicionar_componentes
				self.visible = true unless $modo_teste
			end
			
			def inicializar_atributos
				self.title = 'Visualizador de Ondas'
				self.set_size 400,340
				self.resizable = false
				self.default_close_operation = JFrame::EXIT_ON_CLOSE
				self.content_pane.layout = BorderLayout.new
				borda_invisivel = BorderFactory.create_empty_border(6,6,6,6)
				self.content_pane.border = borda_invisivel
			
				icone = ImageIcon.new 'images/ondas2.png'
				self.icon_image = icone.image
			end
			
			def criar_componentes
					criar_menu
					criar_labels
					criar_text_fields
					@pnl_des = Ondas2::Visoes::Helpers::PainelVisualizacao.new
					@pnl_des.background = Color::WHITE
					@pnl_des.border = BorderFactory.create_line_border(Color::BLACK)
					@timer = Helpers::PainelTimer.new :delay => 50
				
					@btn_gerar = JButton.new 'Gerar Onda'
				end

				def criar_menu
					@barra_menu = Ondas2::Visoes::Helpers::BarraMenu.new do |barra|
						barra.add_aba 'Arquivo' do |arq_aba|
							arq_aba.add_item 'Salvar como...'
							arq_aba.add_item 'Visualizacao Externa'
							arq_aba.add_item 'Sair'
						end
						barra.add_aba 'Sobre' do |aba_about|
							aba_about.add_item 'Ondas 2.0'
							aba_about.add_item 'Desenvolvedor'
						end
					end
					self.jmenu_bar = @barra_menu
				end
				
				def criar_labels
					@lbl_des_onda = JLabel.new 'Desenho da Onda'
					@lbl_amp = JLabel.new 'Amplitude'
					@lbl_lam = JLabel.new 'Lambda'
					@lbl_vel = JLabel.new 'Velocidade'
					@lbl_freq = JLabel.new 'Frequencia'
					@lbl_per = JLabel.new 'Periodo'
					@lbl_erros = JLabel.new ' '
					@lbl_erros.foreground = Color::RED
				end
				
				def criar_text_fields
					@txtf_amp = JTextField.new
					@txtf_lam = JTextField.new
					@txtf_vel = JTextField.new
					@txtf_freq = JTextField.new
					@txtf_per = JTextField.new
				end
			
			def posicionar_componentes
				posicionar_nos_sentidos :norte => @lbl_des_onda,
										:centro => @pnl_des,
										:sul => Helpers::FormularioOnda.new(:componentes => self.componentes)
			end
			
			def posicionar_nos_sentidos(sentidos={})
				pane = self.content_pane
				pane.add sentidos[:norte], BorderLayout::NORTH
				pane.add sentidos[:centro], BorderLayout::CENTER
				pane.add sentidos[:sul], BorderLayout::SOUTH
			end
			
			def componentes
				{
					:lbl_des_onda => @lbl_des_onda,
					:lbl_amp => @lbl_amp,
					:lbl_lam => @lbl_lam,
					:lbl_vel => @lbl_vel,
					:lbl_freq => @lbl_freq,
					:lbl_per => @lbl_per,
					:lbl_erros => @lbl_erros,
					
					:txtf_amp => @txtf_amp,
					:txtf_lam => @txtf_lam,
					:txtf_vel => @txtf_vel,
					:txtf_freq => @txtf_freq,
					:txtf_per => @txtf_per,
					
					:btn_gerar => @btn_gerar,
					:pnl_des => @pnl_des,
					
					:timer => @timer,
					
					:barra_menu => @barra_menu
				}
			end
			
			def valores_dos_campos_de_texto
				{
					:amplitude => @txtf_amp.text,
					:lambda => @txtf_lam.text,
					:velocidade => @txtf_vel.text,
					:frequencia => @txtf_freq.text,
					:periodo => @txtf_per.text,
				}
			end
			
			def notifica_erro(mensagem)
				@lbl_erros.text = mensagem
			end
			
			def limpa_notificacoes_de_erro
				@lbl_erros.text = ' '
			end
			
			def atualiza_campos_de_texto_com(novo_valor_para={})
				@txtf_amp.text = novo_valor_para[:amplitude].to_s
				@txtf_lam.text = novo_valor_para[:lambda].to_s
				@txtf_vel.text = novo_valor_para[:velocidade].to_s
				@txtf_freq.text = novo_valor_para[:frequencia].to_s
				@txtf_per.text = novo_valor_para[:periodo].to_s
			end
			
			def prepara_reinicializacao_do_timer
				@timer.stop
				@pnl_des.limpar
			end
			
			def reinicia_timer
				@timer.start
			end
		end
	end
end
