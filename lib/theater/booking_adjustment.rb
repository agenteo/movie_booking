module Theater

  class BookingAdjustment
    attr_reader :adjustments
    TIER_PRICE_ADJUSTMENTS = { three_d: 3, balcony: 2 }

    def initialize(booking, adjustments)
      @booking = booking
      @adjustments = adjustments
    end

    def total
      total_adjustments = 0
      adjustments.each do |adjustment|
        total_adjustments += calculated_adjustment(adjustment)
      end

      @booking.total + total_adjustments
    end

    private
      
      def calculated_adjustment(adjustment)
        total_people = @booking.people.values.inject(:+)
        total_people * TIER_PRICE_ADJUSTMENTS[adjustment]
      end
    
  end
end
