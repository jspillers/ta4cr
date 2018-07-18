require "./src/ta4cr"
require "big"

class BaseIndicator

  include Ta4cr

  @indicator : BaseIndicator | Nil
  @ohlc_series : OhlcSeries | Nil
  @calculations = {} of Int32 => BigDecimal

  def initialize(indicator : BaseIndicator)
    @indicator = indicator
  end

  def initialize(series : OhlcSeries)
    @ohlc_series = series
  end

  def get_value(index)
    if series = @ohlc_series
      series[index] if series[index]?
    else
      return @calculations[index] if @calculations[index]?
      @calculations[index] = BigDecimal.new(calculate(index))
    end
  end

  def calculate(index)
    index + 5
  end
end

series = Ta4cr::OhlcSeries.new([Ta4cr::OhlcBar.new(BigDecimal.new(1.0),BigDecimal.new(2.0),BigDecimal.new(3.0),BigDecimal.new(4.0))])
indicator = BaseIndicator.new(series)
bar = indicator.get_value(0)

if bar.responds_to?(:high)
  puts bar.high
end
