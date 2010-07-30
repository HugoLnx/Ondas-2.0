require 'spec_helper'

module Ondas2
	module Controladores
		describe 'Um Observador' do
			it 'deveria ser instanciavel' do
				janela = mock :janela
				janela.stub!(:componentes).and_return({:btn_gerar => mock(:btn_gerar)})
				janela.componentes[:btn_gerar].stub!(:add_action_listener).with any_args
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
					@janela.stub!(:componentes).and_return({:btn_gerar => mock(:btn_gerar)})
					@janela.componentes[:btn_gerar].stub!(:add_action_listener).with any_args
					@fabrica_ondas = mock :fabrica_ondas
					@observador = Observador.new :janela => @janela,
												 :fabrica_ondas => @fabrica_ondas
					@animador = mock(:animador)
					@observador.instance_variable_set(:@animador,@animador)
					@classe_animador = Ondas2::Modelos::InfraE::Animador = mock(:classe_animador)
					@novo_animador = mock(:novo_animador)
				end
				
				it 'deveria ter referencia a uma janela' do
					obs_janela = @observador.instance_variable_get(:@janela)
					obs_janela.should be_eql @janela
				end
				
				it 'deveria ter referencia a uma fabrica de ondas' do
					obs_fabrica = @observador.instance_variable_get(:@fabrica_ondas)
					obs_fabrica.should be_eql @fabrica_ondas
				end
				
				context 'ao receber um sinal' do
					context 'se os dados foram preenchidos corretamente(sem frequencia e periodo)' do
						before :all do
							@classe_animador.stub!(:new).with(any_args).and_return(@novo_animador)
							@janela.stub!(:valores_dos_campos_de_texto).and_return({
								:amplitude => '40',
								:lambda => '20',
								:velocidade => '200',
								:frequencia => '',
								:periodo => ''
							})
							
							@onda = mock(:onda)
							@onda.stub!(:propriedades).and_return({
								:amplitude => 40.0,
								:lambda => 20.0,
								:velocidade => 200.0,
								:frequencia => 10.0,
								:periodo => 0.1
							})
						end
						
						it 'deveria providenciar a fabricacao de uma onda, o desaparecimento das notificacoes de erro, a atualizacao dos campos de texto e a criacao do animador' do				
							@animador.should_receive(:matar)
							
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
								@novo_animador.should_receive :start
								
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
						
						it 'deveria providenciar a fabricacao de uma onda, e notificar o erro' do				
							@animador.should_receive(:matar)
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
			end
			
		end
	end
end
