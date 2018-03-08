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

  it "checks the duration of the reservation" do
    reserve1 = Hotel::Reservation.new("24/12/2018", "26/12/2018")

    reserve1.get_stay_length.must_equal(2)
  end
end

describe "returns the cost of the reservation" do

  it "gets the total cost of a stay " do
    reserve1 = Hotel::Reservation.new("24/12/2018", "26/12/2018")

    reserve1.total_cost.must_equal(200)
  end


end
