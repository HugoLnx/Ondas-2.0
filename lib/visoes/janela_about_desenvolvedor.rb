module Ondas2
	module Visoes
		class JanelaAboutDesenvolvedor < JDialog
			def initialize(args=[])
				super args[:janela_mae],args[:modal]
				inicializar_atributos
				criar_componentes
				posicionar_componentes
			end
			
			def inicializar_atributos
				self.title = 'Sobre Hugo Roque'
				self.resizable = false
				self.default_close_operation = JFrame::HIDE_ON_CLOSE
				self.content_pane.layout = BorderLayout.new
				borda_invisivel = BorderFactory.create_empty_border(6,6,6,6)
				self.content_pane.border = borda_invisivel
			end
			
			def criar_componentes
				@logo = JLabel.new(ImageIcon.new 'images/LnxLogo48x48.png')
				@lbl_titulo = JLabel.new(
					'<html>'                +
						'<b>Hugo Roque</b>' +
						'<br/>'             +
						'a.k.a HugoLnx'     +
					'</html>'
				)
				@lbl_contatos = JLabel.new(
					'<html>'                                                     +
						'<b>Contatos</b>'                                        +
						'<br/>'                                                  +
						'Twitter: <a href="#">http://twitter.com/hugolnx</a>'    +
						'<br/>'                                                  +
						'Email: hugo.roque@caelum.com.br'                        +
						'<br/>'                                                  +
						'Blog: <a href="#">http://hugolnx.wordpress.com/</a>'    +
					'</html>'
				)
			end
			
			def posicionar_componentes
				norte = Container.new
				norte.layout = BorderLayout.new
				
				norte.add @logo, BorderLayout::WEST
				norte.add @lbl_titulo, BorderLayout::CENTER
				
				self.add norte, BorderLayout::NORTH
				self.add @lbl_contatos, BorderLayout::CENTER
				
			end
			
			def mostrar
				self.pack
				self.set_size(self.size.width + 10, self.size.height + 20)
				self.visible = true unless $modo_teste
			end
		end
	end
end