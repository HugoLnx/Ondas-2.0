require 'spec_helper'

module Ondas2
	describe 'Aplicacao' do
		it 'deveria ser instanciavel' do
			lambda{Aplicacao.new}.should_not raise_error
		end
		
		context 'apos ser instanciada' do
			before do
				@app = Aplicacao.new
			end
			
			it 'deveria ser iniciavel' do
				lambda{@app.inicia}.should_not raise_error
			end
			
			it 'deveria ter componentes' do
				@app.componentes.should_not be_nil
			end

			it 'deveria poder utilizar qualquer componente do swing' do
				lambda{@app.usa :classe => JFrame,
						 :nome => :janela_principal,
						 :args => ['Nome Janela']}.should_not raise_error
			end
			
			context 'apos adicionar um componente do swing' do
				before do
					@app.usa :classe => JFrame,
							 :nome => :janela_principal,
							 :args => ['Nome Janela']
				end
				
				it 'o componente adicionado deve estar dentre os componentes da aplicacao' do
					comp = @app.componentes.o_de_classe_e_nome JFrame, :janela_principal 
					comp.should be_a JFrame
				end
			end
		end
	end
end