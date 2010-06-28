require 'spec_helper'

describe String do
	it 'deveria ter o metodo para_sym' do
		lambda{''.para_sym}.should_not raise_error NoMethodError
	end
	context 'ao chamar o metodo para_sym' do
		it 'deveria ser retornada a string convertida para simbolo' do
			nome = 'HUgo'
			nome.para_sym.should be_kind_of Symbol
		end
		
		context 'ao ser convertida para simbolo' do
			before do
				@nome = 'HUg  o  '
				@nome_sym = @nome.para_sym
			end
		
			it 'deveria ter todos os caracteres minusculos' do
				@nome_sym.should be_in_downcase
			end
			
			it 'deveria ter os espacos em branco substituidos por underline' do
				@nome_sym.should have_underline_when_blankspace_exists_in @nome
			end
		end
	end
end