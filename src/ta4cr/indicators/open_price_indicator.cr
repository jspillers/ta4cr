require "./base_indicator"

# returns the "open" component of an OHLC bar
module Ta4cr
  module Indicators
    class OpenPriceIndicator < BaseIndicator
      def initialize(series : OhlcSeries)
        @series = series
      end

      def calculate(index)
        if series = @series
          bar = series[index] if series[index]?
          bar.responds_to?(:open) ? bar.try &.open : nil
        end
      end
    end
  end
end
