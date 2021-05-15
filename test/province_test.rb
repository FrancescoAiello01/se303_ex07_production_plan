gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test
  describe 'province test case' do
    it 'calculates the correct shortfall' do
      asia = Province.new(sample_province_data)

      _(asia.shortfall).must_equal 5
    end

    it 'calculates the correct profit' do
      asia = Province.new(sample_province_data)

      _(asia.profit).must_equal 230
    end
  end
end
