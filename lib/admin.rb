require "pry"
require "date"

module Hotel
  class Administrator

    attr_reader :reservations


    def initialize()
      @rooms = {}

      (1..20).each do |room_num| #creates arrays where room_num is key
        @rooms[room_num] = []
      end
      # binding.pry
    end


    def make_reservation(requested_check_in, requested_check_out)
      available_rooms = see_available(requested_check_in, requested_check_out) #calls available rooms based on given dates

      if available_rooms.length == 0
        raise ArgumentError.new('No rooms available')
      end

      #Many cases (block rooms)
      #    (1..requested_rooms).each do | res_num | do
      #    @rooms[available_rooms[res_num]] << Reservation.new ....

      #Single Case Below
      @rooms[available_rooms[0]] << Reservation.new(requested_check_in, requested_check_out,) #the first available room is chosen and pushed to @rooms array for that room

    end


    def see_available(requested_check_in, requested_check_out)

      available_rooms = []

      @rooms.each do |room_num, reservations|
        reservations.each do |reservation|

          if requested_check_in >= reservation.check_in && requested_check_out <= reservation.check_out
            next

          elsif requested_check_in < reservation.check_in && requested_check_out <= reservation.check_out
            next

          elsif requested_check_in >= reservation.check_in && requested_check_out >= reservation.check_out
          end # if conditional

        end
        available_rooms << room_num
      end
      return available_rooms
    end # see_available

  end # class
end # module
