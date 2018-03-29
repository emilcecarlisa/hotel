
require "pry"

module Hotel

  class Reservation
    COST = 200

    attr_reader :check_in, :check_out  #, :room_num

    def initialize(input)
      @check_in = Reservation.parse_date(input[:check_in])
      @check_out = Reservation.parse_date(input[:check_out])
    end

    def self.parse_date(date) # self necessary for calling class
      return DateTime.strptime(date, "%d/%m/%Y")
    end

    def check_dates
      if @check_in > @check_out
        raise ArgumentError.new("Dates unavailable")
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
