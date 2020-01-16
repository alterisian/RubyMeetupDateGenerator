require 'date'
class Generate
  YEAR = 2020
  THURSDAY = 4
  MONTHS_IN_YEAR = 12

  ES_DAYS_OF_WEEK = "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"

  def days_range(year,month)
    Date.new(year,month,1)..Date.new(year,month,-1)
  end

  def generate_dates(year,week_in_month,weekday)
    ordinal = week_in_month
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

  def formatted_output(date, language="EN")
    if language=="EN"
      output = date.strftime("%A %_d %B, %Y")
    elsif language=="ES"
      output = ES_DAYS_OF_WEEK[date.wday-1] + date.strftime(" %_d %B, %Y")
    end

    output
  end

  def print_dates(language="EN")
    output = ""
    dates.each do |date|
      output += formatted_output(date, language) +"\n"
    end
    puts output
    output
  end
end
