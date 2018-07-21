require "./base_indicator"

# returns the lowest value within a given timeframe
module Ta4cr
  module Indicators
    class LowestValueIndicator < BaseIndicator
      property timeframe : Int32

      def initialize(indicator : BaseIndicator, timeframe)
        @indicator = indicator
        @timeframe = timeframe
      end

      protected def calculate(index)
        start = calculate_starting_index(index, timeframe)

        if indicator = @indicator
          indicator.get_series_values([0, start].max, index).try &.min
        end
      end
    end
  end
end
