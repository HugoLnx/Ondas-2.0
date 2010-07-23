module Ondas2
	class AbaMenu < JMenu
		def initialize(text,&block)
			super text
			yield(self)
		end
		
		def add_item(texto_item)
			novo_item = JMenuItem.new texto_item
			self.add novo_item
		end
	end
end