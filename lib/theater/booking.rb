module Theater

  class Booking
    attr_reader :people
    TIERS = { ga: 11, student: 8,
              senior: 6, children: 5.50}

    def initialize(people)
      @people = people
    end

    def total
      return 0 if people.empty?
      grand_total = 0
      people.each do |tier, quantity|
        grand_total += quantity * TIERS[tier]
      end
      grand_total
    end

  end


end
