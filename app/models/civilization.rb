class Civilization < ApplicationRecord
  validates :name, :population, :growth_rate, :current_year, presence: true
  validates :growth_rate, :population, :current_year, numericality: { greater_than: 0 }

  # Changes the population of a civilization according to the following formula:
  # population(years) = initial_population * ((1 + growth_rate) ** number_of_years_change)
  def change_population(year_change:)
    new_population = population.to_i * ((1 + growth_rate) ** year_change)
    # round down to nearest whole number. Infant mortality and such.
    update!(population: new_population.floor.to_s, current_year: current_year + year_change)
  end
end
