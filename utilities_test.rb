require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'Utilities'

class Methods2Test < MiniTest::Test
	def setup
		@m = Class.new do
     include Utilities
   	end.new
	end

	# Tests go here
	def test_leap_year?
		assert_equal true, @m.leap_year?(2004)
		assert_equal true, @m.leap_year?(1996)
		assert_equal true, @m.leap_year?(400)
		assert_equal false, @m.leap_year?(1900)
		assert_equal false, @m.leap_year?(1607)
		assert_equal false, @m.leap_year?(3)
	end

	def test_percent_of_year
		assert_equal '100.0%', @m.percent_of_year(315360)
		assert_equal '6.3%', @m.percent_of_year(20000)
		assert_equal '31.7%', @m.percent_of_year(100000)
	end

	def test_convert_clock_to_military
		assert_equal '9:00', @m.convert_clock_to_military('9:00 am')
		assert_equal '0:30', @m.convert_clock_to_military('12:30 am')
		assert_equal '14:00', @m.convert_clock_to_military('2:00 pm')
	end

	def test_convert_military_to_normal
		assert_equal '100 am', @m.convert_military_to_normal('1:00')
	end

	def test_bedtime 
		assert_equal true, @m.bedtime?('9:34 PM', false)
		assert_equal false, @m.bedtime?('9:34 PM', true)
		assert_equal true, @m.bedtime?('3:12 AM', true)
		assert_equal true, @m.bedtime?('3:12 AM,', false)
	end

	def test_difference_in_percentages
		assert_equal '1.0%', @m.difference_in_percentages(315360,637200)
		assert_equal '1.0%', @m.difference_in_percentages(637200,315360)
		assert_equal '50.0%', @m.difference_in_percentages(0,15768000)
	end
end
