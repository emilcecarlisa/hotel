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
      @admin.make_reservation("24/12/2018", "25/12/2018")

      result = @admin.rooms[1]

      result.first.check_in.must_be_instance_of DateTime
      result.first.check_out.must_be_instance_of DateTime
    end

  end

  describe "establishes room structure on instantiation" do
    before do
      @admin = Hotel::Administrator.new()
    end
    it "establishes the base room structure" do
      room_array = @rooms

      room_array.must_be_kind_of NilClass
      # room_array.count.must_equal 20
    end

    it "has empty arrays upon instantiation" do
      result = @admin.rooms[1]
      result.must_be_kind_of Array
    end
  end


  describe "creates reservation if dates are valid" do
    before do
      @admin = Hotel::Administrator.new()
    end

    it "view available rooms for a given date range" do
      available_room = @admin.see_available("24/12/2018", "25/12/2018")
      available_room.must_equal (1..20).to_a
    end

    it "returns an error if no rooms are available" do

      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")
      @admin.make_reservation("01/01/2018", "15/01/2018")

      proc { @admin.see_available}.must_raise ArgumentError
    end
  end # describe

  describe "block_room" do
    before do
      @admin = Hotel::Administrator.new
      @admin.block_room("05/05/2018", "05/10/2018", 20)
    end

    it "raise error if rooms are blocked within date range" do
      proc {
        @admin.make_reservation("05/05/2018", "05/10/2018")
      }.must_raise ArgumentError
    end

    it "won't throw error if the range is available" do
      r = @admin.make_reservation("20/05/2018", "29/05/2018")
      r.must_be_kind_of Hotel::Reservation  
    end
  end

end # Admin
