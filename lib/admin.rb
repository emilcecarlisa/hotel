# get the total cost for a given reservation

require "pry"
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
      room_num = select_room # not actually stored in new_reservation

      new_reservation = Reservation.new(check_in, check_out)

      @reservations << new_reservation

      return new_reservation
    end

    def call_reservation(start_date, end_date)

      start_parsed = Hotel::Reservation.parse_date(start_date)
      end_parsed = Hotel::Reservation.parse_date(end_date)

      @reservations.each do |reservation|
        if reservation.check_in == start_parsed && reservation.check_out == end_parsed
          # return reservation
        end

        return reservation
      end

    end

    # def get_duration
    #   @reservations
    #
    #   puts "THIS IS CHECK IN DATE #{call_reservation.check_in}"
    # end

    # def total_cost
    #   get_reserved_dates.check_in...get_reserved_dates.check_out
    # end

    # range of dates should end at second to last place (-2)
  end # class
end # module
