require "../spec_helper"

def macd
  MacdIndicator.new(indicator: macd_series, short_timeframe: 12, long_timeframe: 26)
end

describe Ta4cr::Indicators::MacdIndicator do
  it "does not average the series value when timeframe as not been met" do
    (0..24).each do |i|
      macd.calculate(i).should eq(macd_series[i])
    end
  end

  it "returns the correctly averaged value when the timeframe as been met" do
    (25..macd_series.size - 1).each do |i|
      macd.calculate(i).round(2).should eq(expected_macd_series[i])
    end
  end
end

def macd_series
  [
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 10, 9, 8,
  ].map { |cp| BigDecimal.new(cp) }
end

def expected_macd_series
  [
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 7, 5.56, 4.3, 3.17,
  ].map { |ss| BigDecimal.new(ss) }
end
