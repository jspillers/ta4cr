require "./base_indicator"

# http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:moving_averages

module Ta4cr
  module Indicators
    class SmaIndicator < BaseIndicator
      
      property timeframe : Int32

      def initialize(indicator, timeframe)
        super(indicator)
        @timeframe = timeframe
      end

      def calculate(index)
        start = calculate_starting_index(index, timeframe)
        return @series.call(index) unless start >= 0
        get_series_values(start, index).sum / timeframe 
      end
    end
  end
end
