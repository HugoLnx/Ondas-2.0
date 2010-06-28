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
		end
	end
end