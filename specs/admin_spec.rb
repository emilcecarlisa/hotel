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

    it "view rooms not available for a given date range" do
      @admin.see_reservation("24/12/2018", "30/12/2018")

      # return room if the dates aren't overlapping
      # room numbers associated with that reservation are thus unavailable
      # there are no pre-set available rooms
    end
  end # admin viewing
end # Admin
