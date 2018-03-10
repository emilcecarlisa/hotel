# An administrator can view a list of rooms not reserved for a given date range

require "pry"
require "date"

module Hotel
  class Administrator

    attr_reader :reservations


    def initialize()
      @reservations = []
      @rooms = (1..20).to_a
    end

    def select_room()
      # return rand(1..20)
      # grab a room from @rooms
    end

    def make_reservation(requested_check_in, requested_check_out, room_num)
      # room_num = select_room

      # def check_dates
        @reservation.each do |reservation|
          if reservation.check_in == requested_check_in || reservation.check_out == requested_check_out
            raise ArgumentError.new("Date unavailable")
          elsif requested_check_in < reservation.check_out
            raise ArgumentError.new("Date unavailable")
          elsif requested_check_in >= reservation.check_in && requested_check_out >= reservation.check_out
            raise ArgumentError.new("Date unavailable")
          end # conditional
        end
      # end

      new_reservation = Reservation.new(requested_check_in, requested_check_out, room_num)

      @reservations << new_reservation

      return new_reservation
    end

    def call_reservation(start_date, end_date)

      start_parsed = Hotel::Reservation.parse_date(start_date)
      end_parsed = Hotel::Reservation.parse_date(end_date)

      @reservations.each do |reservation|
        if reservation.check_in == start_parsed && reservation.check_out == end_parsed
        end

        return reservation
      end

    end # call reservation

    def see_available(requested_date)

    requested_date = Hotel::Reservation.parse_date(requested_date)

      unavailable_rooms = []

      @reservations.each do |reservation|
        date_range = reservation.check_in.upto(reservation.check_out)

        date_range.each do |reserved_day|
          if reserved_day == requested_date
            # pushing the unavail room here
            unavailable_rooms << reservation.room_num
            break
          end
          # puts "THIS IS RESERVED DATE #{reserved_day}"
        end

      end # outside each loop


      return @rooms.find_all do |room_no|
        !unavailable_rooms.include? room_no
      end


    end # see_available

  end # class
end # module
