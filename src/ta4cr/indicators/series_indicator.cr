require "./base_indicator"

# Basic indicator that just returns the value of a series for a given index

module Ta4cr
  module Indicators
    class SeriesIndicator < BaseIndicator
      
      def initialize(series : Array(Number))
        super(series)
      end

      def calculate(index)
        @series.call(index)
      end
    end
  end
end

