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
    expect(asia.shortfall).equal(-6)
    expect(asia.profit).equal(292)
  end


end
