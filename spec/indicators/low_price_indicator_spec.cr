require "../spec_helper"

def lpi
  LowPriceIndicator.new(simple_ohlc_series)
end

describe Ta4cr::Indicators::LowPriceIndicator do
  it "returns the min/low price of each bar in the series" do
    (0..2).each do |i|
      lpi.get_value(i).should eq(simple_ohlc_data[i][2])
    end
  end
end

