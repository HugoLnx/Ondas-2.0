require 'spec_helper'

module Ondas2
	module Controladores
		describe 'Um Observador' do
			it 'deveria ser instanciavel' do
				janela = mock :janela
				janela.stub!(:componentes).and_return({:btn_gerar => mock(:btn_gerar)})
				janela.componentes[:btn_gerar].stub!(:add_action_listener).with any_args
				janela.componentes[:timer].stub!(:add_action_listener).with any_args
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
															:pnl_des => mock(:pnl_des)})
					@evento = mock(:evento)
					@janela.componentes[:btn_gerar].stub!(:add_action_listener).with any_args
					@janela.componentes[:timer].stub!(:add_action_listener).with any_args
					@fabrica_ondas = mock :fabrica_ondas
					@observador = Observador.new :janela => @janela,
												 :fabrica_ondas => @fabrica_ondas
					@onda = mock(:onda)
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
						@janela.componentes[:pnl_des].stub!(:width).and_return(100)
						@onda.stub!(:gerar_ys).with(:tempo => @janela.componentes[:timer].tempo,
													:x_max => @janela.componentes[:pnl_des].width).and_return(@ys)
						@observador.instance_variable_set(:@onda, @onda)
					end
					
					it 'deveria repintar o painel e mandar o timer incrementar_tempo' do
						@janela.componentes[:pnl_des].should_receive(:pintar_onda_com).with(@ys)
						@janela.componentes[:timer].should_receive(:incrementar_tempo)
					end
					
					after do
						@observador.action_performed(@evento)
					end
				end
			end
			
		end
	end
end
