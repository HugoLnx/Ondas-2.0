require 'spec_helper'

module Ondas2
	module Visoes
		module Helpers
			describe 'Um PainelTimer' do
				it 'deveria herdar de Timer' do
					PainelTimer.superclass.should be Timer
				end
				
				it 'deveria ser instanciavel' do
					lambda{PainelTimer.new :delay => 50}.should_not raise_error
				end
				
				context 'apos ser instanciado' do
					before :all do
						@timer = PainelTimer.new :delay => 50
					end
					
					it 'deveria ter um tempo' do
						@timer.instance_variable_get(:@tempo).should be_eql 0.0
					end
					
					it 'deveria ter um reader para o tempo' do
						lambda{@timer.tempo}.should_not raise_error
					end
					
					it 'deveria incrementar a contagem do tempo' do
						@timer.incrementar_tempo
						@timer.tempo.should be_eql 0.05
					end
					
					context 'ao ser iniciado' do
						before :all do
							@timer.instance_variable_set :@tempo, 1.0
							@timer.start
						end
						
						it 'deveria zerar a contagem do tempo' do
							@timer.tempo.should be_eql 0.0
						end
					end
				end
			end
		end
	end
end