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
					@j = Janela.new
				end
		
				it 'deveria ter um titulo' do
					@j.title.should_not be_nil
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
				
				it 'deveria poder retornar uma hash de seus componentes' do
					lambda{
						@j.componentes.should be_a Hash
					}.should_not raise_error
				end
				
				it 'deveria poder retornar os valores de seus campos de texto' do
					lambda{
						@j.valores_dos_campos_de_texto.should be_a Hash
					}.should_not raise_error
				end
				
				it 'deveria notificar os erros' do
					lambda{@j.notifica_erro 'Deu Pau!'}.should_not raise_error
					@j.componentes[:lbl_erros].text.should be_eql 'Deu Pau!'
				end
				
				it 'deveria limpar a label de erros' do
					lambda{@j.limpa_notificacoes_de_erro}.should_not raise_error
					@j.componentes[:lbl_erros].text.should be_eql ' '
				end
				
				it 'deveria atualizar seus campos de texto' do
					@j.atualiza_campos_de_texto_com({:amplitude => 40.0,
													 :lambda => 20.0,
													 :velocidade => 200.0,
													 :frequencia => 10.0,
													 :periodo => 0.1
													})
				end
				
				it 'deveria preparar para reinicialização do timer' do
					timer = @j.instance_variable_get :@timer
					timer.should_receive :stop
					pnl_vis = @j.instance_variable_get :@pnl_vis
					pnl_vis.should_receive :limpar
					@j.prepara_reinicializacao_do_timer
				end
				
				it 'deveria reiniciar o timer' do
					timer = @j.instance_variable_get :@timer
					timer.should_receive :start
					@j.reinicia_timer
				end
			end
		end
		
		
	end
end
