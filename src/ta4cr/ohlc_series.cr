module Ta4cr
  class OhlcSeries

    property series : Array(OhlcBar)

    def initialize(series = [] of OhlcBar)
      @series = series
    end

    delegate first, to: @series
    delegate last, to: @series
    delegate size, to: @series

    def [](index)
      @series[index]
    end

    def []?(index)
      @series[index]?
    end

    def add_bar(bar : OhlcBar)
      @series << bar
    end
  end
end
