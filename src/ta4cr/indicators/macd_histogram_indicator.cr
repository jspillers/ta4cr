require "./base_indicator"

# Signal line for MACD
# http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:moving_average_convergence_divergence_macd

# MACD Line: (12-day EMA - 26-day EMA)
# Signal Line: 9-day EMA of MACD Line
# MACD Histogram: MACD Line - Signal Line

module Ta4cr
  module Indicators
    class MacdHistogramIndicator < BaseIndicator
      
      def initialize(macd_indicator : MacdIndicator, macd_signal_indicator : MacdIndicator, timeframe = 9)
        super(macd_signal_indicator)
        @macd = macd_signal_indicator
        @macd_signal = macd_signal_indicator
      end

      def calculate(index)
        @macd.get_value(index) - @macd_signal.get_value(index)
      end
    end
  end
end

