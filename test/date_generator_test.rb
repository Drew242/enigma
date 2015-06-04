require "minitest/autorun"
require "minitest/pride"


class DateGeneratorTest < Minitest::Test

  def test_it_returns_todays_date_if_none_is_given
    date = Time.new
    assert_equal Time.new, date
  end

  def test_it_can_store_and_return_a_string
    date = Time.new
    date.strftime("%d%d%y")
    assert_equal "060215", date
  end

  def test_it_can_convert_date_to_integer
    date = Time.new
    date.strftime("%d%d%y").to_i
    assert_equal 060215, date
  end

  def test_it_can_square_the_integer
    date = Time.new
    date.strftime("%d%d%y")to_i * date.strftime("%d%d%y")
    assert_equal 3625846225, date
  end

  def test_it_can_pull_last_four_digits
    date = Time.new
    offset = date.strftime("%d%d%y")to_i * date.strftime("%d%d%y")
    offset.to_s[-3..-1]
    assert_equal 6225, date
  end

  def test_it_can_change_back_to_a_string
    date = Time.new
    offset = date.strftime("%d%d%y")to_i * date.strftime("%d%d%y")
    offset.to_s[-3..-1]
    assert_equal "6225", date
  end

end