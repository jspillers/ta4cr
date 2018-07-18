require "../spec_helper"

def fast_stochastic
  FastStochasticIndicator.new(series: ohlc_series, timeframe: 14)
end

describe Ta4cr::Indicators::FastStochasticIndicator do
  it "does not average the series value when timeframe as not been met" do
    (0..12).each do |i|
      fast_stochastic.calculate(i).should eq(0.0)
    end
  end

  it "returns the correctly averaged value when the timeframe as been met" do
    results = [] of Float64 

    (13..stochastic_series_data.size - 1).each do |i|
      result = fast_stochastic.calculate(i).to_f
      results << result.round(2)
    end

    results.should eq(stochastic_series_data[13..stochastic_series_data.size - 1].map &.[] 4)
  end
end

def ohlc_series
  OhlcSeries.new.tap do |ohlc_series|
    stochastic_series_data.each do |data|
      ohlc_series.add_bar(OhlcBar.new(
        BigDecimal.new(data[2].as(Float64)), 
        BigDecimal.new(data[0].as(Float64)), 
        BigDecimal.new(data[1].as(Float64)), 
        BigDecimal.new(data[3].as(Float64))
      ))
    end
  end
end

def stochastic_series_data
  [# high    low     open    close   stoch k
    [127.01, 127.01, 127.01, 127.01, 0.0],
    [127.62, 126.16, 127.62, 126.16, 0.0],
    [126.59, 124.93, 126.59, 124.93, 0.0],
    [127.35, 126.09, 127.35, 126.09, 0.0],
    [128.17, 126.82, 128.17, 126.82, 0.0],
    [128.43, 126.48, 128.43, 126.48, 0.0],
    [127.37, 126.03, 127.37, 126.03, 0.0],
    [126.42, 124.83, 126.42, 124.83, 0.0],
    [126.90, 126.39, 126.90, 126.39, 0.0],
    [126.85, 125.72, 126.85, 125.72, 0.0],
    [125.65, 124.56, 125.65, 124.56, 0.0],
    [125.72, 124.57, 125.72, 124.57, 0.0],
    [127.16, 125.07, 127.16, 125.07, 0.0],
    [127.72, 126.86, 126.86, 127.29, 70.54],
    [127.69, 126.63, 126.63, 127.18, 67.70],
    [128.22, 126.80, 126.80, 128.01, 89.15],
    [128.27, 126.71, 126.71, 127.11, 65.89],
    [128.09, 126.80, 126.80, 127.73, 81.91],
    [128.27, 126.13, 126.13, 127.06, 64.60],
    [127.74, 125.92, 125.92, 127.33, 74.66],
    [128.77, 126.99, 126.99, 128.71, 98.57],
    [129.29, 127.81, 127.81, 127.87, 69.98],
    [130.06, 128.47, 128.47, 128.58, 73.09],
    [129.12, 128.06, 128.06, 128.60, 73.45],
    [129.29, 127.61, 127.61, 127.93, 61.20],
    [128.47, 127.60, 127.60, 128.11, 60.92],
    [128.09, 127.00, 127.00, 127.60, 40.58],
    [128.65, 126.90, 126.90, 127.60, 40.58],
    [129.14, 127.49, 127.49, 128.69, 66.91],
    [128.64, 127.40, 127.40, 128.27, 56.76],
  ]

end
