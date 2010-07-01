require 'spec_helper'

module Ondas2
	describe Janela do
		it 'deveria herdar do JFrame' do
			Janela.superclass.should be JFrame
		end
	
		it 'deveria ser instanciavel' do
			lambda{Janela.new}.should_not raise_error
		end
		
		context 'apos sua instancializacao' do
			before do
				@app = Aplicacao.new
				@j = Janela.new 'Janela Principal'#, :aplicacao_mae => @app
			end
			
			it 'deveria ter tamanho 305 x 273' do
				tamanho = [@j.size.width,@j.size.height]
				tamanho.should be_eql [305,273]
			end
			
			it 'não deveria ser redimensionavel' do
				@j.resizable.should be_false
			end
			
			it 'deveria estar visivel' do
				@j.visible.should be_true
			end
			
			it 'deveria ter configurada a operacao de fechamento padrao' do
				@j.default_close_operation.should be_eql JFrame::EXIT_ON_CLOSE
			end
		end
	end
end
