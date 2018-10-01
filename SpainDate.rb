class SpainDate < GregorianDate 

  def initialize(month, day, year) 
    @month = month
    @day = day
    @year = year
  end

  def isLeap() 
    return getYear() % 4 == 0
  end
    
end
