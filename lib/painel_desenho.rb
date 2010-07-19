module Ondas2
	class PainelDesenho < JPanel
		attr_writer :janela_mae
		attr_reader :time
		
		include Runnable
	
		def paint(graphics)
			super graphics
			onda = @janela_mae.app_mae.onda
			unless onda.nil?
				graphics.color = Color::BLACK
				
				self.width.times do |x|
					pt1 = [x,onda.y_when(:x => x, :time => time)+self.height/2]
					pt2 = [x+1,onda.y_when(:x => x+2, :time => time)+self.height/2]
					line = Line2D::Double.new(pt1[0],pt1[1],pt2[0],pt2[1])
					graphics.draw line
				end
			end
		end
		
		def run
			@time = 0
			loop do
				JThread.sleep 50
				@time += 1
				self.paint self.graphics
			end
		end
	end
end