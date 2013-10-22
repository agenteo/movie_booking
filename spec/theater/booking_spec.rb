require 'spec_helper'

module Theater
  describe Booking do

    context "without entries" do
      let(:people) { {} }
      it "should return zero" do
        booking = Booking.new(people)
        booking.total.should == 0
      end
    end

    context "with one entry in GA" do
      let(:people) { { ga: 1 } }
      it "should return 11$" do
        booking = Booking.new(people)
        booking.total.should == 11
      end
    end

    context "with two entries in GA" do
      let(:people) { { ga: 2 } }
      it "should return 22$" do
        booking = Booking.new(people)
        booking.total.should == 22
      end
    end

    context "with one entry in Student" do
      let(:people) { { student: 1 } }
      it "should return 8$" do
        booking = Booking.new(people)
        booking.total.should == 8
      end
    end

    context "with one GA entry and one Student" do
      let(:people) { { ga: 1, student: 1 } }
      it "should return 19$" do
        booking = Booking.new(people)
        booking.total.should == 19
      end
    end

    context "with one GA, one Student, one Senior, one Children" do
      let(:people) { { ga: 1, student: 1, senior: 1, children: 1} }
      it "should return 30.50$" do
        booking = Booking.new(people)
        booking.total.should == 30.50
      end
    end
  end
end
