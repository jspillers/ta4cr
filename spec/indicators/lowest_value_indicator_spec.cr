require "../spec_helper"

def lvi
  LowestValueIndicator.new(indicator: lv_series_indicator, timeframe: 5)
end

describe Ta4cr::Indicators::LowestValueIndicator do
  it "returns the highest value within the specified timeframe" do
    expected_lv_series_data.each_with_index do |expected, i|
      lvi.calculate(i).should eq(expected)
    end
  end
end

def lv_series_indicator
  SeriesIndicator.new(lv_series_data)
end

def lv_series_data
  [9,8,7,8,9,9,8,8,5,6,9].flat_map &.to_f
end

def expected_lv_series_data
  [9,8,7,7,7,7,7,8,5,5,5].flat_map &.to_f
end
