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
		end
	end
end