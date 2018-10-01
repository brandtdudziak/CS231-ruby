class GregorianDate  

	attr_reader :day,:year,:month
	
    @@months =  ["skip","January","February","March","April",
				      "May","June","July","August","September","October","November","December"]

    @@daysInMonth =  [0,31,-99,31,30,31,30,31,31,30,31,30,31]

    def getYear()  
	return @year 
    end
	
    def initialize(monthIn, dayIn, yearIn)   
	for i in 1..12 do  
	    if (@@months[i] == (monthIn))  
		@month = i 
	    end
	end
	@day = dayIn 
	@year = yearIn 
    end

    def toString()  
	return @@months[@month].to_s+"/"+@day.to_s+"/"+@year.to_s
    end

	
	
	
    def makeTomorrow()  
	 
	if (isChangedForSpecialDay())  
	    return 
	end

	changeYear = false 
	if (isLastDay())  
	    changeYear = true 
	end

	if ((@month == 2 && @day == 28 && !isLeap())  ||
	    (@month == 2 && @day == 29 && isLeap()) ||
	    (@month !=2 && @day == @@daysInMonth[@month]))  
	    @month = @month + 1 
	    if (@month == 13)  
		@month = 1 
	    end
	    @day = 1 
	else  
	    @day = @day + 1 
	end
	if (changeYear)  
	    @year = @year + 1 
	end
    end
	
	
    def isLeap()  
	if (@year%400 ==0 || (@year%100!=0 && @year%4 ==0))
	    return true 
	else  return false 
	end
    end

    def isLastDay()  
	if (@month==12 && @day==31)
	    return true 
	else  return false 
	end
    end
	
    def isChangedForSpecialDay()  
	if (@month == 12 && @day == 13 && @year == 2001)  
	    @day = 3 
	    return true 
	end		
	return false 
    end

end
