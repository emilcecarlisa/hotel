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

  # it "creates rooms array, numbered 1-20, on initialization" do
  #   admin = Hotel::Administrator.new
  #   admin.must_be_instance_of Hotel::Administrator
  # end


end
