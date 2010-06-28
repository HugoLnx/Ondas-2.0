module CustomMatchers
	def be_in_downcase
		simple_matcher do |target|
			sym_s = target.to_s
			sym_s.should be_eql sym_s.downcase
		end
	end
end