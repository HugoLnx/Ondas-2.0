require 'spec_helper'

module Ondas2
	module Visoes
		module Helpers
		
		
			describe PainelAnimado do
				it 'deveria herdar de um JPanel' do
					PainelAnimado.superclass.should be JPanel
				end
				
				it 'deveria implementar a interface Runnable' do
					PainelAnimado.should include Runnable
				end
	
				it 'deveria ser instanciavel' do
					lambda{PainelAnimado.new}.should_not raise_error
				end
				
				context 'apos ser instanciado' do
					before :all do
						observador = mock(:observador)
						@pnl = PainelAnimado.new(observador)
						@pnl.stub!(:observador).and_return(observador)
					end
					
					it 'deveria ter uma referencia ao observador' do
						@pnl.instance_variable_get(:@observador).should_not be_nil
					end
					
					context 'apos ser executado numa thread' do
						before :all do
							JThread.new(@pnl).start
						end
						
						it 'deveria pedir para o observador uma array de pontos da onda' do
							@pnl.observador.should_receive()
						end
					end
				end
			end
			
		end
	end
end
