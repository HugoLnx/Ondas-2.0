module Ondas2
	module Visoes
		module Helpers
			class PainelVisualizacao < JPanel
				def pintar_onda_com(ys)
					@ys = ys
					self.repaint(0,0,self.width,self.height)
				end
				
				alias old_paint paint
				def paint(graphics)
					old_paint graphics
					unless @ys.nil?
						graphics.color = Color::BLACK
						(self.width - 1).times do |x|
							pt1 = {:x => x,
										 :y => @ys[x]+self.height/2}
										 
							pt2 = {:x => x+1,
										 :y => @ys[x+1]+self.height/2}
							line = Line2D::Double.new(pt1[:x],pt1[:y],pt2[:x],pt2[:y])
							graphics.draw line
						end
					end
				end
				
				def limpar
					@ys = nil
					self.repaint(0,0,self.width,self.height)
				end
			end
		end
	end
end
