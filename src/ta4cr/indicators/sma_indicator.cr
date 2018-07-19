require "./base_indicator"

# http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:moving_averages

module Ta4cr
  module Indicators
    class SmaIndicator < BaseIndicator
      property timeframe : Int32

      def initialize(indicator : BaseIndicator, timeframe)
        @indicator = indicator
        @timeframe = timeframe
      end

      protected def calculate(index)
        start = calculate_starting_index(index, timeframe)

        if indicator = @indicator 
          if start >= 0
            indicator.get_series_values(start, index).sum / timeframe
          else
            indicator.get_value(index)
          end
        end
      end
    end
  end
end
