module Ondas2
	module Visoes
		class JanelaAboutOndas2 < JDialog
			def initialize(args=[])
				super args[:janela_mae],args[:modal]
				inicializar_atributos
				criar_componentes
				posicionar_componentes
			end
			
			def inicializar_atributos
				self.title = 'Sobre Ondas 2.0'
				self.set_size 300,200
				self.resizable = false
				self.default_close_operation = JFrame::HIDE_ON_CLOSE
				self.content_pane.layout = BorderLayout.new#BoxLayout.new self.content_pane, BoxLayout::X_AXIS
				borda_invisivel = BorderFactory.create_empty_border(6,6,6,6)
				self.content_pane.border = borda_invisivel
			end
			
			def criar_componentes
				@logo = JLabel.new(ImageIcon.new 'images/ondas2_48x48.png')
				@lbl_titulo = JLabel.new(
					'<html>'                           +
						'<b>Visualizador de Ondas</b>' +
						'<br/>'                        +
						'Versao 2.0'                   +
					'</html>'
				)
				@descricao = JLabel.new(
					'<html>'                                                     +
						'<b>Descricao</b>'                                       +
						'<br/>'                                                  +
						'Esta aplicacao torna possivel a vizualizacao de ondas.' +
						'<br/>'                                                  +
						'Ela foi desenvolvida utilizando JRuby e Swing e seu '   +
						'codigo fonte pode ser vizualizado no github:'           +
						'<br/>'                                                  +
						'<a href="#">http://github.com/HugoLnx/Ondas-2.0</a>'    +
					'</html>'
				)
			end
			
			def posicionar_componentes
				#vbox = Box.create_vertical_box
				norte = Container.new
				norte.layout = BorderLayout.new
				
				norte.add @logo, BorderLayout::WEST
				norte.add @lbl_titulo, BorderLayout::CENTER
				
				self.add norte, BorderLayout::NORTH
				self.add @descricao, BorderLayout::CENTER
				
			end
			
			def mostrar
				self.visible = true unless $modo_teste
			end
		end
	end
end