require_relative 'spec_helper'
require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/admin'

describe "Admin" do
  before do
    @admin = Hotel::Administrator.new()
  end

  it "initializes an Administrator" do
    @admin.must_be_instance_of Hotel::Administrator
  end

  it "can make a reservation" do
    @admin.make_reservation("24/12/2018","25/12/2018")

    result = @admin.reservations

    result.first.check_in.must_equal("2018-12-24")
    result.first.check_out.must_equal("2018-12-25")

  end

  it "can see the reservations" do
    # Arrange
    @admin.make_reservation("24/12/2018","01/01/2019")
    # Act
    result = @admin.reservations
    # Assert
    result.first.check_in.must_equal("24/12/2018")

  end

  # it "calculates the duration of the trip" do
  # end

  # it "doesn't charge guest for last night" do
  # end
end
