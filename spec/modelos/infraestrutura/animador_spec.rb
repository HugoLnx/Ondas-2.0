require 'spec_helper'
module Ondas2
	module Modelos
		module InfraE
			describe 'Um Animador' do
				it 'deveria herdar de JThread' do
					Animador.superclass.should be JThread
				end
				
				it 'deveria ser instanciavel' do
					lambda{Animador.new({:onda => mock(:onda),
										:painel => mock(:painel)})}.should_not raise_error
				end
				
				context 'apos ser instanciado' do
					before :all do
						@onda = mock(:onda)
						@onda.stub!(:gerar_pontos).and_return(mock(:pontos))
						@painel = mock(:painel)
						@animador = Animador.new(:onda => @onda,
												 :painel => @painel)
					end
					
					it 'deveria ter um tempo' do
						@animador.instance_variable_get(:@tempo).should_not be_nil
					end
					
					it 'deveria ter uma referencia do painel' do
						@animador.instance_variable_get(:@painel).should_not be_nil
					end
					
					it 'deveria ter uma referencia da onda' do
						@animador.instance_variable_get(:@onda).should_not be_nil
					end
					
					it 'deveria poder ser executavel' do
						@animador.method(:start).should_not raise_error NoMethodError
					end
				end
			end
		end
	end
end