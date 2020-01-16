require 'date'
class Generate
  YEAR = 2020
  THURSDAY = 4
  MONTHS_IN_YEAR = 12

  def days_range(year,month)
    Date.new(year,month,1)..Date.new(year,month,-1)
  end

  def generate_dates(year,ordinal,weekday)
    selected = Array.new()
    selected[0] = Array.new
    1.upto(MONTHS_IN_YEAR).each do |month|
      selected[month] = Array((days_range(year,month)).group_by(&:wday)[weekday][ordinal-1])
    end
    selected[1..MONTHS_IN_YEAR].flatten
  end

  def dates
    generate_dates(YEAR,3,THURSDAY)
  end

  def formatted_output(date)
    date.strftime("%A %_d %B, %Y")
  end

  def print_dates
    puts dates
  end
end
