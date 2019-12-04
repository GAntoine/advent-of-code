puts (158126..624574).map(&:to_s).reduce(0) { |r, n|
	ordered = n.match(/^(?=\d{6}$)0*1*2*3*4*5*6*7*8*9*$/)
	pairs = n.chars.group_by { |c| c }.select { |_k, v| v.size == 2 }.count
	!ordered.nil? && pairs > 0 ? r + 1 : r
}
