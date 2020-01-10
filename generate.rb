require 'date'
class Generate
  def generate_dates(year,ordinal,weekday)
    selected = Array.new()
    selected[0] = Array.new
    1.upto(12).each do |month|
      beginning_of_month = Date.new(year,month,1)
      end_of_month = Date.new(year,month,-1)
      selected[month] ||= Array((beginning_of_month..end_of_month).group_by(&:wday)[weekday][ordinal])
    end
    selected.shift
  end
  def dates
    generate_dates(2020,3,4)
  end
end