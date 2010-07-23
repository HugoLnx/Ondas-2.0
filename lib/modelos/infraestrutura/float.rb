class Float
	def eh_igual?(outra_float,precisao=5)
		(self - outra_float).abs.between?(0,10 ** -precisao)
	end

	def eh_diferente?(outra_float,precisao=5)
		!eh_igual?(outra_float,precisao)
	end
end
