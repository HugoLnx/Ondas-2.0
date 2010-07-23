module Ondas2
	module Modelos
		module InfraE
			class Aplicacao
				attr_reader :componentes
				attr_reader :janela
				attr_reader :onda
				def initialize
					@componentes = Ondas2::Visoes::Helpers::Componentes.new
				end
	
				def inicia(args={})
					em_teste = args[:teste]
		
					@janela = self.usa(:classe => Ondas2::Visoes::Janela, 
										 :args => [{:app_mae => self, 
												 :titulo => 'Visualizador de Ondas'}])
					cria_e_posiciona_outros_componentes
					observador = Ondas2::Controladores::ObservadorEventos.new self
					@janela.visible = true unless em_teste
				end
		
				def cria_e_posiciona_outros_componentes
					barra_menu = self.usa :classe => Ondas2::Visoes::Helpers::BarraMenu, 
											:nome => 'barra_menu' do |barra|
						barra.add_aba 'Arquivo' do |arq_aba|
							arq_aba.add_item 'Salvar como...'
							arq_aba.add_item 'Visualizacao Externa'
							arq_aba.add_item 'Sair'
						end
						barra.add_aba 'About' do |aba_about|
							aba_about.add_item 'Ondas 2.0'
							aba_about.add_item 'Desenvolvedor'
						end
					end
			
					lbl_des_onda = self.usa :classe => JLabel, :args => 'Desenho da Onda'
			
					pnl_des = self.usa :classe =>  Ondas2::Visoes::Helpers::PainelDesenho, :nome => 'desenho'
					pnl_des.janela_mae = self.janela
					thread = JThread.new pnl_des
					thread.start
			
					pnl_des.background = Color::WHITE
					pnl_des.border = BorderFactory.create_line_border(Color::BLACK)
			
					lbl_amp = self.usa :classe => JLabel, :args => 'Amplitude'
					lbl_lam = self.usa :classe => JLabel, :args => 'Lambda'
					lbl_vel = self.usa :classe => JLabel, :args => 'Velocidade'
					lbl_freq = self.usa :classe => JLabel, :args => 'Frequencia'
					lbl_per = self.usa :classe => JLabel, :args => 'Periodo'
			
					lbl_erros = self.usa :classe => JLabel, :args => 'erros'
					lbl_erros.text = ' '
					lbl_erros.foreground = Color::RED
			
					txtf_amp = self.usa :classe => JTextField, :nome => 'amplitude'
					txtf_lam = self.usa :classe => JTextField, :nome => 'lambda'
					txtf_vel = self.usa :classe => JTextField, :nome => 'velocidade'
					txtf_freq = self.usa :classe => JTextField, :nome => 'frequencia'
					txtf_per = self.usa :classe => JTextField, :nome => 'periodo'
			
					btn_gerar = self.usa :classe => JButton, :args => 'Gerar Onda'
					
					pane = @janela.content_pane
					pane.add lbl_des_onda, BorderLayout::NORTH
					pane.add pnl_des, BorderLayout::CENTER
					pane.border = BorderFactory.create_empty_border(6,6,6,6)
			
					form = Container.new
					form.layout = GridBagLayout.new
			
					gbc = GridBagConstraints.new
			
					gbc.gridx = 0
					gbc.gridy = 0
					gbc.gridwidth = 2
					gbc.gridheight = 1
					gbc.fill = GridBagConstraints::HORIZONTAL
					gbc.weightx = 1
					form.add lbl_erros, gbc
			
					gbc.gridwidth = 1
					gbc.gridy +=1
					form.add lbl_amp, gbc
			
					gbc.gridy +=1
					form.add txtf_amp, gbc
			
					gbc.gridy +=1
					form.add lbl_lam, gbc
			
					gbc.gridy +=1
					form.add txtf_lam, gbc
			
					gbc.gridy +=1
					form.add lbl_vel, gbc
			
					gbc.gridy +=1
					form.add txtf_vel, gbc
			
					gbc.gridy = 1
					gbc.gridx += 1
					form.add lbl_freq, gbc
			
					gbc.gridy +=1
					form.add txtf_freq, gbc
			
					gbc.gridy += 1
					form.add lbl_per, gbc
			
					gbc.gridy +=1
					form.add txtf_per, gbc
			
					gbc.gridy +=2
					gbc.gridheight = 1
					gbc.fill = GridBagConstraints::BOTH
					gbc.ipady = -10
					form.add btn_gerar, gbc
			
					pane.add form, BorderLayout::SOUTH
				end
		
				def usa(args={},&block)
					classe = args[:classe]
					nome = args[:nome]
					args_construtor = args[:args]
			
					if args_construtor.nil?
						comp = classe.method(:new).call(&block)
					else
						comp = classe.method(:new).call(*args_construtor,&block)
					end
			
					nome = comp.text if nome.nil? and (comp.kind_of? JButton or comp.kind_of? JLabel)
					nome = comp.title if comp.kind_of? JFrame and nome.nil?
			
					self.componentes.adiciona comp, nome
					comp
				end
		
				def gera_onda
					txtfs = {:amplitude => self.componentes.o_de_classe_e_nome('JTextField', 'amplitude'),
							 :lambda => self.componentes.o_de_classe_e_nome('JTextField', 'lambda'),
							 :velocidade => self.componentes.o_de_classe_e_nome('JTextField', 'velocidade'),
							 :frequencia => self.componentes.o_de_classe_e_nome('JTextField', 'frequencia'),
							 :periodo => self.componentes.o_de_classe_e_nome('JTextField', 'periodo')}
			
					amp_val = txtfs[:amplitude].text.empty? ? nil : txtfs[:amplitude].text
					lam_val = txtfs[:lambda].text.empty? ? nil : txtfs[:lambda].text
					vel_val = txtfs[:velocidade].text.empty? ? nil : txtfs[:velocidade].text
					freq_val = txtfs[:frequencia].text.empty? ? nil : txtfs[:frequencia].text
					per_val = txtfs[:periodo].text.empty? ? nil : txtfs[:periodo].text
					begin
						lbl_erros = self.componentes.o_de_classe_e_nome 'JLabel', 'erros'
						@onda = Ondas2::Modelos::Onda.new :amplitude => amp_val,
										 :lambda => lam_val,
										 :velocidade => vel_val,
										 :frequencia => freq_val,
										 :periodo => per_val
						lbl_erros.text = ' '
					rescue Ondas2::Modelos::InfraE::OndaException => e
						case e.message
						when :FaltaDados
							lbl_erros.text = 'Dados insuficientes.'
						when :SemAmplitude
							lbl_erros.text = 'Informe o valor da Amplitude.'
						when :ComLetras
							lbl_erros.text = 'Preencha os campos somente com numeros.'
						when :FrequenciaPeriodoErro
							lbl_erros.text = 'A frequencia deve ser o inverso do periodo.'
						when :VelocidadeLambdaFrequenciaErro
							lbl_erros.text = 'A velocidade deve ser igual a lambda * frequencia.'
						end
						return
					end
			
					txtfs.each_pair do |nome,txtf|
						txtf.text = @onda.method(nome).call.to_s if txtf.text.empty?
					end
				end
			end
		end
	end
end
