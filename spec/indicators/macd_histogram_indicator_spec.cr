require "../spec_helper"

def macd
  MacdIndicator.new(indicator: macd_series)
end

def macd_signal
  MacdSignalIndicator.new(macd_indicator: macd)
end

def macd_histogram
  MacdHistogramIndicator.new(macd_indicator: macd, macd_signal_indicator: macd_signal)
end

describe Ta4cr::Indicators::MacdHistogramIndicator do
  it "does not average the series value when timeframe as not been met" do
    (0..24).each do |i|
      macd_histogram.get_value(i).should eq(expected_macd_histogram_series[i])
    end
  end

  it "returns the correctly averaged value when the timeframe as been met" do
    (25..expected_macd_histogram_series.size - 1).each do |i|
      if macd_histogram_value = macd_histogram.get_value(i)
        macd_histogram_value.round(2).should eq(expected_macd_histogram_series[i])
      end
    end
  end
end

def macd_series
  SeriesIndicator.new([
    0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 
    12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0, 21.0, 
    22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 10.0, 9.0, 8.0,
  ])
end

def expected_macd_histogram_series
  [
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 5.6, 4.48, 3.58, 1.72, 0.36, -0.61,
  ].map { |s| s.to_f64 }
end
