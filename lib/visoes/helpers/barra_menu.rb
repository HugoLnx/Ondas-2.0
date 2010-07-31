module Ondas2
	module Visoes
		module Helpers
			class BarraMenu < JMenuBar
				attr_reader :abas
				def initialize(&block)
					super
					@abas = {}
					yield(self)
				end
		
				def add_aba(texto_aba,&block)
					nova_aba = AbaMenu.new texto_aba, &block
					@abas[texto_aba] = nova_aba
					self.add nova_aba
				end
				
				def add_action_listener(action_listener)
					self.abas.each_value do |aba|
						aba.itens.each_value do |item|
							item.add_action_listener action_listener
						end
					end
				end
			end
		end
	end
end
