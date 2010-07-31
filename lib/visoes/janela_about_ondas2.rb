module Ondas2
	module Visoes
		class JanelaAboutOndas2 < JDialog
			def initialize(args=[])
				super args[:janela_mae],args[:modal]
				inicializar_atributos
				#criar_componentes
				#posicionar_componentes
			end
			
			def inicializar_atributos
				self.title = 'Sobre Ondas 2.0'
				self.set_size 200,170
				self.resizable = false
				self.default_close_operation = JFrame::HIDE_ON_CLOSE
				self.content_pane.layout = BorderLayout.new
				borda_invisivel = BorderFactory.create_empty_border(6,6,6,6)
				self.content_pane.border = borda_invisivel
			
				#icone = ImageIcon.new 'images/ondas2.png'
				#self.icon_image = icone.image
			end
			
			def mostrar
				self.visible = true unless $modo_teste
			end
		end
	end
end