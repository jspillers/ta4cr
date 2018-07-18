require "spec"
require "big"
require "../src/ta4cr"

include Ta4cr
include Ta4cr::Indicators

def simple_ohlc_data
  [# open   high   low   close
   [10.50, 11.00, 10.25, 10.75],
   [10.75, 12.20, 10.55, 12.20],
   [12.20, 12.50, 12.10, 12.40]
  ].map do |a| 
    a.map do |ohlc_val|
      BigDecimal.new(ohlc_val)
    end
  end
end

def simple_ohlc_bars
  simple_ohlc_data.flat_map do |ohlc_vals|
    OhlcBar.new(
      open: ohlc_vals[0], 
      high: ohlc_vals[1], 
      low: ohlc_vals[2], 
      close: ohlc_vals[3]
    )
  end
end

def simple_ohlc_series
  OhlcSeries.new(simple_ohlc_bars)
end
