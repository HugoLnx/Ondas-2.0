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
			
					it 'deveria ter 3 itens' do
						@aba_menu.should have(3).menu_components
					end
				end
			end
			
			
		end
	end
end
