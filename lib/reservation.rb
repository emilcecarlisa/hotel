# time available for reservation (date range?)


module Hotel
  class Reservation
    # room is available if someone has not chosen that date
    # change to occupied after date is chosen
    attr_reader :check_in, :check_out

    def initialize(check_in, check_out)
      @check_in = parse_date(check_in)
      @check_out = parse_date(check_out)
    end

    def parse_date(date)
      return Date.parse(date)
    end

    def check_dates
      if @check_in > @check_out
        raise ArgumentError.new("End date should be after the start date")
      end
    end


  end # class

end #  module

# customer1 = Hotel::Reservation.new(1,13, "12/2/2018", "12/3/2018")
