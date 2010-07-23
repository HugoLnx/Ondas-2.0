module Ondas2
	class BarraMenu < JMenuBar
		def initialize(&block)
			super
			yield(self)
		end
		
		def add_aba(texto_aba,&block)
			novo_menu = AbaMenu.new texto_aba, &block
			self.add novo_menu
		end
	end
end