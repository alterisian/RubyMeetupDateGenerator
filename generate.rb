require 'date'
class Generate
  def days_range(year,month)
    Date.new(year,month,1)..Date.new(year,month,-1)
  end

  def generate_dates(year,ordinal,weekday)
    selected = Array.new()
    selected[0] = Array.new
    1.upto(12).each do |month|
      selected[month] = Array((days_range(year,month)).group_by(&:wday)[weekday][ordinal-1])
    end
    selected[1..12].flatten
  end

  def formatted_output(date)
    puts date
  end

  def dates
    our_dates = generate_dates(2020,3,4)

    our_dates.each { |date| formatted_output date }

    our_dates
  end
end
