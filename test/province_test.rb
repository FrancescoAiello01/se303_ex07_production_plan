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

  describe 'when production is changed' do
    it 'calculates the correct shortfall' do
      asia = Province.new(sample_province_data)

      asia.producers.first.production = 20

      _(asia.shortfall).must_equal(-6)
    end

    it 'calculates the correct profit' do
      asia = Province.new(sample_province_data)

      asia.producers.first.production = 20

      _(asia.profit).must_equal 292
    end
  end

  describe 'when there are no producers' do
    it 'calculates the correct shortfall' do
      no_producers = Province.new({
                                    name: 'No producers',
                                    producers: [],
                                    demand: 30,
                                    price: 20
                                  })

      _(no_producers.shortfall).must_equal 30
    end
    it 'calculates the correct profit' do
      no_producers = Province.new({
                                    name: 'No producers',
                                    producers: [],
                                    demand: 30,
                                    price: 20
                                  })

      _(no_producers.profit).must_equal 0
    end
  end

  describe 'when there is no demand' do
    it 'calculates the correct shortfall' do
      asia = Province.new(sample_province_data)

      asia.demand = 0

      _(asia.shortfall).must_equal(-25)
    end
  end
end
