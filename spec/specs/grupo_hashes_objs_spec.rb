require 'spec_helper'

module Ondas2
	describe GrupoHashesObjs do
		it 'deveria ser inicializavel' do
			lambda{GrupoHashesObjs.new}.should_not raise_error NameError
		end
		
		context 'apos ser instancializado' do
			before do
				@grupo = GrupoHashesObjs.new
			end
			
			it 'deveria agrupar objetos' do
				lambda{@grupo.adiciona 10, 'dez'}.should_not raise_error
			end
			
			context 'apos adicionar um objeto' do
				before do
					@obj = 10
					@grupo.adiciona @obj, 'dez'
				end
				
				it 'deveria poder retornar esse objeto pelo seu nome e classe' do
					obj = @grupo.o_objeto_de_classe_e_nome Fixnum, 'dez'
					obj.should be @obj
				end
				
				it 'deveria ter um metodo o_de_classe_e_nome que eh alias do metodo o_objeto_de_classe_e_nome' do
					obj = @grupo.o_de_classe_e_nome Fixnum, 'dez'
					obj.should be @obj
				end
			end
		end
	end
end