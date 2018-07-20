require "../spec_helper"

def hpi
  HighPriceIndicator.new(simple_ohlc_series)
end

describe Ta4cr::Indicators::HighPriceIndicator do
  it "returns the max/high price of each bar in the series" do
    (0..2).each do |i|
      hpi.get_value(i).should eq(simple_ohlc_data[i][1])
    end
  end
end

