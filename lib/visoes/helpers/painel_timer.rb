module Ondas2
	module Visoes
		module Helpers
			class PainelTimer < Timer
				attr_reader :tempo
				def initialize(args={})
					super args[:delay],nil
					@tempo = 0.0
				end

				def start
					@tempo = 0.0
					super
				end
				
				def incrementar_tempo
					@tempo += self.delay/1000.0
				end
			end
		end
	end
end