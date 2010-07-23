require 'spec_helper'

module Ondas2
	module Visoes
	
	
		describe Janela do
			it 'deveria herdar do JFrame' do
				Janela.superclass.should be JFrame
			end

			it 'deveria ser instanciavel' do
				lambda{Janela.new}.should_not raise_error
			end
	
			context 'apos sua instancializacao' do
				before do
					@app = Ondas2::Modelos::InfraE::Aplicacao.new
					@j = Janela.new 'Janela Principal'#, :aplicacao_mae => @app
				end
		
				it 'deveria ter tamanho 400 x 340' do
					tamanho = [@j.size.width,@j.size.height]
					tamanho.should be_eql [400,340]
				end
		
				it 'nao deveria ser redimensionavel' do
					@j.resizable.should be_false
				end
		
				it 'deveria ter configurada a operacao de fechamento padrao' do
					@j.default_close_operation.should be_eql JFrame::EXIT_ON_CLOSE
				end
		
				it 'deveria ter o icone ondas2' do
					@j.icon_image.buffered_image.should_not be_nil
				end
			end
		end
		
		
	end
end
