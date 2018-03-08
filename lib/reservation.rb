# time available for reservation (date range?)
require "pry"

module Hotel

  class Reservation
    # room is available if someone has not chosen that date
    # change to occupied after date is chosen
    COST = 200

    attr_reader :check_in, :check_out, :parse_date

    def initialize(check_in, check_out)
      @check_in = Reservation.parse_date(check_in)
      @check_out = Reservation.parse_date(check_out)
    end

    def self.parse_date(date) # self necessary for calling class
      return DateTime.strptime(date, "%d/%m/%Y")
    end

    def check_dates
      if @check_in > @check_out
        raise ArgumentError.new("End date should be after the start date")
      end
    end

    def get_duration(check_in, check_out)
      (@check_out - @check_in).to_i
      # puts "THIS IS CHECK IN DATE #{call_reservation.check_in}"
    end

    def total_cost
      #get_reserved_dates.check_in...get_reserved_dates.check_out
      stay_length = @reservations.get_duration(check_in, check_out)

      return COST * stay_length

    end



  end # class


end #  module
