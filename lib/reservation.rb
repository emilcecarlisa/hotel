# time available for reservation (date range?)
require "pry"

module Hotel

  class Reservation
    # room is available if someone has not chosen that date
    # change to occupied after date is chosen
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


  end # class


end #  module
