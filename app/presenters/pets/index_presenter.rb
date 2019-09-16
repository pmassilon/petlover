module Pets
  class IndexPresenter < Pets::BasePresenter
    def initialize(pets)
      @pets = pets
    end

    def call
      hash = {
        pets: pets.map { |pet| pet(pet) },
        links: {
          new: {
            path: new_person_pet_path,
            method: :get
          },
        }
      }

      hash[:total_monthly_cost] = number_to_currency(hash[:pets].sum { |h| h[:monthly_cost][:value] })
      hash[:quarterly_cost] = number_to_currency(hash[:pets].sum { |h| h[:quarterly_cost][:value] })

      hash
    end

    private

    attr_reader :pets
  end
end
