require "../spec_helper"

def ema
  EmaIndicator.new(indicator: ema_series, timeframe: 10)
end

describe Ta4cr::Indicators::EmaIndicator do

  it "does not average the series value when timeframe as not been met" do
    (0..8).each do |i|
      ema.calculate(i).should eq(ema_series[i])
    end
  end

  it "returns the correctly averaged value when the timeframe is met" do
    (9..ema_series.size - 1).each do |i|
      ema.calculate(i).round(2).should eq(expected_ema_series[i])
    end
  end
end

def ema_series
  [
    22.27, 22.19, 22.08, 22.17, 22.18, 22.13, 22.23, 22.43, 22.24,
    22.29, 22.15, 22.39, 22.38, 22.61, 23.36
  ].map { |cp| BigDecimal.new(cp) }
end

def expected_ema_series
  [
    22.27, 22.19, 22.08, 22.17, 22.18, 22.13, 22.23, 22.43, 22.24,
    22.22, 22.21, 22.24, 22.27, 22.33, 22.52
  ].map { |ss| BigDecimal.new(ss) }
end

