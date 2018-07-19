require "./base_indicator"

# Signal line for MACD
# http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:moving_average_convergence_divergence_macd

# MACD Line: (12-day EMA - 26-day EMA)
# Signal Line: 9-day EMA of MACD Line
# MACD Histogram: MACD Line - Signal Line

module Ta4cr
  module Indicators
    class MacdSignalIndicator < BaseIndicator
      def initialize(macd_indicator : MacdIndicator, timeframe = 9)
        @signal_ema = EmaIndicator.new(macd_indicator, timeframe)
      end

      protected def calculate(index)
        @signal_ema.get_value(index).as(BigDecimal)
      end
    end
  end
end
