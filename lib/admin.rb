# An administrator can view a list of rooms not reserved for a given date range

require "pry"
require "date"

module Hotel
  class Administrator

    attr_reader :reservations


    def initialize()
      @rooms = {}

      (1..20).each do | room_num |
        @rooms[room_num] = []
      end

    end





    def make_reservation(requested_check_in, requested_check_out)
      available_rooms = see_available(requested_check_in, requested_check_out)
      if(available_rooms.length == 0 ) do
        raise 'No room Available'
      end

      #Many cases
        #    (1..requested_rooms).each do | res_num | do
        #    @rooms[available_rooms[res_num]] << Reservation.new ....


      #Single Case Below
      @rooms[available_rooms[0]] << Reservation.new ....

      if (is_room_available) do
        #make new reservations
        #add it it to this rooms reservations
        new_reservation = Reservation.new(requested_check_in, requested_check_out, room_num)

        return
      end
    end

  end

    def make_reservation(requested_check_in, requested_check_out)
      see_available

      @rooms.each do |room_num, reservations|
        is_room_available = true
        reservations.each do | reservation |
          if reservation.check_in == requested_check_in || reservation.check_out == requested_check_out
            raise ArgumentError.new("Date unavailable")
          elsif requested_check_in < reservation.check_out
            raise ArgumentError.new("Date unavailable")
          elsif requested_check_in >= reservation.check_in && requested_check_out >= reservation.check_out
            raise ArgumentError.new("Date unavailable")
          end # conditional

        end
        if (is_room_available) do
          #make new reservations
          #add it it to this rooms reservations
          new_reservation = Reservation.new(requested_check_in, requested_check_out, room_num)

          return
        end
      end



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

    def see_available(requested_check_in, requested_check_out)

      available_rooms = []

      @rooms.each do |room_num, reservations|
        reservations.each do |reservation|

          if requested_check_in >= reservation.check_in
            && requested_check_out <= reservation.check_out
            next

          elsif requested_check_in < reservation.check_in && requested_check_out <= reservation.check_out
            next

          elsif requested_check_in >= reservation.check_in && requested_check_out >= reservation.check_out
          end
        end
        available_rooms << room_num
      end
      return available_rooms
    end

    # requested_date = Hotel::Reservation.parse_date(requested_date)
    #
    #   unavailable_rooms = []
    #
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
    #
    #
    #   return @rooms.find_all do |room_no|
    #     !unavailable_rooms.include? room_no
    #   end


  end # see_available

end # class
end # module
