require 'spec_helper'

module Ondas2
	module Modelos
		module InfraE
		
			describe 'App' do
				it 'deveria ser um modulo' do
					App.class.should be Module
				end
				
				it 'deveria iniciar a aplicacao' do
					lambda{App.iniciar}.should_not raise_error
				end
				
				it 'nao deveria fazer nada alem de iniciar a aplicacao' do
					App.singleton_methods.should be_eql ['iniciar']
				end
				
				context 'ao iniciar a aplicacao' do
					before :all do
						if Ondas2::Visoes::Janela.nil?
							Ondas2::Visoes::Janela = mock :janela_class
						end
						if Ondas2::Controladores::Observador.nil?
							Ondas2::Controladores::Observador = mock :observador_class
						end
						if Ondas2::Modelos::InfraE::FabricaOndas.nil?
							Ondas2::Modelos::InfraE::FabricaOndas = mock :fabrica_ondas_class
						end
						@janela = mock :janela
						@fabrica_ondas = mock :fabrica_ondas
					end
					
					it 'deveria instanciar uma Janela e um Observador' do
						Ondas2::Visoes::Janela.should_receive(:new).once.and_return(@janela)
						Ondas2::Modelos::InfraE::FabricaOndas.should_receive(:new).and_return(@fabrica_ondas)
						Ondas2::Controladores::Observador.should_receive(:new).
							with(:janela => @janela,
								 :fabrica_ondas => @fabrica_ondas).once
					end
					
					after do
						App.iniciar
					end
				end
			end
			
		end
	end
end
