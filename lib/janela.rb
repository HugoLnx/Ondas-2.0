module Ondas2
	class Janela < JFrame
		attr_reader :app_mae
		def initialize(args={})
			titulo = args[:titulo]
			super titulo
			@app_mae = args[:app_mae]
			self.set_size 305,273
			self.resizable = false
			self.default_close_operation = JFrame::EXIT_ON_CLOSE
			self.content_pane.layout = BorderLayout.new
			
			icone = ImageIcon.new 'images/ondas2.png'
			self.icon_image = icone.image
			
		end
	end
end
