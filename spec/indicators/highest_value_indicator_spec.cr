require "../spec_helper"

def hvi
  HighestValueIndicator.new(indicator: hv_series_indicator, timeframe: 5)
end

describe Ta4cr::Indicators::HighestValueIndicator do
  it "returns the highest value within the specified timeframe" do
    expected_hv_series_data.each_with_index do |expected, i|
      hvi.calculate(i).should eq(expected)
    end
  end
end

def hv_series_indicator
  SeriesIndicator.new(hv_series_data)
end

def hv_series_data
  [2,1,9,3,2,1,8,7,12,6,5].flat_map &.to_f
end

def expected_hv_series_data
  [2,2,9,9,9,9,9,8,12,12,12].flat_map &.to_f
end
