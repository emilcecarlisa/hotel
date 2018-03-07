# access the list of all of the rooms in the hotel
# reserve a room for a given date range
  # raise an error (StandardError) when an invalid date range is provided
  # raise exception when asked to reserve room that isn't available (WAVE2)
# access the list of reservations for a specific date
# get the total cost for a given reservation

### Constraints
# The last day of a reservation is the checkout day, so the guest should not be charged for that night

require "date"

module Hotel
  class Administrator

    attr_reader :reservations

    COST = 200

    def initialize()
      @reservations = []
    end

    def select_room()
      return rand(1..20)
    end

    def make_reservation(check_in, check_out)
      room_num = select_room

      new_reservation = Reservation.new(check_in, check_out)

      @reservations << new_reservation

      return new_reservation
    end

    # def duration
    #   return (check_out - check_in)
    # end

    # def total_cost
    #   COST * duration
    # end

  end # class
end # module
