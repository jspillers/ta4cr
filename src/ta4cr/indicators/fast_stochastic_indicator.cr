require "./base_indicator"

# http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:stochastic_oscillator_fast_slow_and_full

# %K = (Current Close - Lowest Low)/(Highest High - Lowest Low) * 100
# %D = 3-day SMA of %K
# 
# Lowest Low = lowest low for the look-back period
# Highest High = highest high for the look-back period
# %K is multiplied by 100 to move the decimal point two places

# Fast %K = %K basic calculation
# Fast %D = 3-period SMA of Fast %K

module Ta4cr
  module Indicators
    class FastStochasticIndicator < BaseIndicator
      property timeframe : Int32

      def initialize(series : OhlcSeries, timeframe = 14)
        @timeframe = timeframe

        @high_price_indicator = HighPriceIndicator.new(series)
        @highest_value_indicator = HighestValueIndicator.new(@high_price_indicator, timeframe)

        @lowest_value_indicator = LowestValueIndicator.new(
          LowPriceIndicator.new(series), timeframe)

        @close_price_indicator = ClosePriceIndicator.new(series)
      end

      def calculate(index)
        start = calculate_starting_index(index, timeframe)

        return BigDecimal.new(0) unless start >= 0

        close_price = @close_price_indicator.get_value(index).as(BigDecimal)
        lowest_low_in_timeframe = @lowest_value_indicator.get_value(index).as(BigDecimal)
        highest_high_in_timeframe = @highest_value_indicator.get_value(index).as(BigDecimal)

        (close_price - lowest_low_in_timeframe) / 
          (highest_high_in_timeframe - lowest_low_in_timeframe) * 100
      end
    end
  end
end
