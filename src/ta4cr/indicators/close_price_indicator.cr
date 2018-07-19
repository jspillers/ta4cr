require "./base_indicator"

# returns the "close" component of an OHLC bar
module Ta4cr
  module Indicators
    class ClosePriceIndicator < BaseIndicator
      def initialize(series : OhlcSeries)
        @series = series
      end

      protected def calculate(index)
        if series = @series
          bar = series[index] if series[index]?
          bar.responds_to?(:close) ? bar.try &.close : nil
        end
      end
    end
  end
end
