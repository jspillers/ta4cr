require "../spec_helper"

def cpi
  ClosePriceIndicator.new(simple_ohlc_series)
end

describe Ta4cr::Indicators::ClosePriceIndicator do
  it "returns the closing price of each bar in the series" do
    (0..2).each do |i|
      cpi.calculate(i).should eq(simple_ohlc_data[i][3])
    end
  end
end

