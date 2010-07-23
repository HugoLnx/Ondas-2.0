require 'spec_helper'

module Ondas2
	module Visoes
		module Helpers
		
		
			describe 'Uma BarraMenu' do
				it 'deveria herdar de JMenuBar' do
					BarraMenu.superclass.should be JMenuBar
				end
		
				it 'deveria ser instanciavel' do
					lambda{
						BarraMenu.new
					}
				end
		
				context 'apos ser instanciada com 3 itens' do
					before :all do
						@barra_menu = BarraMenu.new do |bm|
							bm.add_aba 'menu1' do |am|
								am.add_item 'm1item1'
								am.add_item 'm1item2'
							end
							bm.add_aba 'menu2' do |am|
								am.add_item 'm2item1'
								am.add_item 'm2item2'
							end
							bm.add_aba 'menu3' do |am|
								am.add_item 'm3item1'
								am.add_item 'm3item2'
							end
						end
					end
			
					it 'deveria ter 3 menu' do
						@barra_menu.should have(3).sub_elements
					end
				end
			end
			
			
		end
	end
end
