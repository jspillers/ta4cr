require "./base_indicator"

# returns the "low" component of an OHLC bar
module Ta4cr
  module Indicators
    class LowPriceIndicator < BaseIndicator
      def initialize(series : OhlcSeries)
        @series = series
      end

      protected def calculate(index)
        if series = @series
          bar = series[index] if series[index]?
          bar.responds_to?(:low) ? bar.try &.low : nil
        end
      end
    end
  end
end
