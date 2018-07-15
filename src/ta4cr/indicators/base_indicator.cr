module Ta4cr
  module Indicators
    abstract class BaseIndicator

      property series : Proc(Int32, BigDecimal)

      def initialize(indicator : BaseIndicator)
        @calculations = {} of Int32 => BigDecimal 
        @series = ->(index : Int32) { BigDecimal.new(indicator.get_value(index)) }
      end

      def initialize(series : Array(Number))
        @calculations = {} of Int32 => BigDecimal
        @series = ->(index : Int32) { BigDecimal.new(series[index]) }
      end

      def get_series_values(start, stop)
        (start..stop).flat_map do |i|
          @series.call(i)
        end
      end

      def get_value(index)
        return @calculations[index] if @calculations[index]?
        @calculations[index] = BigDecimal.new(calculate(index))
      end

      def calculate_starting_index(index, timeframe)
        index - (timeframe - 1)
      end

      abstract def calculate(index : Int32)

    end
  end
end
