require 'spec_helper'

module Ondas2
	module Visoes
		module Helpers
		
		
			describe 'Uma AbaMenu' do
				it 'deveria herdar de JMenu' do
					AbaMenu.superclass.should be JMenu
				end
		
				it 'deveria ser instanciavel' do
					lambda{
						AbaMenu.new 'Aba'
					}
				end
		
				context 'apos ser instanciada com 3 itens' do
					before :all do
						@aba_menu = AbaMenu.new 'Aba' do |am|
							am.add_item 'item1'
							am.add_item 'item2'
							am.add_item 'item3'
						end
					end
					
					it 'deveria ter uma hash com seus itens' do
						@aba_menu.instance_variable_get(:@itens).should be_a Hash
					end
					
					it 'deveria ter um reader para sua hash de itens' do
						lambda{@aba_menu.itens}.should_not raise_error
					end
			
					it 'deveria ter 3 itens' do
						@aba_menu.should have(3).itens
					end
				end
			end
			
			
		end
	end
end
