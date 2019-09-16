module Pets
  class EditPresenter < Pets::BasePresenter
    def initialize(pet)
      @edit_pet = pet
    end

    def call
      hash = {
        object: edit_pet,
        new_record?: false,
        kinds: kinds,
        form: {
          path: person_pet_path(edit_pet),
          method: :put
        },
        **pet(edit_pet)
      }

      hash
    end

    private

    attr_reader :edit_pet
  end
end
