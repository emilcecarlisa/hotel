require "pry"

module Hotel

  class Reservation
    COST = 200

    attr_reader :check_in, :check_out, :parse_date, :room_num

    def initialize(check_in, check_out, room_num)
      @check_in = Reservation.parse_date(check_in)
      @check_out = Reservation.parse_date(check_out)
      @room_num = room_num
    end

    def self.parse_date(date) # self necessary for calling class
      return DateTime.strptime(date, "%d/%m/%Y")
    end

    def check_dates
      if @check_in > @check_out
        raise ArgumentError.new("End date should be after the start date")
      end
    end

    def get_stay_length
      (@check_out - @check_in).to_i
    end

    def total_cost
      return (COST * (get_stay_length - 1))
    end


  end # class

end #  module
