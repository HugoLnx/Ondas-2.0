require 'spec_helper'

module Ondas2
	module Visoes
		module Helpers
		
		
			describe Componentes do
				it 'deveria ser inicializavel' do
					lambda{Componentes.new}.should_not raise_error NameError
				end
		
				context 'apos ser instancializado' do
					before do
						@componentes = Componentes.new
					end
			
					it 'deveria agrupar objetos' do
						lambda{@componentes.adiciona 10, 'dez'}.should_not raise_error
					end
			
					context 'apos adicionar um objeto' do
						before do
							@obj = 10
							@componentes.adiciona @obj, 'dez'
						end
				
						it 'deveria poder retornar esse objeto pelo seu nome e classe' do
							obj = @componentes.o_componente_de_classe_e_nome 'Fixnum', 'dez'
							obj.should be @obj
						end
				
						it 'deveria ter um metodo o_de_classe_e_nome que eh alias do metodo o_objeto_de_classe_e_nome' do
							obj = @componentes.o_de_classe_e_nome 'Fixnum', 'dez'
							obj.should be @obj
						end
					end
				end
			end
			
			
		end
	end
end
