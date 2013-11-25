require 'spec_helper'

module Theater

  describe BookingAdjustment do

    context "with booking for 4 GA", focused_integration: true do
      let(:people) { { ga: 4 } }
      let(:adjustment) { [:three_d] }
      let(:booking) { Booking.new(people) }

      context "adjusted for 3D show" do
        it "should return $56" do
          adjusted_booking = BookingAdjustment.new(booking, adjustment)
          adjusted_booking.total.should == 56
        end
      end
    end

    context "with booking for 1 GA" do
      let(:people) { { ga: 1 } }
      let(:booking) { double('Booking', total: 11, people: people) }
      let(:adjustment) { [:three_d] }
      let(:expected_result) { 14 }

      context "adjusted for 3D show" do
        it "should return $14" do
          adjusted_booking = BookingAdjustment.new(booking, adjustment)
          adjusted_booking.total.should == expected_result
        end
      end

      context "adjusted for 3D and balcony show" do
        let(:adjustments) { [:three_d, :balcony] }
        let(:expected_result) { 16 }
        it "should return $16" do
          adjusted_booking = BookingAdjustment.new(booking, adjustments)
          adjusted_booking.total.should == expected_result
        end
      end
    end
    
  end
end
