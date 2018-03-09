# An administrator can view a list of rooms not reserved for a given date range

require "pry"
require "date"

module Hotel
  class Administrator

    attr_reader :reservations


    def initialize()
      @reservations = []
    end

    def select_room()
      # return rand(1..20)
    end

    def make_reservation(check_in, check_out, room_num)
      # room_num = select_room

      new_reservation = Reservation.new(check_in, check_out, room_num)

      @reservations << new_reservation

      # binding.pry

      return new_reservation
    end

    def call_reservation(start_date, end_date) #calls reservation

      # call only if dates don't overlap, assign any room #

      start_parsed = Hotel::Reservation.parse_date(start_date)
      end_parsed = Hotel::Reservation.parse_date(end_date)

      @reservations.each do |reservation|
        if reservation.check_in == start_parsed && reservation.check_out == end_parsed
        end

        return reservation
      end

    end # call reservation

    def see_available (start_date, end_date) #calls reservation

      # call only if dates don't overlap, assign any room #

      start_parsed = Hotel::Reservation.parse_date(start_date)
      end_parsed = Hotel::Reservation.parse_date(end_date)

      # if reservation in array has check in date, then don't
      # return that room
      # else return rooms that are available

      @reservations.each do |reservation|
        if reservation.check_in == start_parsed && reservation.check_out == end_parsed
        end

        return reservation
      end

    end # see_available

  end # class
end # module
