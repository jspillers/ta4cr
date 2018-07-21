require "./base_indicator"

# http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:moving_averages
#
# Initial SMA: 10-period sum / 10
# Multiplier: (2 / (Time periods + 1) ) = (2 / (10 + 1) ) = 0.1818 (18.18%)
# EMA: {Close - EMA(previous day)} x multiplier + EMA(previous day).

module Ta4cr
  module Indicators
    class EmaIndicator < BaseIndicator
      property timeframe : Int32

      @multiplier : Float64

      def initialize(indicator : BaseIndicator, timeframe)
        @indicator = indicator
        @timeframe = timeframe
        @sma_indicator = SmaIndicator.new(indicator, timeframe)
        @multiplier = 2.0 / (timeframe + 1)
      end

      protected def calculate(index)
        start = calculate_starting_index(index, timeframe)

        if indicator = @indicator
          return indicator.get_value(index) unless start >= 0
          
          return @sma_indicator.get_value(index) if start == 0

          previous_avg = get_value(index - 1)
          indicator_value = indicator.get_value(index)

          if previous_avg && indicator_value
            ((indicator_value - previous_avg) * @multiplier) + previous_avg
          end
        end
      end

    end
  end
end
