require "../spec_helper"

def sma
  SmaIndicator.new(indicator: sma_series, timeframe: 10)
end

describe Ta4cr::Indicators::SmaIndicator do
  it "does not average the series value when timeframe as not been met" do
    (0..8).each do |i|
      sma.calculate(i).should eq(sma_series[i])
    end
  end

  it "returns the correctly averaged value when the timeframe as been met" do
    (9..sma_series.size - 1).each do |i|
      sma.calculate(i).round(2).should eq(expected_sma_series[i])
    end
  end
end

def sma_series
  [
    22.27, 22.19, 22.08, 22.17, 22.18, 22.13, 22.23, 22.43, 22.24,
    22.29, 22.15, 22.39, 22.38, 22.61, 23.36,
  ].map { |cp| BigDecimal.new(cp) }
end

def expected_sma_series
  [
    22.27, 22.19, 22.08, 22.17, 22.18, 22.13, 22.23, 22.43, 22.24,
    22.22, 22.21, 22.23, 22.26, 22.30, 22.42,
  ].map { |ss| BigDecimal.new(ss) }
end
