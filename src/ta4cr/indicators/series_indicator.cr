require "./base_indicator"

# Basic indicator that just returns the value of a series for a given index

module Ta4cr
  module Indicators
    class SeriesIndicator < BaseIndicator

      def initialize(series : Array(Float64))
        @series = series
      end

      def initialize(series : Array(Float64) | Array(Float32) | Array(Int64) | Array(Int32))
        @series = series.map {|item| item.to_f64 }
      end

      protected def calculate(index)
        if series = @series
          series[index] 
        end
      end
    end
  end
end
