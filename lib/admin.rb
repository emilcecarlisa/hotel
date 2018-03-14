## would have to put number of rooms to be instantiated in the reservation parameters and adjust from there?

require "pry"
require "date"

module Hotel
  class Administrator

    attr_reader :rooms

    def initialize()
      @rooms = {}

      (1..20).each do |room_num|
        @rooms[room_num] = []
      end
      # binding.pry

    end


    def make_reservation(requested_check_in, requested_check_out)
      #  def make_reservation(requested_check_in, requested_check_out, number_of_rooms = 1)

      available_rooms = see_available(requested_check_in, requested_check_out) #calls available rooms based on given dates

      if available_rooms.length == 0
        raise ArgumentError.new('No rooms available')
      end

      #Many cases (block rooms)
         (1..requested_rooms).each do | res_num | do
         @rooms[available_rooms[res_num]] << Reservation.new ....

      #Single case below
      @rooms[available_rooms[0]] << Reservation.new({check_in: requested_check_in, check_out: requested_check_out}) #first available room is chosen and pushed to @rooms array for that room

    end


    def see_available(requested_check_in, requested_check_out)
      parsed_req_in = DateTime.strptime(requested_check_in, "%d/%m/%Y")
      parsed_req_out = DateTime.strptime(requested_check_out, "%d/%m/%Y")

      available_rooms = []

      @rooms.each do |room_num, reservations|
        reservations.each do |reservation|

          if parsed_req_in >= reservation.check_in && parsed_req_out <= reservation.check_out
            next

          elsif parsed_req_in < reservation.check_in && parsed_req_out <= reservation.check_out
            next

          elsif parsed_req_in >= reservation.check_in && parsed_req_out >= reservation.check_out
          end # if conditional

        end
        available_rooms << room_num
      end
      return available_rooms
    end # see_available

  end # class
end # module
