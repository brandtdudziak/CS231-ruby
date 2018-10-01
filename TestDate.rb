require "./GregorianDate.rb"
require "./SpainDate.rb"

class GregorianDate
	alias :to_s :toString
end

	g = GregorianDate.new("December",13,1900) 
	puts g.to_s
	g.makeTomorrow() 
	puts g.to_s
	g.makeTomorrow() 
	puts g.to_s
	
	h = SpainDate.new("December",13,1900) 
	puts h.isLeap().to_s
	puts g.isLeap().to_s
	
