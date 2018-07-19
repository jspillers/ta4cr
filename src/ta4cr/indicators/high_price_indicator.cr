require "./base_indicator"

# returns the "high" component of an OHLC bar
module Ta4cr
  module Indicators
    class HighPriceIndicator < BaseIndicator
      def initialize(series : OhlcSeries)
        @series = series
      end

      protected def calculate(index)
        if series = @series
          bar = series[index] if series[index]?
          bar.responds_to?(:high) ? bar.try &.high : nil
        end
      end
    end
  end
end
