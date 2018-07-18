require "./base_indicator"

# returns the highest value within a given timeframe
module Ta4cr
  module Indicators
    class HighestValueIndicator < BaseIndicator
      property timeframe : Int32

      def initialize(indicator : BaseIndicator, timeframe)
        @indicator = indicator
        @timeframe = timeframe
      end

      def calculate(index)
        start = calculate_starting_index(index, timeframe)

        if indicator = @indicator.as(BaseIndicator) 
          values = indicator.get_series_values([0, start].max, index)
          values.max.as(BigDecimal)
        end
      end
    end
  end
end