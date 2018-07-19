module Ta4cr
  module Indicators
    abstract class BaseIndicator
      @indicator : BaseIndicator | Nil
      @series : OhlcSeries | Array(BigDecimal) | Nil
      @calculations = {} of Int32 => BigDecimal | Nil

      def initialize(indicator : BaseIndicator)
        @indicator = indicator
      end

      def initialize(series : Array(Float64))
        @series = series.flat_map {|item| BigDecimal.new(item) }
      end

      def initialize(series : OhlcSeries)
        @series = series
      end

      def get_series_values(start, stop)
        (start..stop).map do |i|
          val = get_value(i)
          val && val.is_a?(BigDecimal) ? val : nil
        end.compact
      end

      def get_value(index)
        return @calculations[index] if @calculations[index]?

        result = calculate(index)

        if result.is_a?(BigDecimal)
          @calculations[index] = result
        end
      end

      def calculate_starting_index(index, timeframe)
        index - (timeframe - 1)
      end

      protected abstract def calculate(index : Int32)
    end
  end
end
