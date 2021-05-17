gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  def test_province_shortfall
    asia = Province.new(sample_province_data)
    assert_equal(5, asia.shortfall)
  end

  def test_province_profit
    asia = Province.new(sample_province_data)
    assert_equal(230, asia.profit)
  end

  def test_province_change_production
    asia = Province.new(sample_province_data)
    asia.producers[0].production = 20
    assert(asia.shortfall == -6)
    assert(asia.profit == 292)
  end

  def no_producers_data
    data = {
      name: "No producers",
      producers: [],
      demand: 30,
      price: 20
    }
    @noProducers = Province.new(data)
  end 

  def test_no_producers_shortfall
    no_producers_data
    assert(@noProducers.shortfall == 30)
  end

  def test_no_producers_profit
    no_producers_data
    assert(@noProducers.profit == 0)
  end

end

#Reference: https://semaphoreci.com/community/tutorials/getting-started-with-rspec