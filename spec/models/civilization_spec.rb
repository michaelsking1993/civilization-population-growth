require "rails_helper"

RSpec.describe Civilization do
  describe "#change_population" do
    let(:civilization) { create(:civilization, population: "100", growth_rate: 0.3, current_year: 2000, name: "Sample Population") }

    # POPULATION GROWTH FORMULA:
    # population(years) = initial_population * ((1 + growth_rate) ** number_of_years_change)

    YEAR_CHANGES = [1, 10, -1, -10]

    YEAR_CHANGES.each do |year_change|
      context "when the year changes by #{year_change}" do
        it "changes the population accordingly" do
          expected_new_population = (100*((1+0.3)**year_change)).floor # 100 is the starting population

          civilization.change_population(year_change: year_change)

          civilization.reload
          expect(civilization.population.to_i).to eq(expected_new_population)
          expect(civilization.current_year).to eq(2000 + year_change)
        end
      end
    end
  end
end