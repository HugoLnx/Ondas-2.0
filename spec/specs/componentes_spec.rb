require 'spec_helper'

module Ondas2
	describe Componentes do
		it 'deveria poder ser inicializavel' do
			lambda{Componentes.new}.should_not raise_error NameError
		end
	end
end