module Utilities
	
	def leap_year?(year)
		(year % 100 == 0 && year % 400 == 0) || (year % 4 == 0 && !(year % 100 == 0))
	end

#----------------------------------------------------------#

	def percent_of_year(percent)
		('%.1f' % (percent*10000 / SECONDS_IN_YEAR)) + '%'
	end

	SECONDS_IN_YEAR = 31536000.0

#----------------------------------------------------------#

	def convert_clock_to_military(x)
		a, b = x.split(":")
		c, d = b.split(" ")
		e = ""

		if d.downcase != 'am'
			if a.to_i == 12
				e = a + ":" + c
			else
				e = (a.to_i + 12).to_s + ":" + c
			end
		elsif d.downcase != 'pm'
			if a.to_i == 12
				e = (a.to_i - 12).to_s + ":" + c || e = a + ":" + c
			else
				e = a + ":" + c
			end
		end

		return e
	end

# -------------------------------------------------------------#

	def convert_military_to_normal(x)
		a, b = x.split(":")
		c = ""
		if a.to_i < 12
			c = a + b + " am" || c = a + b + " pm"
		end
	end

# -------------------------------------------------------------#


	def bedtime?(time, bool)
		hours = time.split(":")[0].to_i
		am_or_pm = time.split(":")[1].split(" ")[1]

		(hours >= 8 && bool || hours >= 10 && !bool) && am_or_pm == 'PM' ? false : true
	end

# ------------------------------------------------------------# 

	def difference_in_percentages(num1_secs1, num_secs2)
		year_percent1 = percent_of_year(num1_secs1)[0..-2].to_f
		year_percent2 = percent_of_year(num1_secs2)[0..-2].to_f
		num_secs1 < num_secs2 ? total_percent(year_percent2,year_percent1) : total_percent(year_percent1, year_percent2)
	end

end