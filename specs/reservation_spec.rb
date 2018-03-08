require_relative 'spec_helper'
require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/admin'

describe "Reservation" do
  before do
    @reserve1 = Hotel::Reservation.new("30/10/2019","30/10/2018")
  end

  it "creates an instance of a reservation" do
    @reserve1.must_be_instance_of Hotel::Reservation
  end

  it "raises an error if an invalid date range provided" do
    today = Time.now
    check_out = today.strftime("%d/%m/%Y")
    check_in = Date.parse("29/10/2019")

    proc {@reserve1.check_dates}.must_raise ArgumentError
  end
end

describe "checks the lenth of stay" do
  before do
    @admin = Hotel::Administrator.new()
    # @reserve1 = Hotel::Reservation.new("24/12/2018","25/12/2018")
  end

  it "checks the duration of the reservation" do
    reserve1 = @admin.make_reservation("24/12/2018", "25/12/2018")

    check_in = Date.parse("24/12/2018")
    check_out = Date.parse("25/12/2018")

    stay_length = reserve1.get_duration(check_in, check_out)

    stay_length.must_equal(1)
  end

  # it "gets the total cost of a stay " do
  #
  # end


end
