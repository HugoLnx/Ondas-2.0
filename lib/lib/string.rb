class String
	def para_sym
		sym_s = self.downcase
		sym_s.gsub!(/ /,'_')
		sym_s.to_sym
	end
end