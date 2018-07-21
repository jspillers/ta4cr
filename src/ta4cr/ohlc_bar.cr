module Ta4cr
  class OhlcBar
    property open : Float64
    property high : Float64
    property low : Float64
    property close : Float64

    def initialize(open : Float64, high : Float64, low : Float64, close : Float64)
      @open = open
      @high = high
      @low = low
      @close = close
    end
  end
end
