require "./base_indicator"

# Signal line for MACD
# http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:moving_average_convergence_divergence_macd

# MACD Line: (12-day EMA - 26-day EMA)
# Signal Line: 9-day EMA of MACD Line
# MACD Histogram: MACD Line - Signal Line

module Ta4cr
  module Indicators
    class MacdHistogramIndicator < BaseIndicator
      def initialize(macd_indicator : MacdIndicator, macd_signal_indicator : MacdSignalIndicator, timeframe = 9)
        @macd = macd_signal_indicator
        @macd_signal = macd_signal_indicator
      end

      protected def calculate(index)
        macd_value = @macd.get_value(index)
        macd_signal_value = @macd_signal.get_value(index)

        if macd_value && macd_signal_value
          macd_value.as(BigDecimal) - macd_signal_value.as(BigDecimal)
        end
      end
    end
  end
end
