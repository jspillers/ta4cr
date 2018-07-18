require "../spec_helper"

def opi
  OpenPriceIndicator.new(simple_ohlc_series)
end

describe Ta4cr::Indicators::OpenPriceIndicator do
  it "returns the opening price of each bar in the series" do
    (0..2).each do |i|
      opi.calculate(i).should eq(simple_ohlc_data[i][0])
    end
  end
end

