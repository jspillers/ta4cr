require "../spec_helper"

def sma
  SmaIndicator.new(indicator: series_indicator, timeframe: 10)
end

describe Ta4cr::Indicators::SmaIndicator do
  it "does not average the series value when timeframe as not been met" do
    (0..8).each do |i|
      sma.get_value(i).should eq(series_indicator.get_value(i))
    end
  end

  it "returns the correctly averaged value when the timeframe as been met" do
    (9..expected_sma_series.size - 1).each do |i|
      val = sma.get_value(i)
      result = val.responds_to?(:round) ? val.round(2) : nil
      result.should eq(expected_sma_series[i])
    end
  end
end

def series_indicator
  SeriesIndicator.new([
    22.27, 22.19, 22.08, 22.17, 22.18, 22.13, 22.23, 22.43, 22.24,
    22.29, 22.15, 22.39, 22.38, 22.61, 23.36,
  ])
end

def expected_sma_series
  [
    22.27, 22.19, 22.08, 22.17, 22.18, 22.13, 22.23, 22.43, 22.24,
    22.22, 22.21, 22.23, 22.26, 22.30, 22.42,
  ]
end
