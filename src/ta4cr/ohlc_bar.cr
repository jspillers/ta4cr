module Ta4cr
  class OhlcBar
    property open : BigDecimal
    property high : BigDecimal
    property low : BigDecimal
    property close : BigDecimal

    def initialize(open : Float64, high : Float64, low : Float64, close : Float64)
      @open = BigDecimal.new(open)
      @high = BigDecimal.new(high)
      @low = BigDecimal.new(low)
      @close = BigDecimal.new(close)
    end

    def initialize(open : BigDecimal, high : BigDecimal, low : BigDecimal, close : BigDecimal)
      @open = open
      @high = high
      @low = low
      @close = close
    end
  end
end
