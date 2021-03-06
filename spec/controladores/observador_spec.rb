require 'spec_helper'

module Ondas2
	module Controladores
		describe 'Um Observador' do
			before :all do
				Ondas2::Visoes::JanelaSobreOndas2 = mock(:classe_janela_sobre_ondas2)
				Ondas2::Visoes::JanelaSobreOndas2.stub!(:new).with(any_args).and_return(mock(:janela_sobre_ondas2))
				Ondas2::Visoes::JanelaSobreDesenvolvedor = mock(:classe_janela_sobre_desenvolvedor)
				Ondas2::Visoes::JanelaSobreDesenvolvedor.stub!(:new).with(any_args).and_return(mock(:janela_sobre_desenvolvedor))
			end
			it 'deveria ser instanciavel' do
				janela = mock :janela
				janela.stub!(:componentes).and_return({:btn_gerar => mock(:btn_gerar),
													   :timer => mock(:timer),
													   :barra_menu => mock(:barra_menu)})
				janela.componentes[:btn_gerar].stub!(:add_action_listener).with any_args
				janela.componentes[:timer].stub!(:add_action_listener).with any_args
				janela.componentes[:barra_menu].stub!(:add_action_listener).with any_args
				fabrica_ondas = mock :fabrica_ondas
				fabrica_ondas.stub!(:fabricar).and_return(mock(:onda))
				lambda{
					Observador.new :janela => janela,
								   :fabrica_ondas => fabrica_ondas
				}.should_not raise_error
			end
			
			context 'apos ser instanciado' do
				before :all do
					@janela = mock :janela
					@janela.stub!(:componentes).and_return({:btn_gerar => mock(:btn_gerar),
															:timer => mock(:timer),
															:pnl_vis => mock(:pnl_vis),
															:barra_menu => mock(:barra_menu)})
					@evento = mock(:evento)
					@janela.componentes[:btn_gerar].stub!(:add_action_listener).with any_args
					@janela.componentes[:timer].stub!(:add_action_listener).with any_args
					@janela.componentes[:barra_menu].stub!(:add_action_listener).with any_args
					@fabrica_ondas = mock :fabrica_ondas
					@observador = Observador.new :janela => @janela,
												 :fabrica_ondas => @fabrica_ondas
					@onda = mock(:onda)
					@janela.componentes[:barra_menu].stub!(:abas).and_return({'Arquivo' => mock(:aba_arq),
																			  'Sobre' => mock(:aba_sobre)})
					@janela.componentes[:barra_menu].abas['Arquivo'].stub!(:itens).and_return({'Sair' => mock(:item_sair)})
					@janela.componentes[:barra_menu].abas['Sobre'].stub!(:itens).and_return({'Ondas 2.0' => mock(:item_ondas2)})
					@janela.componentes[:barra_menu].abas['Sobre'].stub!(:itens).and_return({'Desenvolvedor' => mock(:item_desenvolvedor)})
				end
				
				it 'deveria ter referencia a uma janela' do
					obs_janela = @observador.instance_variable_get(:@janela)
					obs_janela.should be_eql @janela
				end
				
				it 'deveria ter referencia a uma fabrica de ondas' do
					obs_fabrica = @observador.instance_variable_get(:@fabrica_ondas)
					obs_fabrica.should be_eql @fabrica_ondas
				end
				
				context 'ao receber um sinal do botao' do
					before :all do
						@evento.stub!(:source).and_return(@janela.componentes[:btn_gerar])
					end
					context 'se os dados foram preenchidos corretamente(sem frequencia e periodo)' do
						before :all do
							@janela.stub!(:valores_dos_campos_de_texto).and_return({
								:amplitude => '40',
								:lambda => '20',
								:velocidade => '200',
								:frequencia => '',
								:periodo => ''
							})
							
							@onda.stub!(:propriedades).and_return({
								:amplitude => 40.0,
								:lambda => 20.0,
								:velocidade => 200.0,
								:frequencia => 10.0,
								:periodo => 0.1
							})
						end
						
						it 'deveria providenciar a fabricacao de uma onda, o desaparecimento das notificacoes de erro, a atualizacao dos campos de texto e a reinicializacao do timer' do
							@janela.should_receive :prepara_reinicializacao_do_timer
							@fabrica_ondas.should_receive(:fabrica_onda_com).
								with({
									:amplitude => '40',
									:lambda => '20',
									:velocidade => '200',
									:frequencia => '',
									:periodo => ''
								}).and_return(@onda)
								@janela.should_receive :limpa_notificacoes_de_erro
								@janela.should_receive(:atualiza_campos_de_texto_com).
								with({:amplitude => 40.0,
									  :lambda => 20.0,
									  :velocidade => 200.0,
									  :frequencia => 10.0,
									  :periodo => 0.1})
								@janela.should_receive :reinicia_timer
								
						end
						
						after do
							@observador.action_performed(@evento)
						end
						
					end
					
					context 'se os dados foram preenchidos incorretamente/nao foram preenchidos' do
						before :all do
							@janela.stub!(:valores_dos_campos_de_texto).and_return({
								:amplitude => '',
								:lambda => '',
								:velocidade => '',
								:frequencia => '',
								:periodo => ''
							})
							if Ondas2::Modelos::InfraE::OndaException.nil?
								Ondas2::Modelos::InfraE::OndaException = Exception
							end
							@onda_exception = Ondas2::Modelos::InfraE::OndaException.new
							@onda_exception.stub!(:mensagem_notificacao).and_return('Mensagem de Erro')
						end
						
						it 'deveria providenciar a fabricacao de uma onda, notificar o erro, reiniciar e parar o timer' do				
							@janela.should_receive :prepara_reinicializacao_do_timer
							@fabrica_ondas.should_receive(:fabrica_onda_com).
								with({
									:amplitude => '',
									:lambda => '',
									:velocidade => '',
									:frequencia => '',
									:periodo => ''
								}).and_raise(@onda_exception)
								@janela.should_receive(:notifica_erro).with('Mensagem de Erro').once
						end
						
						after do
							@observador.action_performed(@evento)
						end
						
					end
				end
				
				context 'ao receber um sinal do timer' do
					before :all do
						@evento.stub!(:source).and_return(@janela.componentes[:timer])
						@janela.componentes[:timer].stub!(:tempo).and_return(0.0)
						@ys = mock :ys
						@janela.componentes[:pnl_vis].stub!(:width).and_return(100)
						@onda.stub!(:gerar_ys).with(:tempo => @janela.componentes[:timer].tempo,
													:x_max => @janela.componentes[:pnl_vis].width).and_return(@ys)
						@observador.instance_variable_set(:@onda, @onda)
					end
					
					it 'deveria repintar o painel e mandar o timer incrementar_tempo' do
						@janela.componentes[:pnl_vis].should_receive(:pintar_onda_com).with(@ys)
						@janela.componentes[:timer].should_receive(:incrementar_tempo)
					end
					
					after do
						@observador.action_performed(@evento)
					end
				end
				
				context 'ao receber um sinal do item Sair do menu' do
					before :all do
						
						@evento.stub!(:source).and_return(@janela.componentes[:barra_menu].abas['Arquivo'].itens['Sair'])
						@janela.stub! :dispose
					end
					
					it 'deveria sair da aplicacao' do
						@janela.should_receive :dispose
					end
					
					after do
						@observador.action_performed(@evento)
					end
				end
				
				context 'ao receber um sinal do item Ondas 2.0 do menu' do
					before :all do
						@evento.stub!(:source).and_return(@janela.componentes[:barra_menu].abas['Sobre'].itens['Ondas 2.0'])
					end
					
					it 'deveria sair da aplicacao' do
						@observador.instance_variable_get(:@janela_sobre_ondas2).should_receive(:mostrar)
					end
					
					after do
						@observador.action_performed(@evento)
					end
				end
				
				context 'ao receber um sinal do item Desenvolvedor do menu' do
					before :all do
						@evento.stub!(:source).and_return(@janela.componentes[:barra_menu].abas['Sobre'].itens['Desenvolvedor'])
					end
					
					it 'deveria sair da aplicacao' do
						@observador.instance_variable_get(:@janela_sobre_desenvolvedor).should_receive(:mostrar)
					end
					
					after do
						@observador.action_performed(@evento)
					end
				end
			end
			
		end
	end
end
