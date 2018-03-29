## would have to put number of rooms to be instantiated in the reservation parameters and adjust from there?

require "pry"
require "date"

module Hotel
  class Administrator

    attr_reader :rooms

    def initialize()
      @rooms = {}
      @blocks = []

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

      # #Many cases (block rooms)
      #    (1..requested_rooms).each do | res_num | do
      #    @rooms[available_rooms[res_num]] << Reservation.new ....

      #Single case below
      room = Hotel::Reservation.new({check_in: requested_check_in, check_out: requested_check_out}) #first available room is chosen and pushed to @rooms array for that room
      @rooms[available_rooms[0]] << room

      return room

    end

    def block_room(requested_check_in, requested_check_out, room_amt)
      available_rooms = see_available(requested_check_in, requested_check_out)

      if available_rooms.length < room_amt
        raise ArgumentError.new('No rooms available')
      end

      blocked_rooms = available_rooms[0, room_amt]

      block = Hotel::ReservationBlock.new({
        check_in: requested_check_in,
        check_out: requested_check_out,
        blocked_rooms: blocked_rooms
        })

        @blocks << block

        return block
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

        @block_room.each do |


        return available_rooms
      end # see_available

    end # class
  end # module


  # mayo = Hotel::Administrator.new()
  # mayo.make_reservation("05/05/2018", "05/10/2018")
