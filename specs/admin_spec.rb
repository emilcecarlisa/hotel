require_relative 'spec_helper'
require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/admin'

describe "Admin" do
  describe  "Initialize" do
    before do
      @admin = Hotel::Administrator.new()
    end

    it "initializes an Administrator" do
      @admin.must_be_instance_of Hotel::Administrator
    end
  end

  describe "make reservations" do
    before do
      @admin = Hotel::Administrator.new()
    end

    it "can make a reservation" do
      @admin.make_reservation("24/12/2018", "25/12/2018", 1)

      result = @admin.reservations

      result.first.check_in.must_be_instance_of DateTime
      result.first.check_out.must_be_instance_of DateTime
    end

    it "can retrieve all reservations" do
      # Arrange
      @admin.make_reservation("24/12/2018", "25/12/2018", 1)
      # Act
      result = @admin.reservations
      # Assert
      result.first.check_in.must_be_instance_of DateTime
    end
  end

  describe "return reservations" do
    before do
      @admin = Hotel::Administrator.new()
      @admin.make_reservation("24/12/2018", "25/12/2018", 1)
    end

    it "can call all reservation on a given date" do
      get_reservation = @admin.call_reservation("24/12/2018", "25/12/2018")

      get_reservation.must_be_instance_of Hotel::Reservation
    end
  end

  describe "admin viewing available rooms" do
    before do
      @admin = Hotel::Administrator.new()
      @admin.make_reservation("24/12/2018", "30/12/2018", 1)
    end

    it "view rooms not reserved for a given date range" do
      available_rooms = @admin.see_available("24/12/2018")

      available_rooms.must_equal (2..20).to_a
    end

    it "returns an error if requested reservation has same date as an existing reservation" do
      @admin.make_reservation("24/12/2018", "30/12/2018", 0)
      # assign room_num from the rooms instance variable?



    end

    it "returns an error if requested reservation overlaps in the back" do
      @admin.make_reservation("30/12/2018", "02/01/2019", 0)
      # have one appt, try to make another
    end

    it "returns an error if requested reservation overlaps in the front" do
      @admin.make_reservation("20/12/2018", "24/12/2018", 0)
      # have one appt, try to make another
    end

    it "returns an error if requested reservation is completely contained" do
      @admin.make_reservation("26/12/2018", "27/12/2018", 0)
      # have one appt, try to make another
    end

    it "returns an error if requested reservation is completely containing an existing reservation" do
      @admin.make_reservation("23/12/2018", "01/01/2019", 0)
      # have one appt, try to make another
    end
    # it "return all rooms if the array is empty" do
    #
    # end

  end # admin viewing
end # Admin
