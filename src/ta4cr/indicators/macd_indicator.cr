require "./base_indicator"

# MACD Line
# http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:moving_average_convergence_divergence_macd

# MACD Line: (12-day EMA - 26-day EMA)
# Signal Line: 9-day EMA of MACD Line
# MACD Histogram: MACD Line - Signal Line

module Ta4cr
  module Indicators
    class MacdIndicator < BaseIndicator
      
      property max_timeframe : Int32
      property short_timeframe : Int32
      property long_timeframe : Int32

      def initialize(indicator, short_timeframe = 12, long_timeframe = 26)
        super(indicator)
        @short_timeframe = short_timeframe
        @long_timeframe = long_timeframe
        @max_timeframe = [short_timeframe, long_timeframe].max
        @short_ema_indicator = EmaIndicator.new(indicator, short_timeframe)
        @long_ema_indicator = EmaIndicator.new(indicator, long_timeframe)
      end

      def calculate(index)
        start = calculate_starting_index(index, max_timeframe)
        return @series.call(index) unless start >= 0
        @short_ema_indicator.get_value(index) - @long_ema_indicator.get_value(index)
      end
    end
  end
end

