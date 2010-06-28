require 'spec_helper'

module Ondas2
	describe Componentes do
		it 'deveria ser inicializavel' do
			lambda{Componentes.new}.should_not raise_error NameError
		end
		
		context 'apos ser instancializado' do
			before do
				@componentes = Componentes.new
			end
			
			it 'deveria agrupar componentes' do
				lambda{@componentes.adiciona 10, 'dez'}.should_not raise_error
			end
		end
	end
end