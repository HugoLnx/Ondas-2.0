module Ondas2
	module Visoes
		module Helpers
			class AbaMenu < JMenu
				attr_reader :itens
				def initialize(text,&block)
					super text
					@itens = {}
					yield(self)
				end
		
				def add_item(texto_item)
					novo_item = JMenuItem.new texto_item
					@itens[texto_item] = novo_item
					self.add novo_item
				end
			end
		end
	end
end
