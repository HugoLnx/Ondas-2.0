require 'spec_helper'

module Ondas2
	module Visoes
		module Helpers
		
		
			describe PainelVisualizacao do
				it 'deveria herdar de um JPanel' do
					PainelVisualizacao.superclass.should be JPanel
				end
	
				it 'deveria ser instanciavel' do
					lambda{PainelVisualizacao.new}.should_not raise_error
				end
				
				context 'apos ser instanciado e estar dentro de uma janela visivel' do
					before :all do
						f = JFrame.new
						@pnl = PainelVisualizacao.new
						f.add @pnl
						f.visible = true
					end

					it 'deveria poder se pintar de acordo com os ys da onda' do
						ys = (0..@pnl.width).to_a
						lambda{
							@pnl.pintar_onda_com ys
						}.should_not raise_error
					end

				end
			end
			
		end
	end
end
