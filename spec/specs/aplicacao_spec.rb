require 'spec_helper'

module Ondas2
	describe 'Aplicacao' do
		it 'deveria ser iniciavel' do
			lambda{Aplicacao.inicia}.should_not raise_error
		end
	end
end