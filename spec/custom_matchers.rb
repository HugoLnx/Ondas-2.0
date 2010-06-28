module CustomMatchers
	def be_in_downcase
		simple_matcher do |target|
			sym_s = target.to_s
			sym_s.should be_eql sym_s.downcase
		end
	end
	
	def have_underline_when_blankspace_exists_in(reference_s)
		simple_matcher do |target|
			sym_s = target.to_s
			i = 0
			reference_s.each_char do |ref_char|
				sym_s[i].chr.should be_eql '_' if ref_char.eql? ' '
				i += 1
			end
		end
	end
end