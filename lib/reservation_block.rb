
module Hotel

  class ReservationBlock < Reservation

    attr_reader :blocked_rooms

    DISCOUNT_RATE = 0.2

    def initialize(input)
      super(input)
      @blocked_rooms = input[:blocked_rooms]
    end

    def total_cost
      return super * (1 - DISCOUNT_RATE)
    end
  end
end
