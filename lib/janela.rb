module Ondas2
	class Janela < JFrame
		def initialize(titulo='')
			super titulo
			self.set_size 305,273
			self.resizable = false
			self.default_close_operation = JFrame::EXIT_ON_CLOSE
			self.content_pane.layout = nil
			self.visible = true
		end
	end
end
