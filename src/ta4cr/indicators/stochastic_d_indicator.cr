require "./base_indicator"

# http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:stochastic_oscillator_fast_slow_and_full

# Slow Stochastic Oscillator:
#
# Slow %K = Fast %K smoothed with 3-period SMA
# Slow %D = 3-period SMA of Slow %K

# this is really just a wrapper on an SMA with a default timeframe of 3
# but its helpful to have it have a unique and descriptive type
module Ta4cr
  module Indicators
    class StochasticDIndicator < BaseIndicator
      property timeframe : Int32

      def initialize(indicator : FastStochasticIndicator | SlowStochasticIndicator, timeframe = 3)
        @timeframe = timeframe
        @sma = SmaIndicator.new(indicator, timeframe)
      end

      protected def calculate(index)
        start = calculate_starting_index(index, timeframe)

        return nil unless start >= 0

        if stoch_d_value = @sma.get_value(index)
          stoch_d_value.as(BigDecimal)
        end
      end
    end
  end
end
