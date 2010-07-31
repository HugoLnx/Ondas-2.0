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
					
					it 'deveria ter uma hash com seus abas' do
						@barra_menu.instance_variable_get(:@abas).should be_a Hash
					end
					
					it 'deveria ter um reader para sua hash de abas' do
						lambda{@barra_menu.abas}.should_not raise_error
					end
					
					it 'deveria ter 3 abas' do
						@barra_menu.should have(3).abas
					end
					
					it 'deveria poder adicionar um action listener aos itens de seus submenus' do
						lambda{@barra_menu.add_action_listener mock(:action_listener)}.should_not raise_error
					end
				end
			end
			
			
		end
	end
end
