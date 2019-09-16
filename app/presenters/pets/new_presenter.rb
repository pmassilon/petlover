module Pets
  class NewPresenter < Pets::BasePresenter
    def initialize(pet)
      @new_pet = pet
    end

    def call
      hash = {
        object: new_pet,
        new_record?: true,
        kinds: kinds,
        form: {
          path: person_pets_path,
          method: :post
        },
        **pet(new_pet)
      }

      hash
    end

    private

    attr_reader :new_pet
  end
end
